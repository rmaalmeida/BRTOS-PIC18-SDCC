///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
/////                                                     /////
/////                   OS User Defines                   /////
/////                                                     /////
/////             !User configuration defines!            /////
/////                                                     /////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

// Define if simulation or DEBUG
#define DEBUG 1

/// Define if verbose info is available
#define VERBOSE 0

/// Define if error check is available
#define ERROR_CHECK 0

/// Define if compute cpu load is active
#define COMPUTES_CPU_LOAD 1

// Define if whatchdog active
#define WATCHDOG 1

/// Define Number of Priorities
#define NUMBER_OF_PRIORITIES 16

/// Define if OS Trace is active
#define OSTRACE 0

#if (OSTRACE == 1)  
  #include "debug_stack.h"
#endif

// Define the number of Task to be Installed
// must always be equal or higher to NumberOfInstalledTasks
#define NUMBER_OF_TASKS 7

/// Define if TimerHook function is active
#define TIMER_HOOK_EN 0

/// Define if IdleHook function is active
#define IDLE_HOOK_EN 0


// Habilita o servi�o de sem�foro do sistema
#define BRTOS_SEM_EN           1

// Habilita o servi�o de mutex do sistema
#define BRTOS_MUTEX_EN         1

// Habilita o servi�o de mailbox do sistema
#define BRTOS_MBOX_EN          0

// Habilita o servi�o de filas do sistema
#define BRTOS_QUEUE_EN         1

/// Enable or disable queue 16 bits controls
#define BRTOS_QUEUE_16_EN      0

/// Enable or disable queue 32 bits controls
#define BRTOS_QUEUE_32_EN      0

// Define o n�mero m�ximo de sem�foros (limita a aloca��o de mem�ria p/ sem�foros)
#define BRTOS_MAX_SEM          2

// Define o n�mero m�ximo de mutex (limita a aloca��o de mem�ria p/ mutex)
#define BRTOS_MAX_MUTEX        2

// Define o n�mero m�ximo de Mailbox (limita a aloca��o de mem�ria p/ mailbox)
#define BRTOS_MAX_MBOX         1

// Define o n�mero m�ximo de filas (limita a aloca��o de mem�ria p/ filas)
#define BRTOS_MAX_QUEUE        3

// TickTimer Defines
#define configCPU_CLOCK_HZ            (INT32U)32000000
#define configCPU_INT_CLOCK_HZ        (INT32U)8000000
#define configTICK_RATE_HZ            (INT32U)1000
#define configTIMER_PRE_SCALER        (INT8U)0
//#define configTIMER_PRE_SCALER_VALUE  (INT8U)0
#define OSRTCEN                     0


//Stack Defines
// P/ HCS08 com 2KB de RAM, configurado com 1KB p/ STACK Virtual
#define HEAP_SIZE 128

// Queue heap defines
// Configurado com 512B p/ filas
#define QUEUE_HEAP_SIZE 1*128


// Stack Size of the Idle Task
#define IDLE_STACK_SIZE             (INT16U)128

