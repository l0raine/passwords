

wchar_t *alphabet;
wchar_t *dictionary;
wchar_t *end_pass;
wchar_t *hash_string;
wchar_t *start_pass;
wchar_t *resume_file;
wchar_t *username;
wchar_t *hash_type;

__int64 total;
__int64 complete;
__int64 remaining;

unsigned char hash_binary[256];
size_t hash_len;

wchar_t wszAlphabet[256];
size_t nAlphabetLen;

wchar_t wszStart[256];
wchar_t wszEnd[256];

int iStart[256];
int iEnd[256];


bool getArgs(int argc, wchar_t *argv[], )
{
        wchar_t szTemp[256];

        alphabet = dictionary = end_pass = hash_string = start_pass = resume_file = username = 0;

        for(int i = 1;i < argc;i++)
        {
          ZeroMemory(szTemp,sizeof(szTemp));
          wcsncpy(szTemp,argv[i],sizeof(szTemp)/2);

          if(!_wcsnicmp(szTemp,L"-a",2))
          {
            alphabet = &argv[i][2];
            continue;
          }
          
          if(!_wcsnicmp(szTemp,L"-d",2))
          {
            dictionary = &argv[i][2];
            continue;
          }
          
          if(!_wcsnicmp(szTemp,L"-e",2))
          {
            end_pass = &argv[i][2];
            continue;
          }
          
          if(!_wcsnicmp(szTemp,L"-h",2))
          {
            hash_string = &argv[i][2];
            continue;
          }

          if(!_wcsnicmp(szTemp,L"-r",2))
          {
            resume_file = &argv[i][2];
            continue;
          }

          if(!_wcsnicmp(szTemp,L"-s",2))
          {
            start_pass = &argv[i][2];
            continue;
          }
          
          if(!_wcsnicmp(szTemp,L"-t",2))
          {
            hash_type = &argv[i][2];
            continue;
          }

          if(!_wcsnicmp(szTemp,L"-u",2))
          {
            username = &argv[i][2];
            continue;
          }

          if(!_wcsnicmp(szTemp,L"-?",2))
          {
            usage(argv[0]);
          }

          wprintf(L"\n\t[-] Unrecognised option:%s",szTemp);
          return(false);
	}
	return(true);
}


bool parseArgs()
{
        // if no alphabet and no dictionary, error out
        if(!alphabet && !dictionary)
        {
          wprintf(L"\n\t[-] No attack method selected!\n");
          return(false);
        }

        // check we have a hash
        if(!hash_string)
        {
          wprintf(L"\n\t[-] No hash supplied, nothing to do!\n");
          return(false);
        }

        // get the type for any pre-processing required
        if(!hash_type)
        {
          wprintf(L"\n\t[-] No hash-type specified!\n");
          return(false);
        }

        // convert the string to binary and do any pre-processing required
        // based on hash_type value
        if(!str2hash(hash_string,hash_binary))
        {
          wprintf(L"\n\t[-] Invalid hash supplied for type:%d - :%s\n",hash_type,hash_string);
          return(false);
        }

        // if we have alphabet, remove any duplicates and store length
        
        if(alphabet)
        {
          // remove duplicates (if any)
          sort_alphabet(alphabet);
          
          for(DWORD i = 0;i < cpus;i++)
          {
            wcsncpy(wszAlphabet,alphabet,94);
            nAlphabetLen = wcslen(wszAlphabet);
          }
          
          // we should have atleast 1 character whatever was supplied
        }

        // if no start_pass specified, use 1st character from alphabet
        // else save supplied parameter.
	if(!start_pass)
        {
          wszStart[0] = wszAlphabet[0];
        }
        else {
          wcsncpy(wszStart,start_pass,MAX_PASSLEN);
        }

        // if no end_pass specified, use 1st character from alphabet up to MAX_PASSLEN
        // else save supplied parameter.
	if(!end_pass)
        {
          for(int i = 0;i < MAX_PASSLEN;i++)
          {
            wszEnd[i] = wszAlphabet[nAlphabetLen-1];
          }
        } else {
          wcsncpy(wszEnd,end_pass,MAX_PASSLEN);
        }

        // initialize the start indexes, calculating how many have been tested so far
        if((complete = init_pass_index(iStart,wszStart,wszAlphabet)) == 0)
            return(false);

        // initialize the end indexes, calculating the total number we need to check
        if((total = init_pass_index(iEnd,wszEnd,wszAlphabet)) == 0)
            return(false);

        // make sure we aren't starting passed the end ..unlikely, but just incase
        if(complete > total) {
          wprintf(L"\n\n\t[-] Invalid end/start password combination: \"%s\" > \"%s\"\n",wszStart,wszEnd);
          return(false);
        }
        
        complete--;                        // first one has to be computed..
        remaining = (total - complete);
        
        // if we have less passwords than processors available, don't be greedy - as if!
	if(remaining < cpus) cpus = remaining;
	
	return(true);
}

