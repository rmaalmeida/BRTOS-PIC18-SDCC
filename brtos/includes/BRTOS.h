
/**
* \file BRTOS.h
* \brief BRTOS kernel main defines, functions prototypes and structs declaration.
*
*
**/

/*********************************************************************************************************
*                                               BRTOS
*                                Brazilian Real-Time Operating System
*                            Acronymous of Basic Real-Time Operating System
*
*                              
*                                  Open Source RTOS under MIT License
*
*
*
*                                          BRTOS Kernel Header
*
*
*   Author:   Gustavo Weber Denardin
*   Revision: 1.0
*   Date:     20/03/2009
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.63
*   Date:     15/12/2010
*
*   Authors:  Carlos Henrique Barriquelo
*   Revision: 1.64
*   Date:     22/02/2011
*
*********************************************************************************************************/

#ifndef OS_BRTOS_H
#define OS_BRTOS_H


#include "OS_types.h"
#include "../../hal/HAL.h"
//#include "HAL.h"
#include "OS_RTC.h"
#include "../../includes/BRTOSConfig.h"
//#include "BRTOSConfig.h"




///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
/////                                                     /////
/////                 OS BRTOS Defines                    /////
/////                                                     /////
/////  !Do not change unless you know what you're doing!  /////
/////                                                     /////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////


/// False and True defines
#ifndef FALSE
#define FALSE (INT8U)0
#endif

#ifndef TRUE
#define TRUE  (INT8U)1
#endif

#ifndef NULL
#define NULL  0
#endif



/// Task States
#define READY                        (INT8U)0     ///< Task is ready to be executed - waiting for the scheduler authorization
#define SUSPENDED                    (INT8U)1     ///< Task is suspended
#define BLOCKED                      (INT8U)2     ///< Task is blocked - Will not run until be released
#define MUTEX_PRIO                   (INT8U)0xFE
#define EMPTY_PRIO                   (INT8U)0xFF


/// Timer defines
#define NO_TIMEOUT                  (INT16U)65000
#define EXIT_BY_TIMEOUT             (INT16U)65001
#define TickCountOverFlow           (INT16U)64000       ///< Determines the tick timer overflow

/// Error codes
#define OK                           (INT8U)0     ///< OK define
#define NO_MEMORY                    (INT8U)1     ///< Error - Lack of memory to allocate a task
#define STACK_SIZE_TOO_SMALL         (INT8U)2     ///< Error - Stack size too small to allocate a task
#define END_OF_AVAILABLE_PRIORITIES  (INT8U)3     ///< Error - There are no more priorities available
#define BUSY_PRIORITY                (INT8U)4     ///< Error - Priority is being used by another task
#define INVALID_TIME                 (INT8U)5     ///< Error - Informed time is out of the limits
#define TIMEOUT                      (INT8U)6     ///< Error - Timeout
#define CANNOT_ASSIGN_IDLE_TASK_PRIO (INT8U)7     ///< Error - A task can not be assigned into the idle task slot
#define NOT_VALID_TASK               (INT8U)8     ///< There current task number is not valid for this function
#define NO_TASK_DELAY                (INT8U)9     ///< Error - No valid time to wait

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////



// Return defines to events control blocks
#define ALLOC_EVENT_OK          (INT8U)0      ///< Event allocated with success
#define NO_AVAILABLE_EVENT      (INT8U)1      ///< No event control blocks available
#define IRQ_PEND_ERR            (INT8U)2      ///< Function can not be called inside an interrupt
#define ERR_SEM_OVF             (INT8U)3      ///< Semaphore counter overflow
#define ERR_MUTEX_OVF           (INT8U)4      ///< Mutex counter overflow
#define ERR_EVENT_NO_CREATED    (INT8U)5      ///< There are no task waiting for the event
#define NULL_EVENT_POINTER      (INT8U)6      ///< The passed event pointer is NULL
#define ERR_EVENT_OWNER         (INT8U)7      ///< Function caller is not the owner of the event control block. Used to mutex implementation
#define DELETE_EVENT_OK         (INT8U)8      ///< Event deleted with success
#define AVAILABLE_RESOURCE      (INT8U)9      ///< The resource is available
#define BUSY_RESOURCE           (INT8U)10      ///< The resource is busy
#define AVAILABLE_MESSAGE       (INT8U)11     ///< There is a message
#define NO_MESSAGE              (INT8U)12     ///< There is no message

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue Defines                               /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

// Enable Queue Structures
#define READ_BUFFER_OK       0            ///< New data successfully read
#define WRITE_BUFFER_OK      0            ///< New data successfully written
#define BUFFER_UNDERRUN      1            ///< Queue overflow
#define CLEAN_BUFFER_OK      2            ///< Queue successfully cleaned
#define NO_ENTRY_AVAILABLE   3            ///< Queue is empty

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////



