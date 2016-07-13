
bool dictionaryAttack(wchar_t wszFile[])
{
        FILE *words;
        wchar_t wszPassword[512];
        unsigned int lines = 0;
        size_t word_len;
        bool bFound = false;

        wprintf(L"\n\n\tPerforming Dictionary attack using words from %s\n",dictionary);

        if((words = _wfopen(wszFile,L"r")) == 0) {
            wprintf(L"\n\t[-] ERROR: couldn't open %s!\n",wszFile);
            return(bFound);
        }

        while(!feof(words))
        {
          ZeroMemory(wszPassword,sizeof(wszPassword) / 2);

          if(!fgetws(wszPassword,sizeof(wszPassword) / 2,words))
             break;

          word_len = wcslen(wszPassword);
          wszPassword[word_len-1] = 0x80;

          ((unsigned int*)wszPassword)[14] = ((word_len-1) * 2) * 8;
          lines++;

          if(VerifyPassword(wszPassword)) {
             wszPassword[word_len-1] = 0;
             wprintf(L"\n\tFound password: %s\n",wszPassword);
             bFound = true;
             break;
          }
        }

        fclose(words);
        return(bFound);
}