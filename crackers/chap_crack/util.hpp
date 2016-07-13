
// convert hexadecimal string to binary, return false if error
bool str2hash(wchar_t str[], unsigned char hash[])
{
        size_t str_len = wcslen(str);
        unsigned int number;
        
        if((str_len % 2) != 0)
           return false;
           
        for(size_t i = 0;i < str_len;i++) {
            if(iswxdigit(str[i]) == 0)
               return(false);
        }

        for(size_t i = 0;i < str_len/2;i++) {
            swscanf(&str[i*2],L"%2x",&number);
            hash[i] = (unsigned char)number;
        }
        return(true);
}

// initialize password indexes and return iterations completed
unsigned long long init_pass_index(int pass_index[], wchar_t password[], wchar_t alphabet[]) {

        size_t pass_len  = wcslen(password);
        size_t alpha_len = wcslen(alphabet);

        __int64 x_pow = 1,iterations = 0;

        for(size_t i = 0;i < pass_len;i++) {
            if(!wcsrchr(alphabet,password[i])) {
               wprintf(L"\n[-] ERROR: \'%c\' is not found in alphabet: %s\n",password[i],alphabet);
               return(0);
            }
            else {
               pass_index[i] = (int)(wcsrchr(alphabet,password[i]) - alphabet + 1);
               iterations += x_pow * pass_index[i];
               x_pow *= alpha_len;
            }
        }
        return iterations;
}

// print a string and dump 8 binary bytes
void dump(wchar_t text[], unsigned char bytes[])
{
        wprintf(L"\n%s",text);
        
        for(int i = 0;i < 8;i++) {
            wprintf(L"%02x",bytes[i]);
	}
}

// make sure no duplicate characters in alphabet
void sort_alphabet(wchar_t str[])
{
        size_t str_len = wcslen(str);
        wchar_t *sym;
        
        for(size_t i = 0;i < str_len - 1;i++) {
            if((sym = wcsrchr(&str[i + 1],str[i])) != 0) {
                wcscpy(&sym[0],&sym[1]);
                str_len--;
                i--;
            }
        }
}

// return the number of processors available to the process
int get_cpus(void)
{
        DWORD_PTR vProcessCPUs;
        DWORD_PTR vSystemCPUs;
        int CPUs = 0;
        
        if(GetProcessAffinityMask(GetCurrentProcess (),&vProcessCPUs,&vSystemCPUs)) {
           for(unsigned int bit = 1; bit != 0; bit <<= 1) {
               if(vProcessCPUs & bit) {
                  CPUs++;
               }
           }
        }
        return(CPUs);
}
 
// calculate number of iterations basied on index array
__int64 calc_iterations(int index[], size_t index_size) {

      unsigned long long x_pow = 1,iterations = 0;

      for(int i = 0;index[i] != 0;i++) {
          iterations += x_pow * index[i];
          x_pow *= index_size;
      }
      return iterations;
}

DWORD WINAPI MainBFThread( LPVOID lpParam )
{
        DWORD idx = (DWORD)lpParam;

        tp[idx].result = BFKeyThread[idx]();

        SetEvent(events[idx]);			// signal that we're finished
        return 0;
}

MEMORYMODULE module[MAX_CPUS];

// load the DLL into memory
bool init_lib(unsigned char *data, int idx)
{
        //__asm int 3
        
        if((module[idx] = MemoryLoadLibrary(data)) == NULL)
            return(false);
            
        InitBFKeyThread[idx]  = (pInitBFKeyThread)MemoryGetProcAddress(module[idx],"InitBFKeyThread");
        BFKeyThread[idx]      = (pBFKeyThread)MemoryGetProcAddress(module[idx],"BFKeyThread");

        GetKeyIterations[idx] = (pGetKeyIterations)MemoryGetProcAddress(module[idx],"GetKeyIterations");
        GetBFKeyIndexes[idx]  = (pGetBFKeyIndexes)MemoryGetProcAddress(module[idx],"GetBFKeyIndexes");

        InitKeyParams[idx]    = (pInitKeyParams)MemoryGetProcAddress(module[idx],"InitKeyParams");
        IsPasswordValid[idx]  = (pIsPasswordValid)MemoryGetProcAddress(module[idx],"IsPasswordValid");

        return(InitBFKeyThread[idx] != 0 && BFKeyThread[idx] != 0 && GetKeyIterations[idx] != 0 &&
               GetBFKeyIndexes[idx] != 0 && InitKeyParams[idx] != 0 && IsPasswordValid[idx] != 0);
}

void save_progress()
{
        wchar_t wszPassword[MAX_PASSLEN+1]={0};

        for(int i = 0;i < cpus;i++)
        {
          // get the indexes for this thread
          GetBFKeyIndexes[i](tp[i].iStart);

          // get the current unicode password based on indexes
          for(int j = 0;tp[i].iStart[j] != 0;j++)
            tp[i].wszStart[j] = tp[i].wszAlphabet[ tp[i].iStart[j] ];

          // now save to resume file in format: USERNAME:CIPHERTEXT:SALT:ALPHABET:START:END
          fwprintf(save_file,L"%s:",tp[i].wszUsername);

          // ciphertext
          for(int j = 0;j < 8;j++)
            fwprintf(save_file,L"%2x",tp[i].uCiphertext[j]);

          fwprintf(save_file,L":");

          // salt
          for(int j = 0;j < 10;j++)
            fwprintf(save_file,L"%2x",tp[i].uSalt[j]);

          fwprintf(save_file,L":%s:%s:%s\r\n",tp[i].wszAlphabet,tp[i].wszStart,tp[i].wszEnd);
        }
        fflush(save_file);
}

void load_progress()
{
        wchar_t wszPassword[MAX_PASSLEN+1]={0};
        
        for(int i = 0;i < cpus;i++)
        {
          // get the indexes for this thread
          GetBFKeyIndexes[i](tp[i].iStart);

          // the routine to read is fwscanf
          //int fwscanf(FILE *stream, const wchar_t *format, ... );


          // get the current unicode password based on indexes
          for(int j = 0;tp[i].iStart[j] != 0;j++)
            tp[i].wszStart[j] = tp[i].wszAlphabet[ tp[i].iStart[j] ];

          // now save to resume file in format: USERNAME:CIPHERTEXT:SALT:ALPHABET:START:END
          fwprintf(save_file,L"%s:",tp[i].wszUsername);
          
          // ciphertext
          for(int j = 0;j < 8;j++)
            fwprintf(save_file,L"%2x",tp[i].uCiphertext[j]);

          fwprintf(save_file,L":");

          // salt
          for(int j = 0;j < 10;j++)
            fwprintf(save_file,L"%2x",tp[i].uSalt[j]);

          fwprintf(save_file,L":%s:%s:%s\r\n",tp[i].wszAlphabet,tp[i].wszStart,tp[i].wszEnd);
        }
        fflush(save_file);
}