/// Suspended Types
#define DELAY     0                               ///< Task suspended by delay
#define SEMAPHORE 1                               ///< Task suspended by semaphore
#define MAILBOX   2                               ///< Task suspended by mailbox
#define QUEUE     3                               ///< Task suspended by queue
#define MUTEX     4                               ///< Task suspended by mutex



/// Task Defines

#if (NUMBER_OF_PRIORITIES > 16)
  #define configMAX_TASK_INSTALL  32                 ///< Defines the maximum number of tasks that can be installed
  #define configMAX_TASK_PRIORITY 31  
  typedef INT32U PriorityType;
#else
  #if (NUMBER_OF_PRIORITIES > 8)
    #define configMAX_TASK_INSTALL  16                 ///< Defines the maximum number of tasks that can be installed
    #define configMAX_TASK_PRIORITY 15
    typedef INT16U PriorityType;
  #else
    #define configMAX_TASK_INSTALL  8                 ///< Defines the maximum number of tasks that can be installed
    #define configMAX_TASK_PRIORITY 7  
    typedef INT8U PriorityType;
  #endif
#endif

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Context Tasks Structure Prototypes          /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct ContextType
* Context Task Structure
* Used by the task control block
*/
struct Context
{
   const CHAR8 * TaskName;  ///< Task name
  #if SP_SIZE == 32
   INT32U StackPoint;       ///< Current position of virtual stack pointer
   INT32U StackInit;        ///< Virtual stack pointer init
  #else
   INT16U StackPoint;       ///< Current position of virtual stack pointer
   INT16U StackInit;        ///< Virtual stack pointer init  
  #endif
   INT16U TimeToWait;       ///< Time to wait - could be used by delay or timeout
  #if (VERBOSE == 1)
   INT8U  State;            ///< Task states
   INT8U  Blocked;          ///< Task blocked state
   INT8U  SuspendedType;    ///< Task suspended type
  #endif
   INT8U  Priority;         ///< Task priority
   struct Context *Next;
   struct Context *Previous;
};

