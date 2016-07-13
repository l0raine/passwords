
// display a big number neatly on the console
wchar_t *format_number(wchar_t buf[], u64 number)
{
        wchar_t *p = buf;
        wchar_t tmp[256];
        
        swprintf(tmp,L"%I64d",number);
        
        size_t string_len = wcslen(tmp);
        
        for(size_t i = 0;i < string_len;i++) {
            *p++ = tmp[i];

            if((((string_len - i) % 3) == 1) && (i != string_len - 1))
                *p++ = L',';
        }
        *p++ = 0;

        return(buf);
}

void display_stats(DWORD tick)
{
	int indexes[MAX_PASSLEN+1]={0};
	wchar_t buffer[256]={0};
	wchar_t password[MAX_PASSLEN+1]={0};
	u64 speed,iterations = 0;
	DWORD seconds;
        
        // for each cpu/thread running
	for(DWORD i = 0;i < cpus;i++)
            iterations += GetKeyIterations[i]();

	seconds = ( tick - start_tick ) / 1000;
	speed   = ( seconds == 0 ) ? iterations : ( iterations / seconds );

	format_number(buffer,speed);
	wprintf(L"\n\tAverage keys tested per second: %s",buffer);
}

// InitThread in DLL should have been called before this!
BOOL WINAPI HandlerRoutine(DWORD dwCtrlType)
{
	static DWORD last;

	DWORD stop_tick = GetTickCount();

	display_stats(stop_tick);
        
        // if interval is less than a second, save a final progress and terminate.
	if ((stop_tick - last) < 1000) {
          wprintf(L"\n\n\tSaving progress to \"resume.sav\"\n");
          save_progress();
          return(FALSE);
        }

	last = stop_tick;
        
        return TRUE;
}

