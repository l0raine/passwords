
#include "stdafx.hpp"

void usage(wchar_t *module)
{
	wprintf(L"\n\n\tNTLMv1/PPTP/LEAP/MS-CHAP v1 / v2 Password recovery tool v0.11\n\n");
	wprintf(L"\n\tUsage:%s -h<MSCHAP HASH> [ options ]\n",module);
	wprintf(L"\n\t-d : Dictionary file to use");
	wprintf(L"\n\t-a : Alphabet to use");
	//wprintf(L"\n\t-k : File with pre-computed NTLM keys to use");
	//wprintf(L"\n\t-r : Resume session from file");
	wprintf(L"\n\t-s : Password to start with");
	wprintf(L"\n\t-e : Password to end with\n\n");
	exit(0);
}

int wmain(int argc, wchar_t* argv[])
{
        wchar_t szTotal[256]={0};
        wchar_t szComplete[256]={0};
        wchar_t szRemaining[256]={0};

        bool bPasswordFound = false;

	HANDLE hThread[MAX_CPUS];
	DWORD dwThreadId[MAX_CPUS];


	SetConsoleOutputCP(GetConsoleOutputCP());

	cpus = get_cpus();

	cpus = (cpus > MAX_CPUS) ? MAX_CPUS : cpus;

        wprintf(L"\n\tUsername:  %s",username ? username : L"<untitled>");
        dump(L"\tCiphertext:",&hash_binary[0]);
        dump(L"\tChallenge: ",&hash_binary[8]);
        dump(L"\tNTLM Bytes:",&hash_binary[16]);

	wprintf(L"\n\n\tPerforming Brute Force attack using %d threads",cpus);
	wprintf(L"\n\tAlphabet:\"%s\"",wszAlphabet);
	wprintf(L"\n\tStart: \"%s\"",wszStart);
	wprintf(L"\n\tEnd:\"%s\"\n",wszEnd);

	format_number(szTotal,total);
	format_number(szComplete,complete);
	format_number(szRemaining,remaining);

	wprintf(L"\n\tTotal Passwords = %s | Completed = %s | Remaining = %s\n",szTotal,szComplete,szRemaining);
	wprintf(L"\n\tPress CTRL+C for current statistics (twice quick to terminate)\n");

	for(DWORD i = 0;i < cpus;i++)
	{
		//wprintf(L"\n\tResuming %d",i);
		ResumeThread(hThread[i]);
	}
	
	start_tick = GetTickCount();
	SetConsoleCtrlHandler((PHANDLER_ROUTINE)HandlerRoutine,TRUE);

	//Sleep(1000);
	//wprintf(L"\n\tTotal in threads = %I64d",thread_total);

	DWORD threads = 0;

	// run loop until CTRL+C or threads finished equals total ran
	while(threads != cpus) {
		// wait until event signalled or timeout of 60 seconds
	    DWORD idx = WaitForMultipleObjects(cpus, events, FALSE, 1000*30);

		if(idx == WAIT_TIMEOUT)
		{
			//save our progress..
			//save_progress();
			continue;
		}

		idx -= WAIT_OBJECT_0;

		if(tp[idx].result == true)
		{
			int indexes[MAX_PASSLEN+1]={0};
			wchar_t wszPassword[256]={0};

			GetBFKeyIndexes[idx](indexes);

			for(int i = 0;i < indexes[0];i++)
			{
				wszPassword[i] = tp[idx].wszAlphabet[ indexes[i+1] ];
			}

			wprintf(L"\n\tFound password with brute force: \"%s\"\n",wszPassword);
			bPasswordFound = true;
			break;
		}
		threads++;		// indicate another thread ended..
	}

	//fclose(save_file);

		if(!bPasswordFound) 
		{
			wprintf(L"\n\tPassword not found with brute force attack\n");

		}

	display_stats(GetTickCount());
	wprintf(L"\n\n");

	return 0;
}