typedef struct Context ContextType;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    Semaphore Control Block Structure             /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct BRTOS_Sem
* Semaphore Control Block Structure
*/
typedef struct {
  INT8U        OSEventAllocated;              ///< Indicate if the event is allocated or not
  INT8U        OSEventCount;                  ///< Semaphore Count - This value is increased with a post and decremented with a pend
  INT8U        OSEventWait;                   ///< Counter of waiting Tasks
  PriorityType OSEventWaitList;               ///< Task wait list for event to occur
} BRTOS_Sem;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    Mutex Control Block Structure                 /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct BRTOS_Mutex
* Mutex Control Block Structure
*/
typedef struct {
  INT8U        OSEventAllocated;              ///< Indicate if the event is allocated or not
  INT8U        OSEventState;                  ///< Mutex state - Defines if the resource is available or not
  INT8U        OSEventOwner;                  ///< Defines mutex owner
  INT8U        OSMaxPriority;                 ///< Defines max priority accessing resource
  INT8U        OSOriginalPriority;            ///< Save original priority of Mutex owner task - used to the priority ceiling implementation
  INT8U        OSEventWait;                   ///< Counter of waiting Tasks
  PriorityType OSEventWaitList;               ///< Task wait list for event to occur
} BRTOS_Mutex;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    MailBox Control Block Structure               /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct BRTOS_Mbox
* MailBox Control Block Structure
*/
typedef struct {
  INT8U        OSEventAllocated;              ///< Indicate if the event is allocated or not
  INT8U        OSEventWait;                   ///< Counter of waiting Tasks
  INT8U        OSEventState;                  ///< Mailbox state - Defines if the message is available or not
  PriorityType OSEventWaitList;               ///< Task wait list for event to occur
  void         *OSEventPointer;               ///< Pointer to the message structure / type
} BRTOS_Mbox;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    Queue Control Block Structure                 /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct BRTOS_Queue
* Queue Control Block Structure
*/
typedef struct {
  INT8U        OSEventAllocated;              ///< Indicate if the event is allocated or not
  INT8U        OSEventCount;                  ///< Queue Event Count - This value is increased with a post and decremented with a pend
  INT8U        OSEventWait;                   ///< Counter of waiting Tasks
  void         *OSEventPointer;               ///< Pointer to queue structure
  PriorityType OSEventWaitList;               ///< Task wait list for event to occur
} BRTOS_Queue;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue Structure                             /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct OS_QUEUE
* Queue Control Block Structure
*/
typedef struct
{
  INT8U        *OSQPtr;                 ///< Pointer returned by the memory allocation function
  INT8U        *OSQStart;               ///< Pointer to the queue start
  INT8U        *OSQEnd;                 ///< Pointer to the queue end
  INT8U        *OSQIn;                  ///< Pointer to the next queue entry
  INT8U        *OSQOut;                 ///< Pointer to the next data in the queue output
  INT16U       OSQSize;                 ///< Size of the queue - Defined in the create queue function
  INT16U       OSQEntries;              ///< Size of data inside the queue
} OS_QUEUE;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue 16 Structure                          /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct OS_QUEUE
* Queue Control Block Structure
*/
typedef struct
{
  INT16U  *OSQPtr;                 ///< Pointer returned by the memory allocation function
  INT16U  *OSQStart;               ///< Pointer to the queue start
  INT16U  *OSQEnd;                 ///< Pointer to the queue end
  INT16U  *OSQIn;                  ///< Pointer to the next queue entry
  INT16U  *OSQOut;                 ///< Pointer to the next data in the queue output
  INT16U  OSQSize;                 ///< Size of the queue - Defined in the create queue function
  INT16U  OSQEntries;              ///< Size of data inside the queue
} OS_QUEUE_16;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue 32 Structure                          /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* \struct OS_QUEUE
* Queue Control Block Structure
*/
typedef struct
{
  INT32U  *OSQPtr;                 ///< Pointer returned by the memory allocation function
  INT32U  *OSQStart;               ///< Pointer to the queue start
  INT32U  *OSQEnd;                 ///< Pointer to the queue end
  INT32U  *OSQIn;                  ///< Pointer to the next queue entry
  INT32U  *OSQOut;                 ///< Pointer to the next data in the queue output
  INT16U  OSQSize;                 ///< Size of the queue - Defined in the create queue function
  INT16U  OSQEntries;              ///< Size of data inside the queue
} OS_QUEUE_32;

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Functions Prototypes                        /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/*****************************************************************************************//**
* \fn INT8U InstallTask(void(*FctPtr)(void),const char *TaskName, INT16U USER_STACKED_BYTES,INT8U iPriority)
* \brief Install a task. Initial state = running.
* \param *FctPtr Pointer to the task to be installed
* \param *TaskName Task Name or task description
* \param USER_STACKED_BYTES Size of the task virtual stack. Depends on the user code and used interrupts.
* \param iPriority Desired task priority
* \return OK Task successfully installed
* \return NO_MEMORY Not enough memory available to install the task
* \return END_OF_AVAILABLE_PRIORITIES All the available priorities are busy
* \return BUSY_PRIORITY Desired priority busy
*********************************************************************************************/
INT8U InstallTask(void(*FctPtr)(void),const CHAR8 *TaskName, INT16U USER_STACKED_BYTES,INT8U iPriority);

/*****************************************************************************************//**
* \fn INT8U InstallIdle(void(*FctPtr)(void), INT16U USER_STACKED_BYTES)
* \brief Install the idle task. Initial state = running.
* \param *FctPtr Pointer to the task to be installed
* \param USER_STACKED_BYTES Size of the task virtual stack.
* \return OK Idle task successfully installed
* \return NO_MEMORY Not enough memory available to install the idle task
*********************************************************************************************/
INT8U InstallIdle(void(*FctPtr)(void), INT16U USER_STACKED_BYTES);

/*****************************************************************************************//**
* \fn void Idle(void)
* \brief Idle Task. May be used to implement low power commands.
* \return NONE
*********************************************************************************************/
void Idle(void);

/*****************************************************************************************//**
* \fn void BRTOS_TimerHook(void)
* \brief Provide to the user a function sincronized with the timer tick
*  This function can be used to perform simple tests syncronized with the timer tick.
* \return NONE
*********************************************************************************************/  
#if (TIMER_HOOK_EN == 1)
void BRTOS_TimerHook(void);
#endif

/*****************************************************************************************//**
* \fn void IdleHook(void)
* \brief Provide to the user a function sincronized with the idle task
* \return NONE
*********************************************************************************************/  
#if (IDLE_HOOK_EN == 1)
void IdleHook(void);
#endif

/**************************************************************************//**
* \fn interrupt void TickTimer(void)
* \brief Tick timer interrupt handler routine (Internal kernel function).
******************************************************************************/
void OS_TICK_HANDLER(void);

/*****************************************************************************************//**
* \fn INT8U BRTOSStart(void)
* \brief Start the Operating System Scheduler
*  The user must call this function to start the tasks execution.
* \return OK Success
* \return NO_MEMORY There was not enough memory to start all tasks
*********************************************************************************************/
INT8U BRTOSStart(void);

