#ifndef _DES_H
#define _DES_H

typedef unsigned long DES_LONG;

typedef unsigned char DES_cblock[8];

typedef struct DES_ks
    {
    union
	{
	DES_cblock cblock;
	/* make sure things are correct size on machines with
	 * 8 byte longs */
	DES_LONG deslong[2];
	} ks[16];
    } DES_key_schedule;


void str_to_key(unsigned char *str, unsigned char *key);
void des_set_odd_parity(DES_cblock *);

void DES_ecb_encrypt(DES_cblock *input, DES_cblock *output,DES_key_schedule *ks);
void DES_set_key(DES_cblock *key, DES_key_schedule *schedule);
void DES_encrypt1(DES_LONG *data, DES_key_schedule *ks);

#endif
