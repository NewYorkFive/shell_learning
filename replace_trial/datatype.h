#ifndef __DATA_TYPE_H__
#define __DATA_TYPE_H__

#define USE_POWERSMART_COMMON
//#include "version_define.h"
#include "include/powersmart_common/powersmart_common.h"
#include "include/transcoder_output/raw/raw_define.h"
#include "include/transcoder_output/transpacket.h"

#ifndef USE_POWERSMART_COMMON
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <memory.h>
#include <string.h>
#include <netdb.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/ioctl.h>
#include <pthread.h>
#include <errno.h>
#include <stdarg.h>
#include <sys/stat.h>
#include <sys/time.h>

#define UNIX_VERSION
#define IOS_VERSION
//#define ANDROID_VERSION

#endif//USE_POWERSMART_COMMON

#define CNTV_VERSION
#define USE_UNI_SOCKET
//#define IOS_VERSION_64
#define IOS_VERSION_32

#define USE_PSSERVER
//#define ANDROID_VERSION_DEBUG

typedef void *(*FIND_CODEC)(int id);
typedef void (*NOTIFY_MSG1)(void *ffp, int what);
typedef void (*NOTIFY_MSG2)(void *ffp, int what, int arg1);
typedef void (*NOTIFY_MSG3)(void *ffp, int what, int arg1, int arg2);
typedef void (*NOTIFY_MSG4)(void *ffp, int what, int arg1, int arg2, void *obj, int obj_len);

#ifdef ANDROID_VERSION
#ifdef ANDROID_VERSION_DEBUG
#include <android/log.h>
#endif
#endif

#define PSDEMUX_VERSION     "1.8.0.1"
#ifdef USE_UNI_SOCKET
#define PSDEMUX_BUILD       "201801251746"
#else
#define PSDEMUX_BUILD       "201801251746#NOUNI"
#endif

#ifndef TIMEVAL_TO_TIMESPEC
#define	TIMEVAL_TO_TIMESPEC(tv, ts) {					\
(ts)->tv_sec = (tv)->tv_sec;					\
(ts)->tv_nsec = (tv)->tv_usec * 1000;				\
}
#endif

#ifndef TIMESPEC_TO_TIMEVAL
#define	TIMESPEC_TO_TIMEVAL(tv, ts) {					\
(tv)->tv_sec = (ts)->tv_sec;					\
(tv)->tv_usec = (ts)->tv_nsec / 1000;				\
}
#endif

// pzsp message
#define PZSP_MSG_CHANNEL_END        100001  // channel not exist or ended
#define PZSP_MSG_INTERACT_ADV       100002
#define PZSP_MSG_SWITCH_TO_MAIN     100051  //
#define PZSP_MSG_SWITCH_TO_SLAVE    100052  //


//#define ADVLOG_MODEL_PSDEMUX ((void*)1)
//#define ADVLOG_MODEL_PTCP   ((void*)2)
//#define ADVLOG_LEVEL 4

#define PSDEMUX_NAME_SIZE   120

#define	ERROR_NONE						0
#define	ERROR_DB_FAIL					22
#define	ERROR_NETWORK_FAIL				26
#define ERROR_NEED_WAIT 69
#define	ERROR_URL_FORMAT				111

typedef uint32_t BOOL;

#ifndef USE_POWERSMART_COMMON

typedef unsigned short WORD;
typedef unsigned char BYTE;
typedef unsigned int DWORD;
typedef int int32_t;
typedef long long __int64;
typedef long long LONGLONG;
typedef unsigned int SOCKET;
typedef unsigned short USHORT;
typedef unsigned long long LWORD;

#ifdef IOS_VERSION
typedef unsigned long long uint64_t;
#else

#ifndef __aarch64__
typedef unsigned long long uint64_t;
#endif

#endif

#define INVALID_SOCKET		(-1)
#define SOCKET_ERROR		(-1)


#ifdef NT_VERSION
class	THREAD
{
public:
    HANDLE	Handle;
    DWORD	ID;
};
#endif

