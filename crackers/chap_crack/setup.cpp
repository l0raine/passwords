
        int szPasswi3[256]={0};
        int szPasswi4[256]={0};
        
    szPasswi3[0] = 1; // For increment (password + 1), i.e. next password

    memcpy(szPasswi4, iEnd, sizeof(szPasswi4)); // Last password

	unsigned long long thread_total = 0;

    for (DWORD i = 0; i <= (cpus - 1); i++)
    {
      fnMatemSub(iEnd, iStart, nAlphabetLen);
      fnMatemDiv(iEnd, cpus - i, nAlphabetLen);
      fnMatemAdd(iEnd, iStart, nAlphabetLen);

	  //wprintf(L"\n\tCPU %d: \"%s\"",i,fnIntGetPassword(iStart,wszAlphabet));
      //wprintf(L" -> \"%s\"",fnIntGetPassword(iEnd,wszAlphabet));

	  // initialize a THREAD_DATA structure

	  tp[i].thread_id = i;				// gets returned when finished

	  wcscpy(tp[i].wszAlphabet,wszAlphabet);
	  tp[i].nAlphabetLen = nAlphabetLen;

	  memcpy(tp[i].iStart,iStart,sizeof(iStart));
	  memcpy(tp[i].iEnd,iEnd,sizeof(iEnd));

	  tp[i].complete = calc_iterations(iStart,nAlphabetLen);
	  tp[i].complete--;			// first one hasn't been tested yet..

	  tp[i].total = calc_iterations(iEnd,nAlphabetLen);
	  tp[i].remaining = (tp[i].total - tp[i].complete);

	  //wprintf(L"\n\tIn this thread, we have %I64d passwords to create",tp[i].remaining);
	  thread_total += tp[i].remaining;

	  memcpy(tp[i].uCiphertext,&hash_binary[0],8);
	  memcpy(tp[i].uSalt,&hash_binary[8],10);		// includes NTLM bytes

	  if(module[i] == 0 && !init_lib(abc,i))
	  {
		  wprintf(L"\n\t[-] FAILED to initialize library for %d - aborting.",i);
		  return 0;
	  }

	  InitBFKeyThread[i](&tp[i]);			// initialize these parameters
	  
	  hThread[i] = CreateThread( 
					NULL,              // default security attributes
					0,                 // use default stack size  
					(LPTHREAD_START_ROUTINE)MainBFThread,          // thread function 
					reinterpret_cast<LPVOID>(i),             // argument to thread function 
					CREATE_SUSPENDED,  // suspend until all threads are initialized 
					&dwThreadId[i]);   // returns the thread identifier 

	  if(hThread[i] == NULL)
	  {
		  //wprintf(L"\n\t[-] FAILED to start thread for %d",i);
		  return(0);
	  }

	  events[i] = CreateEvent(NULL,FALSE,FALSE,NULL);

	  if(events[i] == NULL)
	  {
		  //wprintf(L"\n\t[-] FAILED to start event for %d",i);
		  return(0);
	  }

      if(memcmp(iEnd,szPasswi4,sizeof(szPasswi4)))
         fnMatemAdd(iEnd,szPasswi3, (int)nAlphabetLen); // +1

      memcpy(iStart, iEnd, sizeof(iEnd)); // Next initial password
      memcpy(iEnd, szPasswi4, sizeof(szPasswi4)); // Next last password
    }