/*****************************************************************************************//**
* \fn INT8U DelayTask(INT16U time)
* \brief Wait for a specified period.
*  A task that calling this function will be suspended for a certain time.
*  When this time is reached the task back to ready state.
* \param time Time in ticks to delay. System default = 1ms. The user can change the time value.
* \return OK Success
* \return IRQ_PEND_ERR - Can not use block priority function from interrupt handler code
*********************************************************************************************/
INT8U DelayTask(INT16U time);

/*****************************************************************************************//**
* \fn INT8U DelayTaskHMSM(INT8U hours, INT8U minutes, INT8U seconds, INT16U miliseconds)
* \brief Wait for a specified period (in hours, minutes, seconds and miliseconds).
*  A task that calling this function will be suspended for a certain time.
*  When this time is reached the task back to ready state.
* \param hours Hours to delay
* \param minutes Minutes to delay
* \param seconds Seconds to delay
* \param miliseconds Miliseconds to delay
* \return OK Success
* \return INVALID_TIME The specified parameters are outside of the permitted range
*********************************************************************************************/  
INT8U DelayTaskHMSM(INT8U hours, INT8U minutes, INT8U seconds, INT16U miliseconds);

/*****************************************************************************************//**
* \fn void PreInstallTasks(void)
* \brief Function that initialize the kernel main variables.
*  This function resets the kernel main variables, preparing the system to be started.
* \return NONE
*********************************************************************************************/  
void PreInstallTasks(void);

/*****************************************************************************************//**
* \fn INT8U BlockPriority(INT8U iPriority)
* \brief Blocks a specific priority
*  Blocks the task that is associated with the specified priority.
*  The user must be careful when using this function in together with mutexes.
*  This can lead to undesired results due the "cealing priority" property used in the mutex.
* \param iPriority Priority to be blocked
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use block priority function from interrupt handler code
*********************************************************************************************/  
INT8U BlockPriority(INT8U iPriority);

/*****************************************************************************************//**
* \fn INT8U UnBlockPriority(INT8U iPriority)
* \brief UnBlock a specific priority
*  UnBlocks the task that is associated with the specified priority.
*  The user must be careful when using this function in together with mutexes.
*  This can lead to undesired results due the "cealing priority" property used in the mutex.
* \param iPriority Priority to be unblocked
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use unblock priority function from interrupt handler code
*********************************************************************************************/
INT8U UnBlockPriority(INT8U iPriority);

/*****************************************************************************************//**
* \fn INT8U BlockTask(INT8U iTaskNumber)
* \brief Blocks a specific task
* \param iTaskNumber Task number to be blocked
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use block task function from interrupt handler code
*********************************************************************************************/
INT8U BlockTask(INT8U iTaskNumber);

/*****************************************************************************************//**
* \fn INT8U UnBlockTask(INT8U iTaskNumber)
* \brief UnBlocks a specific task
* \param iTaskNumber Task number to be unblocked
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use unblock task function from interrupt handler code
*********************************************************************************************/
INT8U UnBlockTask(INT8U iTaskNumber);

/*****************************************************************************************//**
* \fn INT8U BlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
* \brief Blocks a set of tasks
* \param TaskStart Number of the first task to be blocked
* \param TaskNumber Number of tasks to be blocked from the specified task start
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use block multiple tasks function from interrupt handler code
*********************************************************************************************/
INT8U BlockMultipleTask(INT8U TaskStart, INT8U TaskNumber);

/*****************************************************************************************//**
* \fn INT8U UnBlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
* \brief UnBlocks a set of tasks
* \param TaskStart Number of the first task to be unblocked
* \param TaskNumber Number of tasks to be unblocked from the specified task start
* \return OK - Success
* \return IRQ_PEND_ERR - Can not use unblock multiple tasks function from interrupt handler code
*********************************************************************************************/
INT8U UnBlockMultipleTask(INT8U TaskStart, INT8U TaskNumber);

/*********************************************************************************//**
* \fn void BRTOS_Init(void)
* \brief Initialize BRTOS control blocks and tick timer (Internal kernel function).
*************************************************************************************/
void BRTOS_Init(void);

/*****************************************************************//**
* \fn INT8U OSSchedule(void)
* \brief BRTOS Scheduler function (Internal kernel function).
*********************************************************************/
INT8U OSSchedule(void);

/*****************************************************************//**
* \fn INT8U SAScheduler(PriorityType ReadyList)
* \brief Sucessive Aproximation Scheduler (Internal kernel function).
* \param ReadyList List of the tasks ready to run
* \return The priority of the highest priority task ready to run
*********************************************************************/
INT8U SAScheduler(PriorityType ReadyList);



////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Event Variables Extern Declarations         /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

#if (BRTOS_SEM_EN == 1)
  /// Semahore Control Block
  extern BRTOS_Sem BRTOS_Sem_Table[BRTOS_MAX_SEM];
#endif

