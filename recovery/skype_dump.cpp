
#include <string>
#include <cstdio>
#include <stdint.h>

#define _WIN32_IE 0x0500

#include <windows.h>
#include <wincrypt.h>
#include <Shlwapi.h>
#include <Shlobj.h>

#pragma comment(lib, "crypt32.lib")
#pragma comment(lib, "shlwapi.lib")
#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "Shell32.lib")

#include <openssl/sha.h>
#include <openssl/md5.h>
#include <openssl/aes.h>

#include <libxml/xmlreader.h>

#define MAX_SALT_LEN 64
#define MAX_HASH_LEN 16

std::wstring bin2hex(PBYTE pbBin, DWORD dwSize) {
  wchar_t buffer[2048];
  ZeroMemory(buffer, sizeof(buffer));
  for (DWORD i = 0; i < dwSize && i < 512; i++) {
    _snwprintf(&buffer[i*2], sizeof(wchar_t)*2, L"%02x", pbBin[i]);
  }
  return buffer;
}

/********************************************************************
 *
 *  Convert a windows error code to human readable message and display
 *
 ********************************************************************/
VOID showError(DWORD dwError, PWCHAR pFmt, ...) {
  PWCHAR pDetails;
  WCHAR buffer[2048];
  
  if (pFmt != NULL) {
    va_list arglist;
    va_start(arglist, pFmt);
		wvsprintf(buffer, pFmt, arglist);
		va_end(arglist);
  }
  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
      NULL, dwError, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), 
      (LPWSTR)&pDetails, 0, NULL);

  wprintf(L"\n  %s : %s", buffer, pDetails);
  LocalFree(pDetails);
}

/**
 *
 *  Generate System key from pass phrase -> level 2
 *  Derives 128-bit value from MD5
 *
 */
BOOL GetMD5(std::wstring pwd) {
  HCRYPTPROV hProv;
  HCRYPTHASH hHash;

  if (CryptAcquireContext(&hProv, NULL, NULL, PROV_RSA_FULL,
      CRYPT_VERIFYCONTEXT)) {
    if (CryptCreateHash(hProv, CALG_MD5, 0, 0, &hHash)) {
      if (CryptHashData(hHash, (PBYTE)pwd.c_str(),
          pwd.length() * sizeof(wchar_t), 0)) {

        DWORD dwHashLen = SYSTEM_KEY_LEN;
        CryptGetHashParam(hHash, HP_HASHVAL, key, &dwHashLen, 0);
        dwError = GetLastError();
      }
      CryptDestroyHash(hHash);
    } else {
      dwError = GetLastError();
    }
    CryptReleaseContext(hProv, 0);
  } else {
    dwError = GetLastError();
  }
  return dwError == ERROR_SUCCESS;
}

/********************************************************************
 *
 *  Obtain, decrypt and return pointer to unique salt
 *  return NULL if unable to read
 *
 *  caller should free memory afterwards with LocalFree()
 *
 ********************************************************************/
BOOL GetSalt(PBYTE pbSalt) {
  BYTE aBlob[2048];
  DWORD cbSize = sizeof(aBlob);
  const char skype_path[] = "Software\\Skype\\ProtectedStorage";
  BOOL bDecrypted = FALSE;
  
  LSTATUS lStatus = SHGetValue(HKEY_CURRENT_USER, skype_path, 
      "0", 0, aBlob, &cbSize);
    
  if (lStatus == ERROR_SUCCESS) {
    DATA_BLOB in, out;
    
    in.pbData = aBlob;
    in.cbData = cbSize;
    
    bDecrypted = CryptUnprotectData(&in, NULL, NULL, NULL, NULL, 0, &out);
    if (bDecrypted) {
      memcpy(pbSalt, out.pbData, out.cbData);
      LocalFree(out.pbData);
    }
  }
  return bDecrypted;
}

/**
 *
 *  obtains and returns text of node
 *
 */
