/*
 * This code is public domain. Share and enjoy.
 */

// MUTEX_TRY_LOCK(mutex) and PMUTEX_TRY_LOCK(pmutex) return true if acquired locked, otherwise false

#ifdef _WIN32
	#include <windows.h>
	#define THREAD                          HANDLE
	#define THREAD_WAIT(thread)             WaitForSingleObject(thread, INFINITE)
	#define THREAD_CREATE(thread,func,arg)  ((thread = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)func, arg, 0, NULL)) == NULL ? -1 : 0)

	typedef CRITICAL_SECTION    MUTEX;
	typedef CRITICAL_SECTION  *PMUTEX;

	#define MUTEX_CREATE(mutex)             InitializeCriticalSection(&mutex)
	#define MUTEX_DELETE(mutex)             DeleteCriticalSection(&mutex)
	#define MUTEX_LOCK(mutex)               EnterCriticalSection(&mutex)
	#define MUTEX_TRY_LOCK(mutex)           (TryEnterCriticalSection(&mutex) != 0)
	#define MUTEX_UNLOCK(mutex)             LeaveCriticalSection(&mutex)

	#define PMUTEX_CREATE(pmutex)           InitializeCriticalSection(pmutex = new CRITICAL_SECTION)
	#define PMUTEX_DELETE(pmutex)           DeleteCriticalSection(pmutex); delete pmutex
	#define PMUTEX_LOCK(pmutex)             EnterCriticalSection(pmutex)
	#define PMUTEX_TRY_LOCK(pmutex)         (TryEnterCriticalSection(pmutex) != 0)
	#define PMUTEX_UNLOCK(pmutex)           LeaveCriticalSection(pmutex)
	#if (_WIN32_WINNT >= _WIN32_WINNT_VISTA)
//	#if 0 // do this if you like XP users :)
		typedef CONDITION_VARIABLE    COND;
		typedef CONDITION_VARIABLE  *PCOND;

		#define COND_CREATE(cond)               InitializeConditionVariable(&cond)
		#define COND_DELETE(cond)               /* Memory leak? */
		#define COND_SIGNAL(cond)               WakeConditionVariable(&cond)
		#define COND_SIGNAL_ALL(cond)           WakeAllConditionVariable(&cond)
		#define COND_WAIT(cond,mutex)           SleepConditionVariableCS(&cond, &mutex, INFINITE)

		#define PCOND_CREATE(pcond)             InitializeConditionVariable(pcond = new CONDITION_VARIABLE)
		#define PCOND_DELETE(pcond)             /* Memory leak? */delete pcond
		#define PCOND_SIGNAL(pcond)             WakeConditionVariable(pcond)
		#define PCOND_SIGNAL_ALL(pcond)         WakeAllConditionVariable(pcond)
		#define PCOND_WAIT(pcond,pmutex)        SleepConditionVariableCS(pcond, pmutex, INFINITE)
	#else
		typedef HANDLE   COND;
		typedef HANDLE  PCOND;

		#define COND_CREATE(cond)               (cond = CreateEvent(NULL, TRUE, FALSE, NULL))
		#define COND_DELETE(cond)               CloseHandle(cond)
		#define COND_SIGNAL(cond)               SetEvent(cond)
		#define COND_SIGNAL_ALL(cond)           SetEvent(cond)
		#define COND_WAIT(cond,mutex)           ResetEvent(cond); \
		                                        MUTEX_UNLOCK(mutex); \
		                                        WaitForSingleObject(cond, 1000 /* 1 second because of race condition */); \
		                                        MUTEX_LOCK(mutex)

		#define PCOND_CREATE(pcond)             (pcond = CreateEvent(NULL, TRUE, FALSE, NULL))
		#define PCOND_DELETE(pcond)             CloseHandle(pcond)
		#define PCOND_SIGNAL(pcond)             SetEvent(pcond)
		#define PCOND_SIGNAL_ALL(pcond)         SetEvent(pcond)
		#define PCOND_WAIT(pcond,pmutex)        ResetEvent(pcond); \
		                                        PMUTEX_UNLOCK(pmutex); \
		                                        WaitForSingleObject(pcond, 1000 /* 1 second because of race condition */); \
		                                        PMUTEX_LOCK(pmutex)
	#endif
#else
	#include <pthread.h>
	#define THREAD                          pthread_t
	#define THREAD_WAIT(thread)             pthread_join(thread, NULL);
	#define THREAD_CREATE(thread,func,arg)  pthread_create(&thread, NULL, func, arg)

	typedef pthread_mutex_t    MUTEX;
	typedef pthread_mutex_t  *PMUTEX;
	typedef pthread_cond_t     COND;
	typedef pthread_cond_t   *PCOND;

	#define MUTEX_CREATE(mutex)             pthread_mutex_init(&mutex, NULL)
	#define MUTEX_DELETE(mutex)             pthread_mutex_destroy(&mutex)
	#define MUTEX_LOCK(mutex)               pthread_mutex_lock(&mutex)
	#define MUTEX_TRY_LOCK(mutex)           (pthread_mutex_trylock(&mutex) == 0)
	#define MUTEX_UNLOCK(mutex)             pthread_mutex_unlock(&mutex)

	#define PMUTEX_CREATE(pmutex)           pthread_mutex_init(pmutex = new pthread_mutex_t, NULL)
	#define PMUTEX_DELETE(pmutex)           pthread_mutex_destroy(pmutex); delete pmutex
	#define PMUTEX_LOCK(pmutex)             pthread_mutex_lock(pmutex)
	#define PMUTEX_TRY_LOCK(pmutex)         (pthread_mutex_trylock(pmutex) == 0)
	#define PMUTEX_UNLOCK(pmutex)           pthread_mutex_unlock(pmutex)

	#define COND_CREATE(cond)               pthread_cond_init(&cond, NULL)
	#define COND_DELETE(cond)               pthread_cond_destroy(&cond)
	#define COND_SIGNAL(cond)               pthread_cond_signal(&cond)
	#define COND_SIGNAL_ALL(cond)           pthread_cond_broadcast(&cond)
	#define COND_WAIT(cond,mutex)           pthread_cond_wait(&cond, &mutex)

	#define PCOND_CREATE(pcond)             pthread_cond_init(pcond = new pthread_cond_t, NULL)
	#define PCOND_DELETE(pcond)             pthread_cond_destroy(pcond); delete pcond
	#define PCOND_SIGNAL(pcond)             pthread_cond_signal(pcond)
	#define PCOND_SIGNAL_ALL(pcond)         pthread_cond_broadcast(pcond)
	#define PCOND_WAIT(pcond,pmutex)        pthread_cond_wait(pcond, pmutex)
#endif