#if (BRTOS_MUTEX_EN == 1)
  /// Mutex Control Block
  extern BRTOS_Mutex BRTOS_Mutex_Table[BRTOS_MAX_MUTEX];
#endif

#if (BRTOS_MBOX_EN == 1)
  /// MailBox Control Block
  extern BRTOS_Mbox BRTOS_Mbox_Table[BRTOS_MAX_MBOX];
#endif

#if (BRTOS_QUEUE_EN == 1)
  /// Queue Control Block
  extern BRTOS_Queue BRTOS_Queue_Table[BRTOS_MAX_QUEUE];
#endif


/*****************************************************************************************//**
* \fn void initEvents(void)
* \brief Initialize event control blocks
* \return NONE
*********************************************************************************************/  
void initEvents(void);


#if (BRTOS_SEM_EN == 1)

  /*****************************************************************************************//**
  * \fn INT8U OSSemCreate (INT8U cnt, BRTOS_Sem **event)
  * \brief Allocates a semaphore control block
  * \param cnt Initial Semaphore counter - default = 0
  * \param **event Address of the semaphore control block pointer
  * \return IRQ_PEND_ERR Can not use semaphore create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No semaphore control blocks available
  * \return ALLOC_EVENT_OK Semaphore control block successfully allocated
  *********************************************************************************************/
  INT8U OSSemCreate (INT8U cnt, BRTOS_Sem **event);
  
  /*****************************************************************************************//**
  * \fn INT8U OSSemDelete (BRTOS_Sem **event)
  * \brief Releases a semaphore control block
  * \param **event Address of the semaphore control block pointer
  * \return IRQ_PEND_ERR Can not use semaphore delete function from interrupt handler code
  * \return DELETE_EVENT_OK Semaphore control block released with success
  *********************************************************************************************/
  INT8U OSSemDelete (BRTOS_Sem **event);

  /*****************************************************************************************//**
  * \fn INT8U OSSemPend (BRTOS_Sem *pont_event, INT16U timeout)
  * \brief Wait for a semaphore post
  *  Semaphore pend may be used to syncronize tasks or wait for an event occurs.
  *  A task exits a pending state with a semaphore post or by timeout.
  * \param *pont_event Semaphore pointer
  * \param timeout Timeout to the semaphore pend exits
  * \return OK Success
  * \return TIMEOUT There was no post for this semaphore in the specified time
  * \return IRQ_PEND_ERR Can not use semaphore pend function from interrupt handler code
  * \return NO_EVENT_SLOT_AVAILABLE Full Event list
  *********************************************************************************************/
  INT8U OSSemPend (BRTOS_Sem *pont_event, INT16U timeout);
  
  /*****************************************************************************************//**
  * \fn INT8U OSSemPost(BRTOS_Sem *pont_event)
  * \brief Semaphore post
  *  Semaphore Post may be used to syncronize tasks or to inform that an event occurs.
  * \param *pont_event Semaphore pointer
  * \return OK Success
  * \return ERR_SEM_OVF Semaphore counter overflow
  *********************************************************************************************/  
  INT8U OSSemPost(BRTOS_Sem *pont_event);
#endif

#if (BRTOS_MUTEX_EN == 1)
  /*****************************************************************************************//**
  * \fn INT8U OSMutexCreate (BRTOS_Mutex **event, INT8U HigherPriority)
  * \brief Allocates a mutex control block
  * \param **event Address of the mutex control block pointer
  * \param HigherPriority Higher priority of the tasks that will share a resource
  * \return IRQ_PEND_ERR Can not use mutex create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No mutex control blocks available
  * \return ALLOC_EVENT_OK Mutex control block successfully allocated
  *********************************************************************************************/
  INT8U OSMutexCreate (BRTOS_Mutex **event, INT8U HigherPriority);
  
  /*****************************************************************************************//**
  * \fn INT8U OSMutexDelete (BRTOS_Mutex **event)
  * \brief Releases a mutex control block
  * \param **event Address of the mutex control block pointer
  * \return IRQ_PEND_ERR Can not use mutex delete function from interrupt handler code
  * \return DELETE_EVENT_OK Mutex control block released with success
  *********************************************************************************************/  
  INT8U OSMutexDelete (BRTOS_Mutex **event);

  /*****************************************************************************************//**
  * \fn INT8U OSMutexAcquire(BRTOS_Mutex *pont_event)
  * \brief Wait for a mutex release
  *  Mutex release may be used to manage shared resources, for exemple, a LCD.
  *  A acquired state exits with a mutex owner release
  * \param *pont_event Mutex pointer
  * \return OK Success
  * \return IRQ_PEND_ERR Can not use mutex pend function from interrupt handler code
  * \return NO_EVENT_SLOT_AVAILABLE Full Event list
  *********************************************************************************************/
  INT8U OSMutexAcquire(BRTOS_Mutex *pont_event);

  /*****************************************************************************************//**
  * \fn INT8U OSMutexRelease(BRTOS_Mutex *pont_event)
  * \brief Release Mutex
  *  Mutex release must be used to release a shared resource.
  *  Only the mutex owner can executed the mutex post function with success.
  * \param *pont_event Mutex pointer
  * \return OK Success
  * \return ERR_EVENT_OWNER The function caller is not the mutex owner
  * \return ERR_MUTEX_OVF Mutex counter overflow
  *********************************************************************************************/  
  INT8U OSMutexRelease(BRTOS_Mutex *pont_event);