std::wstring get_text(CComPtr<IXMLDOMDocument2> pDoc, BSTR nodeString) {
  std::wstring text = L"";
  CComPtr<IXMLDOMNode> pNode = NULL;
  HRESULT hr = pDoc->selectSingleNode(nodeString, &pNode);
  if (SUCCEEDED(hr) && pNode != NULL) {
    CComPtr<IXMLDOMNode> pChild = NULL;
    hr = pNode->get_firstChild(&pChild);
    if (SUCCEEDED(hr) && pChild != NULL) {
      CComBSTR bstrText;
      hr = pChild->get_text(&bstrText);
      if (SUCCEEDED(hr)) {
        text = bstrText;
      }
    }
  }
  return text;
}

// required to parse WLAN profiles
#define WLAN_NS L"xmlns:s=\"http://www.microsoft.com/networking/WLAN/profile/v1\""

/**
 *  
 *  DumpWLANProfile(wchar_t adapterGuid[], wchar_t profileGuid[])
 *  
 *
 */
void DumpWLANProfile(wchar_t adapterGuid[], wchar_t profileGuid[]) {
  wchar_t path[MAX_PATH];
  wchar_t programData[MAX_PATH];
  
  SHGetFolderPath(NULL, CSIDL_COMMON_APPDATA, NULL, SHGFP_TYPE_CURRENT, programData);
  _snwprintf(path, MAX_PATH, L"%s\\Microsoft\\Wlansvc\\Profiles\\Interfaces\\%s\\%s.xml", 
      programData, adapterGuid, profileGuid);
  
  HRESULT hr = CoInitialize(NULL);
  if (FAILED(hr)) {
    wprintf(L"\nCoInitialize() failed : %08x", hr);
    return;
  }
  
  CComPtr<IXMLDOMDocument2> pDoc;
  hr = CoCreateInstance(CLSID_DOMDocument30, NULL, CLSCTX_INPROC_SERVER,
      IID_IXMLDOMDocument2, (void**)&pDoc);
      
  if (SUCCEEDED(hr)) {
    VARIANT_BOOL bIsSuccessful;
    hr = pDoc->load(CComVariant(path), &bIsSuccessful);
    
    if (SUCCEEDED(hr) && bIsSuccessful) {
      CComVariant ns = WLAN_NS;
      hr = pDoc->setProperty(BSTR(L"SelectionNamespaces"), ns);
  
      if (SUCCEEDED(hr)) {
        std::wstring ssid, auth, enc, key;
        ssid = get_text(pDoc, 
            BSTR(L"/s:WLANProfile/s:SSIDConfig/s:SSID/s:name"));
        auth = get_text(pDoc, 
            BSTR(L"/s:WLANProfile/s:MSM/s:security/s:authEncryption/s:authentication"));
        enc  = get_text(pDoc, 
            BSTR(L"/s:WLANProfile/s:MSM/s:security/s:authEncryption/s:encryption"));
        key  = get_text(pDoc, 
            BSTR(L"/s:WLANProfile/s:MSM/s:security/s:sharedKey/s:keyMaterial"));
        
        wprintf(L"\n  %-20s  %-10s  %-20s", ssid.c_str(), auth.c_str(), enc.c_str());
        if (!key.empty()) {
          DecryptKey(key);
        }
      } else {
        wprintf(L"\n  IXMLDOMDocument2->setProperty() failed : %08x", hr);
      }
      ns = NULL;
    } else {
      wprintf(L"\n  IXMLDOMDocument2->load() failed : %08x", hr);
    }
    pDoc = NULL;
  } else {
    wprintf(L"\n  CoCreateInstance() failed : %08x", hr);
  }
  CoUninitialize();
}

/**
 *
 *  Obtain path to config.xml and read Credentials* value
 *  return pointer to binary or NULL if couldn't be read
 * 
 *  caller should free memory pointer with LocalFree()
 *
 */
bool GetCredentials(BYTE ciphertext[], std::string config_xml) {    
    bool bFound = false;
    
    // try open config.xml
    xmlTextReaderPtr reader;
    reader = xmlReaderForFile(config_xml.c_str(), NULL, 0);
    
    // tested with Credentials2 or Credentials3
    const xmlChar *credentials; 
    credentials = (const xmlChar*)"Credentials";

    if (reader != NULL) {
    
      // while nodes are available
      while (xmlTextReaderRead(reader) == 1) {
        // get name
        const xmlChar *name;
        name = xmlTextReaderConstName(reader);
        if (name == NULL) continue;

        // equal to credentials we're searching for?
        if (xmlStrncmp(credentials, name, xmlStrlen(credentials)) == 0) {

          // read the next value
          if (xmlTextReaderRead(reader) == 1) {
            const xmlChar *value;
            value = xmlTextReaderConstValue(reader);
            
            for (int i = 0;i < 16;i++) {
              sscanf((const char*)&value[i * 2], "%02x", &ciphertext[i]);
            }
            bFound = true;
            break;
          }
        }
      }
      xmlFreeTextReader(reader);
    }
    xmlCleanupParser();
    return bFound;
}

