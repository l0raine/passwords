
// MS-CHAP v1 + v2 PasswordsPro module

#include <windows.h>
#include "Modules.h"

extern "C" void ntlm1_hash(char*,unsigned int,unsigned char*);
extern "C" void DES_set_key(unsigned char*,unsigned char*);
extern "C" void str_to_key(unsigned char*,unsigned char*);
extern "C" void _des_encrypt(unsigned char*,unsigned char*,int);

BOOL APIENTRY DllMain(HANDLE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	return TRUE;
}

extern "C" __declspec(dllexport) void GetInfo(MODULEINFO *info)
{
	info->dwFlags = MODULE_HASH_BINARY | MODULE_SALT_BINARY | MODULE_HASH_SHORT;
	info->szAbout = "PasswordsPro Module for MS-CHAP v1 + v2\n";
	info->szHashType = "MS-CHAP";
}

extern "C" __declspec(dllexport) int GetHash(HASHINFO *info)
{
	    unsigned char nt_hash[21]={0};
		unsigned char nt_challenge[8];
		unsigned char des_key[8];
		unsigned char ks[128];
		unsigned char nt_response[8]={0};

		// generate the nt hash first
        ntlm1_hash(info->szPassword,info->nPasswordLen,nt_hash);

		// check if last 16-bits are equal to known 3rd DES key
		if(nt_hash[14] == ((unsigned char*)info->szSalt)[8] && 
			nt_hash[15] == ((unsigned char*)info->szSalt)[9])
		{
			// store 8 byte challenge
			memcpy(nt_challenge,info->szSalt,8);

			// generate 1st DES key
			str_to_key(nt_hash,des_key);

			// create key schedule
			DES_set_key(des_key,ks);
			
			// encrypt the challenge
			_des_encrypt(nt_challenge,ks,1);
			memcpy(&info->pBuf[0],nt_challenge,8);

			return(8);
		}
		memset(info->pBuf,0,24);
		return(24);
}