#endif

#if (BRTOS_MBOX_EN == 1)

  /*****************************************************************************************//**
  * \fn INT8U OSMboxCreate (BRTOS_Mbox **event, void *message)
  * \brief Allocates a mailbox control block
  * \param **event Address of the mailbox control block pointer
  * \param *message Specifies an initial message for the allocated mailbox control block
  * \return IRQ_PEND_ERR Can not use mailbox create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No mailbox control blocks available
  * \return ALLOC_EVENT_OK Mailbox control block successfully allocated
  *********************************************************************************************/
  INT8U OSMboxCreate (BRTOS_Mbox **event, void *message);
  
  /*****************************************************************************************//**
  * \fn INT8U OSMboxDelete (BRTOS_Mbox **event)
  * \brief Releases a mailbox control block
  * \param **event Address of the mailbox control block pointer
  * \return IRQ_PEND_ERR Can not use mailbox delete function from interrupt handler code
  * \return DELETE_EVENT_OK Mailbox control block released with success
  *********************************************************************************************/  
  INT8U OSMboxDelete (BRTOS_Mbox **event);
  
  /*****************************************************************************************//**
  * \fn void *OSMboxPend (BRTOS_Mbox *pont_event, INT16U timeout)
  * \brief Wait for a message post
  *  Mailbox pend may be used to receive messages from tasks and interrupts.
  *  A task exits a pending state with a mailbox post or by timeout.
  *  A message could be of any kind of data type.
  * \param *pont_event Mailbox pointer
  * \param *Mail Mail content pointer
  * \param timeout Timeout to the mailbox pend exits
  * \return OK Success
  * \return TIMEOUT There was no post for this semaphore in the specified time
  * \return IRQ_PEND_ERR Can not use semaphore pend function from interrupt handler code
  *********************************************************************************************/  
  INT8U OSMboxPend (BRTOS_Mbox *pont_event, void **Mail, INT16U timeout);
  
  /*****************************************************************************************//**
  * \fn INT8U OSMboxPost(BRTOS_Mbox *pont_event, void *message)
  * \brief Mailbox post
  *  Mailbox post may be used to send messages to tasks.
  *  A message could be of any kind of data type.
  * \param *pont_event Semaphore pointer
  * \param *message Pointer to the message to be sent
  * \return OK Success
  * \return ERR_EVENT_NO_CREATED No tasks waiting for the message
  *********************************************************************************************/  
  INT8U OSMboxPost(BRTOS_Mbox *pont_event, void *message);
#endif


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue Prototypes                            /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

