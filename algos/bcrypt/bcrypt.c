/**
 * This password hashing algorithm was designed by David Mazieres
 * <dm@lcs.mit.edu> and works as follows:
 *
 * 1. state := InitState ()
 * 2. state := ExpandKey (state, salt, password)
 * 3. REPEAT rounds:
 *      state := ExpandKey (state, 0, password)
 *	state := ExpandKey (state, 0, salt)
 * 4. ctext := "OrpheanBeholderScryDoubt"
 * 5. REPEAT 64:
 * 	ctext := Encrypt_ECB (state, ctext);
 * 6. RETURN Concatenate (salt, ctext);
 *
 */

#include "blf.h"

/* This implementation is adaptable to current computing power.
 * You can have up to 2^31 rounds which should be enough for some
 * time to come.
 */

#define BCRYPT_VERSION '2'
#define BCRYPT_MAXSALT 16	/* Precomputation is just so nice */
#define BCRYPT_WORDS 6		/* Ciphertext words */
#define BCRYPT_MINLOGROUNDS 4	/* we have log2(rounds) in salt */

#define	BCRYPT_SALTSPACE	(7 + (BCRYPT_MAXSALT * 4 + 2) / 3 + 1)
#define	BCRYPT_HASHSPACE	61

char   *bcrypt_gensalt(uint8_t);

static int encode_base64(char *, const uint8_t *, size_t);
static int decode_base64(uint8_t *, size_t, const char *);

/*
 * Generates a salt for this version of crypt.
 */
static int bcrypt_initsalt(int log_rounds, uint8_t *salt, size_t saltbuflen)
{
	uint8_t csalt[BCRYPT_MAXSALT];

	if (saltbuflen < BCRYPT_SALTSPACE) {
		errno = EINVAL;
		return -1;
	}

	//arc4random_buf(csalt, sizeof(csalt));

	if (log_rounds < 4)
		log_rounds = 4;
	else if (log_rounds > 31)
		log_rounds = 31;

	_snprintf(salt, saltbuflen, "$2b$%2.2u$", log_rounds);
	encode_base64(salt + 7, csalt, sizeof(csalt));

	return 0;
}

/*
 * the core bcrypt function
 */
static int bcrypt_hashpass(const char *key, const char *salt, char *encrypted, size_t encryptedlen)
{
	blf_ctx  state;
	uint32_t rounds, i, k;
	uint16_t j;
	size_t   key_len;
	uint8_t  salt_len, logr, minor;
	uint8_t  ciphertext[4 * BCRYPT_WORDS] = "OrpheanBeholderScryDoubt";
	uint8_t  csalt[BCRYPT_MAXSALT];
	uint32_t cdata[BCRYPT_WORDS];

	if (encryptedlen < BCRYPT_HASHSPACE) {
		printf ("\n  insufficient buffer space provided");
    goto inval;
  }
	/* Check and discard "$" identifier */
	if (salt[0] != '$') {
    printf ("\n  invalid salt");
		goto inval;
  }
	salt += 1;

	if (salt[0] != BCRYPT_VERSION) {
		printf ("\n  incompatible version");
    goto inval;
  }
	/* Check for minor versions */
	switch ((minor = salt[1])) {
	case 'a':
		key_len = (uint8_t)(strlen(key) + 1);
		break;
	case 'b':
		/* strlen() returns a size_t, but the function calls
		 * below result in implicit casts to a narrower integer
		 * type, so cap key_len at the actual maximum supported
		 * length here to avoid integer wraparound */
		key_len = strlen(key);
		if (key_len > 72)
			key_len = 72;
		key_len++; /* include the NUL */
		break;
  case 'y':
    break;
	default:
		 goto inval;
	}
	if (salt[2] != '$') {
    printf ("\n  invalid salt");
		goto inval;
  }
	/* Discard version + "$" identifier */
	salt += 3;

	/* Check and parse num rounds */
	if (!isdigit((unsigned char)salt[0]) || !isdigit((unsigned char)salt[1]) || salt[2] != '$')
  {
    printf ("\n  invalid rounds %c %c", salt[0], salt[1]);
		goto inval;
  }
	logr = atoi(salt);
	if (logr < BCRYPT_MINLOGROUNDS || logr > 31) {
    printf ("\n  invalid rounds %i", logr);
		goto inval;
  }
	/* Computer power doesn't increase linearly, 2^x should be fine */
	rounds = 1U << logr;

	/* Discard num rounds + "$" identifier */
	salt += 3;

	if (strlen(salt) * 3 / 4 < BCRYPT_MAXSALT) {
    printf ("\n  invalid salt length");
		goto inval;
  }

	/* We dont want the base64 salt but the raw data */
	if (decode_base64 (csalt, BCRYPT_MAXSALT, salt)) {
    printf ("\n base64 decode failed");
		goto inval;
  }
	salt_len = BCRYPT_MAXSALT;

	/* Setting up S-Boxes and Subkeys */
	Blowfish_initstate (&state);
	Blowfish_expandstate (&state, csalt, salt_len, (uint8_t *) key, key_len);
      
	for (k = 0; k < rounds; k++) {
		Blowfish_expand0state (&state, (uint8_t *) key, key_len);
		Blowfish_expand0state (&state, csalt, salt_len);
	}

	/* This can be precomputed later */
	j = 0;
	for (i = 0; i < BCRYPT_WORDS; i++)
		cdata[i] = Blowfish_stream2word(ciphertext, 4 * BCRYPT_WORDS, &j);

	/* Now do the encryption */
	for (k = 0; k < 64; k++) {
		blf_enc(&state, cdata, BCRYPT_WORDS / 2);
  }
  
	for (i = 0; i < BCRYPT_WORDS; i++) {
		ciphertext[4 * i + 3] = cdata[i] & 0xff;
		cdata[i] = cdata[i] >> 8;
		ciphertext[4 * i + 2] = cdata[i] & 0xff;
		cdata[i] = cdata[i] >> 8;
		ciphertext[4 * i + 1] = cdata[i] & 0xff;
		cdata[i] = cdata[i] >> 8;
		ciphertext[4 * i + 0] = cdata[i] & 0xff;
	}

	_snprintf (encrypted, 8, "$2%c$%2.2u$", minor, logr);
	encode_base64 (encrypted + 7, csalt, BCRYPT_MAXSALT);
	encode_base64 (encrypted + 7 + 22, ciphertext, 4 * BCRYPT_WORDS - 1);
	return 0;

inval:
	errno = EINVAL;
	return -1;
}