typedef struct _DES_KEY_BLOB {
  BLOBHEADER Hdr;
  DWORD dwKeySize;
  BYTE rgbKeyData[8];
} DES_KEY_BLOB;

BYTE header[] = {0x08, 0x02, 0x00, 0x00, 0x01, 0x66, 0x00, 0x00};

/**
 *
 *  Very similar to SAM encryption
 *
 */
void decryptHash(DWORD rid, LPBYTE pbIn, LPBYTE pbOut) {
  DWORD dwDataLen;

  HCRYPTPROV hProv;
  HCRYPTKEY hKey1, hKey2;

  DES_KEY_BLOB Blob1, Blob2;

  if (CryptAcquireContext(&hProv, NULL, NULL,
      PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)) {

    // initialize keys
    rid2keys(rid, Blob1.rgbKeyData, Blob2.rgbKeyData);

    Blob1.dwKeySize = 8;
    Blob2.dwKeySize = 8;

    memcpy((void*)&Blob1.Hdr, (void*)header, 8);
    memcpy((void*)&Blob2.Hdr, (void*)header, 8);

    // import keys
    CryptImportKey(hProv, (BYTE*)&Blob1, sizeof(Blob1),
        0, CRYPT_EXPORTABLE, &hKey1);

    CryptImportKey(hProv, (BYTE*)&Blob2, sizeof(Blob2),
        0, CRYPT_EXPORTABLE, &hKey2);

    dwDataLen = 8;
    CryptDecrypt(hKey1, NULL, TRUE, 0, pbIn, &dwDataLen);
    memcpy(pbOut, pbIn, 8);

    dwDataLen = 8;
    CryptDecrypt(hKey2, NULL, TRUE, 0, pbIn+8, &dwDataLen);
    memcpy(pbOut+8, pbIn+8, 8);

    CryptDestroyKey(hKey2);
    CryptDestroyKey(hKey1);

    CryptReleaseContext(hProv, 0);
  }
}

BYTE privateKey[] = 
    {1,2,3,4,5,6,7,8,9,10,
    11,12,13,14,15,16,17,18,19,20,
    21,22,23,24,25,26,27,28,29,30,
    31,32};
BYTE iv[] = 
    {1,2,3,4,5,6,7,8,9,10,
    11,12,13,14,15,16};

struct aes256keyBlob
{
    BLOBHEADER hdr;
    DWORD keySize;
    BYTE bytes[32];
} blob;

blob.hdr.bType = PLAINTEXTKEYBLOB;
blob.hdr.bVersion = CUR_BLOB_VERSION;
blob.hdr.reserved = 0;
blob.hdr.aiKeyAlg = CALG_AES_256;
blob.keySize = 32;
memcpy(blob.bytes, myPrivateKey, 32);

HCRYPTKEY hKey;
if (CryptImportKey(hCryptProv, (BYTE*)&blob, sizeof(aes256keyBlob), NULL, 0, &hKey))
{
    if(CryptSetKeyParam(hKey, KP_IV, myIV, 0))
    {
    	//do decryption here
    }
    else{/*error*/}

    CryptDestroyKey(hKey);
}
else{/*error*/}

/**
 *
 *  Decrypt the ciphertext to reveval MD5 hash of users password
 *
 */