#if (BRTOS_QUEUE_EN == 1)

  /*****************************************************************************************//**
  * \fn INT8U OSQueueCreate(OS_QUEUE *cqueue, INT16U size, BRTOS_Queue **event)
  * \brief Allocates a queue control block  
  * \param *cqueue Queue pointer
  * \param size Queue size
  * \param **event Queue event pointer
  * \return IRQ_PEND_ERR Can not use queue create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No queue control blocks available
  * \return ALLOC_EVENT_OK Queue control block successfully allocated
  *********************************************************************************************/
  INT8U OSQueueCreate(OS_QUEUE *cqueue, INT16U size, BRTOS_Queue **event);
  
  /*****************************************************************************************//**
  * \fn OSWQueue(OS_QUEUE *cqueue,INT8U data)
  * \brief Writes new data in the specified queue
  * \param *cqueue Pointer to a queue
  * \param data Data to be written in the queue
  * \return BUFFER_UNDERRUN Queue overflow - There is no more available for new data
  * \return READ_BUFFER_OK New data successfully written
  *********************************************************************************************/
  INT8U OSWQueue(OS_QUEUE *cqueue,INT8U data);

  /*****************************************************************************************//**
  * \fn INT8U OSRQueue(OS_QUEUE *cqueue, INT8U* pdata)
  * \brief Reads new data from the specified queue
  * \param *cqueue Pointer to a queue
  * \param *pdata Pointer to data read - first data in the output buffer of the specified queue
  * \return READ_BUFFER_OK Data successfully read
  * \return NO_ENTRY_AVAILABLE There is no more available entry in queue
  *********************************************************************************************/
  INT8U OSRQueue(OS_QUEUE *cqueue, INT8U* pdata);
  
  /*****************************************************************************************//**
  * \fn INT8U OSCleanQueue(OS_QUEUE *cqueue)
  * \brief Clean data in the specified queue
  * \param *cqueue Pointer to a queue
  * \return CLEAN_BUFFER_OK Queue successfully cleaned
  *********************************************************************************************/  
  INT8U OSCleanQueue(BRTOS_Queue *pont_event);
  
  /*****************************************************************************************//**
  * \fn INT8U OSQueuePend (BRTOS_Queue *pont_event, OS_QUEUE *cqueue, INT16U timeout)
  * \brief Wait for a queue post 
  *  A task exits a pending state with a queue post or by timeout.
  * \param *pont_event Queue event pointer
  * \param *cqueue Queue pointer
  * \param timeout Timeout to the queue pend exits
  * \return First data in the output buffer of the specified queue
  *********************************************************************************************/
  INT8U OSQueuePend (BRTOS_Queue *pont_event, INT8U* pdata, INT16U timeout);
  
  /*****************************************************************************************//**
  * \fn INT8U OSQueuePost(BRTOS_Queue *pont_event, OS_QUEUE *cqueue,INT8U data)
  * \brief Queue post
  *  A task exits a pending state with a queue post or by timeout.
  * \param *pont_event Queue event pointer
  * \param *cqueue Queue pointer
  * \param data Data to be written in the queue
  * \param timeout Timeout to the queue pend exits
  * \return First data in the output buffer of the specified queue
  *********************************************************************************************/
  INT8U OSQueuePost(BRTOS_Queue *pont_event, INT8U data); 
#endif

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue 16 bits Prototypes                    /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

#if (BRTOS_QUEUE_16_EN == 1)

  /*****************************************************************************************//**
  * \fn INT8U OSQueueCreate(OS_QUEUE *cqueue, INT16U size, BRTOS_Queue **event)
  * \brief Allocates a queue control block  
  * \param *cqueue Queue pointer
  * \param size Queue size
  * \param **event Queue event pointer
  * \return IRQ_PEND_ERR Can not use queue create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No queue control blocks available
  * \return ALLOC_EVENT_OK Queue control block successfully allocated
  *********************************************************************************************/
  INT8U OSQueue16Create(OS_QUEUE_16 *cqueue, INT16U size, BRTOS_Queue **event);
  
  /*****************************************************************************************//**
  * \fn OSWQueue(OS_QUEUE *cqueue,INT8U data)
  * \brief Writes new data in the specified queue
  * \param *cqueue Pointer to a queue
  * \param data Data to be written in the queue
  * \return BUFFER_UNDERRUN Queue overflow - There is no more available for new data
  * \return READ_BUFFER_OK New data successfully written
  *********************************************************************************************/
  INT8U OSWQueue16(OS_QUEUE_16 *cqueue,INT16U data);

  /*****************************************************************************************//**
  * \fn INT8U OSRQueue(OS_QUEUE *cqueue)
  * \brief Reads new data from the specified queue
  * \param *cqueue Pointer to a queue
  * \param *pdata Pointer to data read - first data in the output buffer of the specified queue  
  * \return First data in the output buffer of the specified queue
  *********************************************************************************************/
  INT8U OSRQueue16(OS_QUEUE_16 *cqueue, INT16U *pdata);
  
  /*****************************************************************************************//**
  * \fn INT8U OSCleanQueue(OS_QUEUE *cqueue)
  * \brief Clean data in the specified queue
  * \param *cqueue Pointer to a queue
  * \return CLEAN_BUFFER_OK Queue successfully cleaned
  *********************************************************************************************/  
  INT8U OSCleanQueue16(OS_QUEUE_16 *cqueue);
    
#endif

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Queue 32 bits Prototypes                    /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

