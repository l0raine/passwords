// Modules.h
//

typedef struct {
	DWORD dwFlags;
	char *szAbout;
	char *szHashType;
	DWORD dwReserved[13];
} MODULEINFO;

typedef struct {
	unsigned char *pBuf;
	char *szPassword;
	int nPasswordLen;
	char *szSalt;
	int nSaltLen;
	char *szName;
	int nNameLen;
	DWORD dwFlags;
	DWORD dwReserved[8];
} HASHINFO;

typedef struct {
	char *pSalt;
	char *szHash;
	int nHashLen;
	DWORD dwReserved[5];
} SALTINFO;

typedef struct {
	unsigned char *pResult;
	char *pHash;
	int nHashLen;
	DWORD dwReserved[5];
} PREPAREDHASHINFO;

typedef struct {
	unsigned char *pResult;
	char *pSalt;
	int nSaltLen;
	DWORD dwReserved[5];
} PREPAREDSALTINFO;

// Flags for MODULEINFO structure
#define MODULE_HASH_BINARY     0x00000001
#define MODULE_HASH_SIMPLE     0x00000002
#define MODULE_HASH_BASE64     0x00000004
#define MODULE_HASH_BIGENDIAN  0x00000008
#define MODULE_HASH_PREPARED   0x00000010
#define MODULE_HASH_SHORT      0x00000020

#define MODULE_SALT_BINARY     0x00000100
#define MODULE_SALT_WITH_HASH  0x00000200
#define MODULE_SALT_PREPARED   0x00000400

#define MODULE_PASS_HUGE       0x00010000

#define MODULE_NAME_UPPER      0xC0000000
#define MODULE_NAME_LOWER      0x80000000
#define MODULE_NAME_UNICODE    0x20000000

// Flags for HASHINFO structure
#define MODULE_RESULT_SHORT    0x00000001
#define MODULE_RESULT_PREPARED 0x00000002

// extern "C" __declspec(dllexport) void GetInfo(MODULEINFO *);
// extern "C" __declspec(dllexport) int GetHash(HASHINFO *);
// extern "C" __declspec(dllexport) int GetSalt(SALTINFO *);
// extern "C" __declspec(dllexport) int GetPreparedHash(PREPAREDHASHINFO *);
// extern "C" __declspec(dllexport) int GetPreparedSalt(PREPAREDSALTINFO *);