void DecryptHash(PBYTE pbCipherText, PBYTE pbSalt, DWORD cbSalt) {
    
    SHA_CTX ctx;
    AES_KEY key;
    
    uint8_t dgst[40], buffer[AES_BLOCK_SIZE];
    
    memset(&buffer, 0, sizeof(buffer));
    
    // use counter mode + SHA-1 to generate key
    for (ULONG i = 0;i < 2;i++) {
        ULONG ulIndex = _byteswap_ulong(i);
          
        SHA1_Init(&ctx);
        SHA1_Update(&ctx, &ulIndex, sizeof(ulIndex));
        SHA1_Update(&ctx, pbSalt, cbSalt);
        SHA1_Final(&dgst[i*20], &ctx);
    }
    
    AES_set_encrypt_key(dgst, 256, &key);
    AES_encrypt(buffer, buffer, &key);
    
    printf("\n  MD5 hash = ");
    
    // decrypt MD5 hash with XOR
    for (int i = 0;i < 16;i++) {
        printf("%02x", pbCipherText[i] ^ buffer[i]);
    }
    printf("\n");
}

/**
 *
 *  Initial info found in http://www.recon.cx/en/f/vskype-part2.pdf
 *
 */
void GenHash(const char *id, const char *pwd) {
    MD5_CTX ctx;
    const char *skype = "\nskyper\n";
    uint8_t dgst[32];
    
    MD5_Init(&ctx);
    MD5_Update(&ctx, id, strlen(id));
    MD5_Update(&ctx, skype, strlen(skype));
    MD5_Update(&ctx, pwd, strlen(pwd));
    MD5_Final(dgst, &ctx);

    printf("\n  Login ID = %s"
           "\n  Password = %s"
           "\n  MD5 hash = ", id, pwd);
    
    for (int i = 0;i < 16;i++) {
        printf("%02x", dgst[i]);
    }
    printf("\n");
}

/**
 *
 *  Try to retrieve path of config.xml from current users profile
 *
 */
bool GetXMLPath(std::string &AppData) {
    WIN32_FIND_DATA wfd;
    HANDLE hFind = FindFirstFile((AppData + "\\*.*").c_str(), &wfd);
    bool bFound = false;
    
    if (hFind != INVALID_HANDLE_VALUE) {
        do {
            if (wfd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
                std::string name = wfd.cFileName;
                
                if (name != "." && name != "..") {
                    std::string path = AppData + "\\" + name + "\\config.xml";            
                    DWORD dwAttributes = GetFileAttributes(path.c_str());
                    
                    if (dwAttributes != INVALID_FILE_ATTRIBUTES) {
                        AppData = path;
                        bFound = true;
                        break;
                    }
                }
            }
        } while (FindNextFile(hFind, &wfd));
        FindClose(hFind);
    }
    return bFound;
}

void exit_app(const char exit_msg[]) {
    printf("%s\n  Press any key to continue . . .", exit_msg);
    fgetc(stdin);
    exit(0);
}

int main(int argc, char *argv[]) {

    std::string config_xml;

    // try to retrieve the path if no parameters specified
    if (argc == 1) {
      CHAR lpszPath[MAX_PATH];
      
      if (!SHGetSpecialFolderPath(NULL, lpszPath, 
          CSIDL_APPDATA, FALSE)) {
        exit_app("  Unable to determine \"Application Data\" folder\n");
      }
      config_xml = lpszPath;
      config_xml += "\\Skype";
      
      if (!GetXMLPath(config_xml)) {
        exit_app("  Unable to locate config.xml\n");
      }
      
    // else if we have just 1 argument, assume it's path of config.xml
    } else if (argc == 2) {
      config_xml = argv[1];
      
    // else if 2 arguments, treat as username + password combination
    } else if (argc == 3) {
        GenHash(argv[1], argv[2]);   
        exit_app("");
    // else show arguments 
    } else {
      exit_app("\n  Usage: skype_dump <config.xml> | <username> <password>\n");
    }
    
    // try read the salt value first
    DWORD cbSalt = 0;
    PBYTE pbSalt = NULL;
    
    pbSalt = GetSalt(cbSalt);
    
    if (pbSalt != NULL) {
      BYTE ciphertext[MAX_HASH_LEN];
      
      if (GetCredentials(ciphertext, config_xml)) {
        DecryptHash(ciphertext, pbSalt, cbSalt);
      } else {
        printf("\n  Unable to obtain encrypted hash from config.xml");
      }
    } else {
      printf("\n  Unable to obtain salt.");
    }
    exit_app("");
    return 0;
}