#if (BRTOS_QUEUE_32_EN == 1)

  /*****************************************************************************************//**
  * \fn INT8U OSQueueCreate(OS_QUEUE *cqueue, INT16U size, BRTOS_Queue **event)
  * \brief Allocates a queue control block  
  * \param *cqueue Queue pointer
  * \param size Queue size
  * \param **event Queue event pointer
  * \return IRQ_PEND_ERR Can not use queue create function from interrupt handler code
  * \return NO_AVAILABLE_EVENT No queue control blocks available
  * \return ALLOC_EVENT_OK Queue control block successfully allocated
  *********************************************************************************************/
  INT8U OSQueue32Create(OS_QUEUE_32 *cqueue, INT16U size, BRTOS_Queue **event);
  
  /*****************************************************************************************//**
  * \fn OSWQueue(OS_QUEUE *cqueue,INT8U data)
  * \brief Writes new data in the specified queue
  * \param *cqueue Pointer to a queue
  * \param data Data to be written in the queue
  * \return BUFFER_UNDERRUN Queue overflow - There is no more available for new data
  * \return READ_BUFFER_OK New data successfully written
  *********************************************************************************************/
  INT8U OSWQueue32(OS_QUEUE_32 *cqueue,INT32U data);

  /*****************************************************************************************//**
  * \fn INT8U OSRQueue(OS_QUEUE *cqueue)
  * \brief Reads new data from the specified queue
  * \param *cqueue Pointer to a queue
  * \param *pdata Pointer to data read - first data in the output buffer of the specified queue  
  * \return First data in the output buffer of the specified queue
  *********************************************************************************************/
  INT8U OSRQueue32(OS_QUEUE_32 *cqueue, INT32U *pdata);
  
  /*****************************************************************************************//**
  * \fn INT8U OSCleanQueue(OS_QUEUE *cqueue)
  * \brief Clean data in the specified queue
  * \param *cqueue Pointer to a queue
  * \return CLEAN_BUFFER_OK Queue successfully cleaned
  *********************************************************************************************/  
  INT8U OSCleanQueue32(OS_QUEUE_32 *cqueue);
    
#endif

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      OS Variables Extern Declarations            /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

extern       PriorityType OSReadyList;
extern       PriorityType OSBlockedList;
extern const PriorityType PriorityMask[configMAX_TASK_PRIORITY+1];

extern ContextType *Tail;
extern ContextType *Head;

extern INT8U iNesting;
extern INT8U currentTask;
extern INT8U SelectedTask;
extern ContextType ContextTask[NUMBER_OF_TASKS + 2];
extern INT16U iStackAddress;
extern INT8U NumberOfInstalledTasks;
extern INT16U counter;
extern volatile INT32U OSDuty;
extern INT8U PriorityVector[configMAX_TASK_INSTALL];
extern volatile INT32U OSDutyTmp;
extern volatile INT16U LastOSDuty;
extern INT8U STACK[HEAP_SIZE];
extern INT32U TaskAlloc;

extern INT8U  QUEUE_STACK[QUEUE_HEAP_SIZE];
extern INT16U iQueueAddress;

#if (PROCESSOR == ATMEGA)
extern PGM_P BRTOSStringTable[] PROGMEM;
#else
#if (PROCESSOR == PIC18)
extern const  CHAR8 *version;
#else
extern const CHAR8 *version;
#endif
#endif

#if ((PROCESSOR == ATMEGA) || (PROCESSOR == PIC18))
extern CHAR8 BufferText[32];
#endif

#if (SP_SIZE == 32)
  extern INT32U StackAddress;
#endif

#if (SP_SIZE == 16)
  extern INT16U StackAddress;
#endif



////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
#define OS_INT_ENTER()  iNesting++;
      
  
#define OS_INT_EXIT()                                                   \
  CriticalDecNesting();                                                 \
  if (!iNesting)                                                        \
  {                                                                     \
    SelectedTask = OSSchedule();                                        \
    if (currentTask != SelectedTask){                                   \
        OS_SAVE_CONTEXT();                                              \
        OS_SAVE_SP();                                                   \
        ContextTask[currentTask].StackPoint = SPvalue;                  \
          currentTask = SelectedTask;                                     \
        SPvalue = ContextTask[currentTask].StackPoint;                  \
        OS_RESTORE_SP();                                                \
        OS_RESTORE_CONTEXT();                                           \
    }                                                                   \
  }                                                                     \

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


#define RemoveFromDelayList()                       \
        if(Task == Head)                            \
        {                                           \
          if(Task == Tail)                          \
          {                                         \
            Tail = NULL;                            \
            Head = NULL;                            \
          }                                         \
          else                                      \
          {                                         \
            Head = Task->Next;                      \
            Head->Previous = NULL;                  \
          }                                         \
        }                                           \
        else                                        \
        {                                           \
          if(Task == Tail)                          \
          {                                         \
            Tail = Task->Previous;                  \
            Tail->Next = NULL;                      \
          }                                         \
          else                                      \
          {                                         \
            Task->Next->Previous = Task->Previous;  \
            Task->Previous->Next = Task->Next;      \
          }                                         \
        }


#define IncludeTaskIntoDelayList()                  \
        if(Tail != NULL)                            \
        {                                           \
          /* Insert task into list */               \
          Tail->Next = Task;                        \
          Task->Previous = Tail;                    \
          Tail = Task;                              \
          Tail->Next = NULL;                        \
        }                                           \
        else{                                       \
           /* Init delay list */                    \
           Tail = Task;                             \
           Head = Task;                             \
           Task->Next = NULL;                       \
           Task->Previous = NULL;                   \
        }


#endif