/*
 * user friendly functions
 */
int bcrypt_newhash(const char *pass, int log_rounds, char *hash, size_t hashlen)
{
	char salt[BCRYPT_SALTSPACE];

	if (bcrypt_initsalt(log_rounds, salt, sizeof(salt)) != 0)
		return -1;

	if (bcrypt_hashpass(pass, salt, hash, hashlen) != 0)
		return -1;
	return 0;
}

/*
 * internal utilities
 */
static const uint8_t Base64Code[] =
"./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

static const uint8_t index_64[128] = {
	255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
	255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
	255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
	255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
	255, 255, 255, 255, 255, 255, 0, 1, 54, 55,
	56, 57, 58, 59, 60, 61, 62, 63, 255, 255,
	255, 255, 255, 255, 255, 2, 3, 4, 5, 6,
	7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
	17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
	255, 255, 255, 255, 255, 255, 28, 29, 30,
	31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
	41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
	51, 52, 53, 255, 255, 255, 255, 255
};
#define CHAR64(c)  ( (c) > 127 ? 255 : index_64[(c)])

/*
 * read buflen (after decoding) bytes of data from b64data
 */
static int decode_base64(uint8_t *buffer, size_t len, const char *b64data)
{
	uint8_t       *bp = buffer;
	const uint8_t *p = b64data;
	uint8_t       c1, c2, c3, c4;

	while (bp < buffer + len) {
		c1 = CHAR64(*p);
		/* Invalid data */
		if (c1 == 255)
			return -1;

		c2 = CHAR64(*(p + 1));
		if (c2 == 255)
			return -1;

		*bp++ = (c1 << 2) | ((c2 & 0x30) >> 4);
		if (bp >= buffer + len)
			break;

		c3 = CHAR64(*(p + 2));
		if (c3 == 255)
			return -1;

		*bp++ = ((c2 & 0x0f) << 4) | ((c3 & 0x3c) >> 2);
		if (bp >= buffer + len)
			break;

		c4 = CHAR64(*(p + 3));
		if (c4 == 255)
			return -1;
		*bp++ = ((c3 & 0x03) << 6) | c4;

		p += 4;
	}
	return 0;
}

/*
 * Turn len bytes of data into base64 encoded data.
 * This works without = padding.
 */
static int encode_base64(char *b64buffer, const uint8_t *data, size_t len)
{
	uint8_t       *bp = b64buffer;
	const uint8_t *p = data;
	uint8_t       c1, c2;

	while (p < data + len) {
		c1 = *p++;
		*bp++ = Base64Code[(c1 >> 2)];
		c1 = (c1 & 0x03) << 4;
		if (p >= data + len) {
			*bp++ = Base64Code[c1];
			break;
		}
		c2 = *p++;
		c1 |= (c2 >> 4) & 0x0f;
		*bp++ = Base64Code[c1];
		c1 = (c2 & 0x0f) << 2;
		if (p >= data + len) {
			*bp++ = Base64Code[c1];
			break;
		}
		c2 = *p++;
		c1 |= (c2 >> 6) & 0x03;
		*bp++ = Base64Code[c1];
		*bp++ = Base64Code[c2 & 0x3f];
	}
	*bp = '\0';
	return 0;
}

/*
 * classic interface
 */
char *bcrypt_gensalt(uint8_t log_rounds)
{
  static char gsalt[BCRYPT_SALTSPACE];

	bcrypt_initsalt(log_rounds, gsalt, sizeof(gsalt));

	return gsalt;
}

char *bcrypt(const char *pass, const char *salt)
{
	static char gencrypted[BCRYPT_HASHSPACE];
	static char gerror[2];

	/* How do I handle errors ? Return ':' */
	strncpy(gerror, ":", sizeof(gerror));
	if (bcrypt_hashpass(pass, salt, gencrypted, sizeof(gencrypted)) != 0)
		return gerror;

	return gencrypted;
}

int main (int argc, char *argv[])
{
  char    *pwd, *salt_ptr;
  uint8_t salt[BCRYPT_SALTSPACE];
  uint32_t log_rounds=BCRYPT_MINLOGROUNDS;  // Apache use 5 as default
  char *p=salt;
  int i;
  char minor='y';
  
  memset (salt, 0, sizeof salt);
  
  if (argc < 2) {
    printf ("\n  usage: bcrypt <password> <salt> <rounds>\n");
    return 0;
  }
  pwd=argv[1];
  if (argc==3) {
    salt_ptr=argv[2];
  } else {
    srand (time(0));
    _snprintf (p, sizeof salt, 
      "$2%c$%2.2u$", minor, log_rounds);
      
    p += strlen (p);
    
    for (i=4; i<BCRYPT_MAXSALT+4; i++) {
      salt[i] = Base64Code[rand() % strlen (Base64Code)];
    }
    salt_ptr=salt;
  }
  printf ("\n  BCrypt : %s\n", bcrypt (pwd, salt_ptr));
  return 0;
}