#ifdef	UNIX_VERSION
class	THREAD
{
public:
    void*		Handle;
    pthread_t	ID;
};

typedef struct _PREPROCESS_INFO
{
    uint16_t          preprocess_step1_op;
    uint16_t          preprocess_step1_type;
    uint16_t          preprocess_step2_op;
    uint16_t          preprocess_step2_type;
    uint16_t          preprocess_step3_op;
    uint16_t          preprocess_step3_type;
    uint16_t          preprocess_reserved[12];
}PREPROCESS_INFO;

typedef struct _EXTTIME_INFO
{
    uint64_t            pzvtTimeOffset;
    uint64_t            lyricTimeStamp;
    char                exttime_reserved[20];
}EXTTIME_INFO;

typedef struct _SAMPLEINFO {
    DWORD       dwSampleType;
    int         iParamInt1;
    int         iParamInt2;
    int         iParamInt3;
    
    DWORD       dwSize;
    int64_t     rtStart;
    int64_t     rtPTS;
    DWORD       dwDuration;
    
    int16_t     video_width;
    int16_t     video_height;
    uint16_t    audio_ch;
    uint16_t    audio_samplerate;
    uint32_t    snag_pos;
    uint32_t    sample_flag;
    
    char reserved[16];
    
    union  _EXTRAINFO{
        struct _PREPROCESS_INFO preprocessinfo;
        struct _EXTTIME_INFO    exttime_info;
    } extrainfo;
    
} SAMPLEINFO;

typedef void*		HANDLE;
typedef	void *		LPVOID;
void CloseHandle(HANDLE p);
#endif

#define TRUE 1
#define FALSE 0
//#define NULL 0

LONGLONG GetTickCount64();

typedef void *(*LPTHREAD_START_ROUTINE)(void *);
void *CreateThread(void *Var1,DWORD Var2,void *(*Func)(void *),void *Func_Var,DWORD Var3,pthread_t *ID);

int XConnectAsync(SOCKET sockfd, struct sockaddr*dstaddr, int addrlen, int timeout_ms, bool*stopflag=NULL);

int ConnectAsync(SOCKET sock, struct sockaddr *dstaddr, int addrlen, int timeout_ms);
int closesocket(SOCKET sock);

#ifndef IOS_VERSION_32
int	ioctlsocket(SOCKET socket,int cmd,uint32_t* argp);
#endif

#ifndef IOS_VERSION_64
int	ioctlsocket(SOCKET socket,long cmd,uint32_t *argp);
#endif

void	Sleep(int ms);

#define INFINITE        0xFFFFFFFF
#define myMutex pthread_mutex_t
int myMutex_init(myMutex *_mutex);
int myMutex_destory(myMutex *_mutex);

int myMutex_lock(myMutex *_mutex, unsigned int milliseconds);
int myMutex_unlock(myMutex *_mutex);

// Add some new functions
int psinternal_parse_pdp(const char *url, int *pdp);
// end

int		strnicmp( const char *string1, const char *string2, size_t count );

class	ADDRESS_UDP
{
public:
	DWORD		Handle;
	sockaddr_in	Address;
};

class	ADDRESS
{
public:
	union
	{
		ADDRESS_UDP		UDP;
	};
	
	static		DWORD		IP_To_DWORD(DWORD	Address1,DWORD	Address2,DWORD	Address3,DWORD	Address4);
	static		DWORD		String_To_DWORD(char *IP_String);
	static		DWORD		Get_Local_IP_DWORD();
};

#ifndef SAFE_DELETE
    #define SAFE_DELETE( x )            \
       if( x )                          \
       {                                \
           delete x;                    \
           x = NULL;                    \
       }
#endif //SAFE_DELETE

#ifndef SAFE_ARRAYDELETE
    #define SAFE_ARRAYDELETE( x )       \
       if( x )                          \
       {                                \
           delete [] x;                 \
           x = NULL;                    \
       }
#endif //SAFE_ARRAYDELETE

#endif//#ifndef USE_POWERSMART_COMMON

#endif//__DATA_TYPE_H__

