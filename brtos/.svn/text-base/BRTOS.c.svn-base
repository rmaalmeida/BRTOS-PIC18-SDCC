/**
* \file BRTOS.c
* \brief BRTOS kernel functions
*
* Kernel functions, such as: scheduler, block tasks, unblock tasks, Delay, Change Context
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
*                                           Kernel functions
*
*
*   Author:   Gustavo Weber Denardin
*   Revision: 1.1
*   Date:     11/03/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.2
*   Date:     01/10/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.3
*   Date:     11/10/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.4
*   Date:     19/10/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.45
*   Date:     20/10/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.50
*   Date:     25/10/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.60
*   Date:     30/11/2010
*
*   Authors:  Carlos Henrique Barriquelo e Gustavo Weber Denardin
*   Revision: 1.61
*   Date:     02/12/2010
*
*   Authors:  Douglas França
*   Revision: 1.62
*   Date:     13/12/2010
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



#include "BRTOS.h"

#if (PROCESSOR == COLDFIRE_V1)
#pragma warn_implicitconv off
#endif

#if (PROCESSOR == ATMEGA)
const CHAR8 version[] PROGMEM = "BRTOS Ver. 1.64";	///< Informs BRTOS version
PGM_P BRTOSStringTable[] PROGMEM = 
{
    version
};
#else
#if (PROCESSOR == PIC18)
const rom CHAR8 *version=                            ///< Informs BRTOS version
{
  "BRTOS Ver. 1.64"
};
#else
const CHAR8 *version=                            ///< Informs BRTOS version
{
  "BRTOS Ver. 1.64"
};
#endif
#endif


#if ((PROCESSOR == ATMEGA) || (PROCESSOR == PIC18))
CHAR8 BufferText[TEXT_BUFFER_SIZE];
#endif
                     
INT8U PriorityVector[configMAX_TASK_INSTALL];   ///< Allocate task priorities
INT16U iStackAddress = 0;                       ///< Virtual stack counter - Informs the stack occupation in bytes


INT16U iQueueAddress = 0;                       ///< Queue heap control

#if (SP_SIZE == 32)
INT32U StackAddress = (INT32U)&STACK;           ///< Virtual stack pointer
#endif

#if (SP_SIZE == 16)
INT16U StackAddress = (INT16U)&STACK;           ///< Virtual stack pointer
#endif



// global variables
// Task Manager Variables
INT8U NumberOfInstalledTasks;                 ///< Number of Installed tasks at the moment
INT8U currentTask;                            ///< Current task being executed
INT8U SelectedTask;

#if (NUMBER_OF_PRIORITIES > 16)
  PriorityType OSReadyList = 0;
  PriorityType OSBlockedList = 0xFFFFFFFF;
#else
  #if (NUMBER_OF_PRIORITIES > 8)
    PriorityType OSReadyList = 0;
    PriorityType OSBlockedList = 0xFFFF;
  #else
    PriorityType OSReadyList = 0;
    PriorityType OSBlockedList = 0xFF;
  #endif
#endif

INT16U counter;                                   ///< Incremented each tick timer - Used in delay and timeout functions
volatile INT32U OSDuty=0;                         ///< Used to compute the CPU load
volatile INT32U OSDutyTmp=0;                      ///< Used to compute the CPU load
volatile INT16U LastOSDuty = 0;                   ///< Last CPU load computed
INT16U DutyCnt = 0;                               ///< Used to compute the CPU load
INT32U TaskAlloc = 0;                             ///< Used to search a empty task control block
INT8U  iNesting = 0;                              ///< Used to inform if the current code position is an interrupt handler code

ContextType *Tail;
ContextType *Head;

#if (DEBUG == 0)
volatile INT8U flag_load = TRUE;
#endif


#if (NUMBER_OF_PRIORITIES > 16)
  const PriorityType PriorityMask[configMAX_TASK_PRIORITY+1]=
  {
    0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x0100,0x0200,0x0400,0x0800,0x1000,0x2000,0x4000,0x8000,
    0x010000,0x020000,0x040000,0x080000,0x100000,0x200000,0x400000,0x800000,0x01000000,0x02000000,
    0x04000000,0x08000000,0x10000000,0x20000000,0x40000000,0x80000000
  };
#else
  #if (NUMBER_OF_PRIORITIES > 8)
    const PriorityType PriorityMask[configMAX_TASK_PRIORITY+1]=
    {
      0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x0100,0x0200,0x0400,0x0800,0x1000,0x2000,0x4000,0x8000
    };
  #else
    const PriorityType PriorityMask[configMAX_TASK_PRIORITY+1]=
    {
      0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80
    };  
  #endif
#endif


////////////////////////////////////////////////////////////
/////      Semaphore Control Block Declaration         /////
////////////////////////////////////////////////////////////
#if (BRTOS_SEM_EN == 1)
  /// Semahore Control Block
  BRTOS_Sem        BRTOS_Sem_Table[BRTOS_MAX_SEM];      // Table of EVENT control blocks
#endif


////////////////////////////////////////////////////////////
/////      Mutex Control Block Declaration             /////
////////////////////////////////////////////////////////////
#if (BRTOS_MUTEX_EN == 1)
  /// Mutex Control Block
  BRTOS_Mutex      BRTOS_Mutex_Table[BRTOS_MAX_MUTEX];    // Table of EVENT control blocks
#endif


////////////////////////////////////////////////////////////
/////      Mbox Control Block Declaration              /////
////////////////////////////////////////////////////////////
#if (BRTOS_MBOX_EN == 1)
  /// MailBox Control Block
  BRTOS_Mbox       BRTOS_Mbox_Table[BRTOS_MAX_MBOX];     // Table of EVENT control blocks
#endif


////////////////////////////////////////////////////////////
/////      Queue Control Block Declaration             /////
////////////////////////////////////////////////////////////
#if (BRTOS_QUEUE_EN == 1)
  /// Queue Control Block
  BRTOS_Queue      BRTOS_Queue_Table[BRTOS_MAX_QUEUE];    // Table of EVENT control blocks
#endif


///// RAM definitions

#if (PROCESSOR == PIC18)
#pragma udata stackram
#endif
INT8U STACK[HEAP_SIZE];   						///< Virtual Task stack

#if (PROCESSOR == PIC18)
#pragma udata queueram 
#endif
INT8U QUEUE_STACK[QUEUE_HEAP_SIZE];             ///< Queue heap

#if (PROCESSOR == PIC18)
#pragma udata ctxram
#endif
ContextType ContextTask[NUMBER_OF_TASKS + 2]; ///< Task context info
                                              ///< ContextTask[0] not used
                                              ///< Last ContexTask is the Idle Task


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Priority Preemptive Scheduler               /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/************************************************************//**
* \fn void OSSchedule(void)
* \brief Priority Preemptive Scheduler (Internal kernel function).
****************************************************************/

INT8U OSSchedule(void)
{
	INT8U TaskSelect = 0xFF;
	INT8U Priority   = 0;
	
  Priority = SAScheduler(OSReadyList & OSBlockedList);
  TaskSelect = PriorityVector[Priority];
  
	return TaskSelect;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Task Delay Function in Tick Times           /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

// Atraso em passos de TickCount
INT8U DelayTask(INT16U time_wait)
{
  OS_SR_SAVE_VAR
  INT32U timeout;
  ContextType *Task = &ContextTask[currentTask];
   
  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
  }

  if (currentTask)
  {
    
    if (time_wait > 0)
    {
        OSEnterCritical();
        
        // BRTOS TRACE SUPPORT
        #if (OSTRACE == 1) 
            #if(OS_TRACE_BY_TASK == 1)
            Update_OSTrace(currentTask, DELAYTASK);
            #else
            Update_OSTrace(Task->Priority, DELAYTASK);
            #endif
        #endif    

        timeout = (INT32U)((INT32U)counter + (INT32U)time_wait);
        
        if (timeout >= TickCountOverFlow)
        {
          Task->TimeToWait = (INT16U)(timeout - TickCountOverFlow);
        }
        else
        {
          Task->TimeToWait = (INT16U)timeout;
        }
        
        // Put task into delay list
        IncludeTaskIntoDelayList();
        
        #if (VERBOSE == 1)
        Task->State = SUSPENDED;
        Task->SuspendedType = DELAY;
        #endif
        
        OSReadyList = OSReadyList & ~(PriorityMask[Task->Priority]);
        
        // Change context
        // Return to task when occur delay overflow
        ChangeContext();
        
        OSExitCritical();
        
        return OK;
    }
    else
    {
        return NO_TASK_DELAY;
    }
  }
  else
  {
    return NOT_VALID_TASK;
  }
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////   Task Delay Function in miliseconds, seconds,   /////
/////   minutes and hours                              /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
// Miliseconds, seconds, minutes and hours delay
INT8U DelayTaskHMSM(INT8U hours, INT8U minutes, INT8U seconds, INT16U miliseconds)
{
  INT32U ticks=0;
  INT32U loops=0;
  
  if (minutes > 59)
    return INVALID_TIME;
  
  if (seconds > 59)
    return INVALID_TIME;
  
  if (miliseconds > 999)
    return INVALID_TIME;  
  
  ticks = (INT32U)hours   * 3600L * configTICK_RATE_HZ
        + (INT32U)minutes * 60L   * configTICK_RATE_HZ
        + (INT32U)seconds *         configTICK_RATE_HZ
        + ((INT32U)miliseconds    * configTICK_RATE_HZ)/1000L;
  
  // Task Delay limit = TickCounterOverflow
  if (ticks > 0)
  {
      loops = ticks / 60000L;
      ticks = ticks % 60000L;
      
      (void)DelayTask(ticks);
      
      while(loops > 0)
      {
        (void)DelayTask(60000);
        loops--;
      }
      return OK;
  }
  else
  {
      return NO_TASK_DELAY;
  }
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      OS Tick Timer Function                      /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

void OS_TICK_HANDLER(void)
{
  OS_SR_SAVE_VAR
  INT8U  iPrio = 0;  
  ContextType *Task = Head;  
   
  ////////////////////////////////////////////////////
  // Put task with delay overflow in the ready list //
  ////////////////////////////////////////////////////  
  while(Task != NULL)
  {      
      if (Task->TimeToWait == counter)
      {

        iPrio = Task->Priority;
        
        #if (NESTING_INT == 1)
        OSEnterCritical();
        #endif        

        // Put the task into the ready list
        OSReadyList = OSReadyList | (PriorityMask[iPrio]);
        
        #if (VERBOSE == 1)
            Task->State = READY;        
        #endif
        
        Task->TimeToWait = EXIT_BY_TIMEOUT;
        
        #if (NESTING_INT == 1)
        OSExitCritical();
        #endif                  
          
        // Remove from delay list
        RemoveFromDelayList();
      }
 
      Task = Task->Next;
  }

  //////////////////////////////////////////
  // System Load                          //
  //////////////////////////////////////////
  
  #if (COMPUTES_CPU_LOAD == 1)
  #if(DEBUG == 1)
     if (DutyCnt >= 1024)
     {
       DutyCnt = 0;
       OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);
       LastOSDuty = (INT16U)(OSDuty >> 10);
       OSDuty = 0;
     }else
     {    
       OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);
       DutyCnt++;
     }
     OSDutyTmp = TIMER_MODULE;   
   #else   
     extern volatile INT8U flag_load;
     flag_load = TRUE;
     
     if (DutyCnt >= 128)
     {
       DutyCnt = 0;
       OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);
       LastOSDuty = OSDuty >> 7;
       OSDuty = 0;
     }else
     {    
       OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);    
       DutyCnt++;
     }
     OSDutyTmp = TIMER_MODULE;
     #endif
  #endif
  //////////////////////////////////////////
	
  #if (TIMER_HOOK_EN == 1)
    BRTOS_TimerHook();
  #endif
}





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      OS Init Task Scheduler Function             /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U BRTOSStart(void)
{
  if (InstallIdle(&Idle,IDLE_STACK_SIZE) != OK)
  {
    return NO_MEMORY;
  };

  currentTask = OSSchedule();
  SPvalue = ContextTask[currentTask].StackPoint;
  OS_RESTORE_SP();
  OS_RESTORE_CONTEXT();
  OS_RESTORE_ISR();
  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      OS Function to Initialize RTOS Variables    /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

void PreInstallTasks(void)
{
  INT8U i=0;
  counter = 0;
  currentTask = 0;
  NumberOfInstalledTasks = 0;
  TaskAlloc = 0;
  iStackAddress = 0;
  
  for(i=0;i<configMAX_TASK_INSTALL;i++)
  {
    PriorityVector[i]=EMPTY_PRIO;
  }
    
  Tail = NULL;
  Head = NULL;
  
  #if (OSRTCEN == 1)
    OSRTCSetup();
  #endif
  
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Block Priority Function                     /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U BlockPriority(INT8U iPriority)
{
  OS_SR_SAVE_VAR
  INT8U BlockedTask = 0;
  
  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
  }
      
  // Enter critical Section
  if (currentTask)  
    OSEnterCritical();


  // Detects the task priority
  BlockedTask = PriorityVector[iPriority];  
  // Block task with priority iPriority
  #if (VERBOSE == 1)
  ContextTask[BlockedTask].Blocked = TRUE;
  #endif
  
  OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
   
  
  if (currentTask == BlockedTask)
  {
     ChangeContext();
  }

  // Exit critical Section
  if (currentTask)
    OSExitCritical();
  
  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      UnBlock Priority Function                   /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U UnBlockPriority(INT8U iPriority)
{
  OS_SR_SAVE_VAR
  #if (VERBOSE == 1)
  INT8U BlockedTask = 0;
  #endif
  
  
  // Enter Critical Section
  #if (NESTING_INT == 0)
  if (!iNesting)
  #endif
     OSEnterCritical();
    
  // Detects the task priority
  #if (VERBOSE == 1)  
  BlockedTask = PriorityVector[iPriority];  
  ContextTask[BlockedTask].Blocked = FALSE;
  #endif
  
  OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
  
  // check if we have unblocked a higher priority task  
  if (currentTask)
  {
    if (!iNesting)
    {
       ChangeContext();
    }
  }
  
  // Exit Critical Section
  #if (NESTING_INT == 0)
  if (!iNesting)
  #endif
     OSExitCritical();

  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Block Task Function                         /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U BlockTask(INT8U iTaskNumber)
{
  OS_SR_SAVE_VAR
  INT8U iPriority = 0;
  
  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
  }
    
  // Enter critical Section
  if (currentTask)
    OSEnterCritical();    

  // Determina a prioridade da função
  #if (VERBOSE == 1)
  ContextTask[iTaskNumber].Blocked = TRUE;
  #endif
  iPriority = ContextTask[iTaskNumber].Priority;
  
  OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
  
  if (currentTask == iTaskNumber)
  {
     ChangeContext();     
  }
  
  // Exit critical Section
  if (currentTask)
    OSExitCritical();  

  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      UnBlock Task Function                       /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U UnBlockTask(INT8U iTaskNumber)
{
  OS_SR_SAVE_VAR
  INT8U iPriority = 0;
  
  // Enter Critical Section
  #if (NESTING_INT == 0)
  if (!iNesting)
  #endif
     OSEnterCritical();

  #if (VERBOSE == 1)
  ContextTask[iTaskNumber].Blocked = FALSE;
  #endif
  
  // Determina a prioridade da função  
  iPriority = ContextTask[iTaskNumber].Priority;

  OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
  
  // check if we have unblocked a higher priority task  
  if (currentTask)
  {
    if (!iNesting)
    {
       ChangeContext();
    }
  }
  
  // Exit Critical Section
  #if (NESTING_INT == 0)
  if (!iNesting)
  #endif
     OSExitCritical();

  return OK;  
  
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Block Multiple Task Function                /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U BlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
{
  OS_SR_SAVE_VAR
  INT8U iTask = 0;
  INT8U TaskFinish = 0;
  INT8U iPriority = 0;  
  
  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
  }
    
  // Enter critical Section
  if (currentTask)
    OSEnterCritical();
  
  TaskFinish = (INT8U)(TaskStart + TaskNumber);
  
  for (iTask = TaskStart; iTask <TaskFinish; iTask++)
  {
    if (iTask != currentTask)
    {      
      #if (VERBOSE == 1)
      ContextTask[iTask].Blocked = TRUE;
      #endif
      // Determina a prioridade da função
      iPriority = ContextTask[iTask].Priority;   
      
      OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
    }
  }
  
  // Exit critical Section
  if (currentTask)
    OSExitCritical();

  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      unBlock Multiple Task Function              /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U UnBlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
{
  OS_SR_SAVE_VAR
  INT8U iTask = 0;
  INT8U TaskFinish = 0;
  INT8U iPriority = 0;    
  
  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
  }
    
  // Enter critical Section
  if (currentTask)
    OSEnterCritical();
  
  TaskFinish = (INT8U)(TaskStart + TaskNumber);
  
  for (iTask = TaskStart; iTask <TaskFinish; iTask++)
  {
    // Determina a prioridade da função
    if (iTask != currentTask)
    {
      iPriority = ContextTask[iTask].Priority;
      
      #if (VERBOSE == 1)
      ContextTask[iTask].Blocked = FALSE;
      #endif
      
      OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
    }
  }
  
  // Exit critical Section
  if (currentTask)
    OSExitCritical();

  return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    OS Idle Task                                  /////
/////                                                  /////
/////    You must put the processor in standby mode    /////
/////                                                  /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

void Idle(void)
{
  /* task setup */
  
  /* task main loop */
  for (;;)
  {
	#if (DEBUG == 1)
       #if (COMPUTES_CPU_LOAD == 1)
       OSDutyTmp = TIMER_COUNTER;
       #endif
	
      #if (IDLE_HOOK_EN == 1)
        IdleHook();
      #endif
      
       OS_Wait;
     #else
       #if (COMPUTES_CPU_LOAD == 1)
       if(flag_load == TRUE)
       {
           flag_load = FALSE;
           OSDutyTmp = TIMER_COUNTER;
	
           #if (IDLE_HOOK_EN == 1)
             IdleHook();
           #endif
  
       }
       #endif
     #endif

  }
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





INT8U InstallTask(void(*FctPtr)(void),const CHAR8 *TaskName, INT16U USER_STACKED_BYTES,INT8U iPriority)
{
  OS_SR_SAVE_VAR
  INT8U i = 0; 
  INT8U TaskNumber = 0;
  ContextType * Task;    
  
   if (currentTask)
    // Enter Critical Section
    OSEnterCritical();  

   if (USER_STACKED_BYTES < NUMBER_MIN_OF_STACKED_BYTES)
   {
       if (currentTask)
        // Exit Critical Section
        OSExitCritical();
       return STACK_SIZE_TOO_SMALL;
   }
   
   if ((iStackAddress + USER_STACKED_BYTES) > HEAP_SIZE)
   {
       if (currentTask)
        // Exit Critical Section
        OSExitCritical();
       return NO_MEMORY;
   }

   if (iPriority)
   {
     if (iPriority > configMAX_TASK_PRIORITY)
     {
        if (currentTask)
         // Exit Critical Section
         OSExitCritical();        
        return END_OF_AVAILABLE_PRIORITIES;
     }
     
     if (PriorityVector[iPriority] != EMPTY_PRIO)
     {
        if (currentTask)
         // Exit Critical Section
         OSExitCritical();        
        return BUSY_PRIORITY;
     }
   }
   else
   {
      if (currentTask)
       // Exit Critical Section
       OSExitCritical();
      return CANNOT_ASSIGN_IDLE_TASK_PRIO;
   }

   NumberOfInstalledTasks++;
      
   // Number Task Discovery
   for(i=0;i<NUMBER_OF_TASKS;i++)
   {
      INT32U teste = 1;
      teste = teste<<i;
    
      if (!(teste & TaskAlloc))
      {
         TaskNumber = i+1;
         TaskAlloc = TaskAlloc | teste;
         break;
      }
   }   
   
   Task = &ContextTask[TaskNumber];   
   
   Task->TaskName = TaskName;

   // Posiciona o inicio do stack da tarefa
   // no inicio da disponibilidade de RAM do HEAP
	#if STACK_GROWTH == 1
	Task->StackPoint = StackAddress + NUMBER_MIN_OF_STACKED_BYTES;
	#else
	Task->StackPoint = StackAddress + (USER_STACKED_BYTES - NUMBER_MIN_OF_STACKED_BYTES);
    #endif
                                                                      
   // Virtual Stack Init
	#if STACK_GROWTH == 1
	Task->StackInit = StackAddress;
	#else
	Task->StackInit = StackAddress + USER_STACKED_BYTES;
	#endif
    

   // Determina a prioridade da função
   Task->Priority = iPriority;

   // Determina a tarefa que irá ocupar esta prioridade
   PriorityVector[iPriority] = TaskNumber;
   // set the function entry address in the context
   
   // Fill the virtual task stack
   CreateVirtualStack(FctPtr, USER_STACKED_BYTES);   
   
   // Incrementa o contador de bytes do stack virtual (HEAP)
   iStackAddress = iStackAddress + USER_STACKED_BYTES;
   
   // Posiciona o endereço de stack virtual p/ a próxima tarefa instalada
   StackAddress = StackAddress + USER_STACKED_BYTES;
   

   Task->TimeToWait = NO_TIMEOUT;
   Task->Next     =  NULL;
   Task->Previous =  NULL;
   
   #if (VERBOSE == 1)
   Task->Blocked = FALSE;
   Task->State = READY;
   #endif   
   
   OSReadyList = OSReadyList | (PriorityMask[iPriority]);
   
   if (currentTask)
    // Exit Critical Section
    OSExitCritical();   
   
   return OK;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////  Idle Task Installation Function                 /////
/////                                                  /////
/////  Parameters:                                     /////
/////  Function pointer and task priority              /////
/////                                                  /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
INT8U InstallIdle(void(*FctPtr)(void), INT16U USER_STACKED_BYTES)
{ 
  OS_SR_SAVE_VAR

   if (currentTask)
    // Enter Critical Section
    OSEnterCritical();
    
   if (USER_STACKED_BYTES < NUMBER_MIN_OF_STACKED_BYTES)
   {
       if (currentTask)
        // Exit Critical Section
        OSExitCritical();
       return STACK_SIZE_TOO_SMALL;
   }    
   
   if ((iStackAddress + USER_STACKED_BYTES) > HEAP_SIZE)
   {
      if (currentTask)
       // Exit Critical Section
       OSExitCritical();
       return NO_MEMORY;
   }


	// Posiciona o inicio do stack da tarefa
   // no inicio da disponibilidade de RAM do HEAP
	#if STACK_GROWTH == 1
	ContextTask[NUMBER_OF_TASKS+1].StackPoint = StackAddress + NUMBER_MIN_OF_STACKED_BYTES;
	#else
	ContextTask[NUMBER_OF_TASKS+1].StackPoint = StackAddress + (USER_STACKED_BYTES - NUMBER_MIN_OF_STACKED_BYTES);
    #endif
                                                                      
   // Virtual Stack Init
	#if STACK_GROWTH == 1
	ContextTask[NUMBER_OF_TASKS+1].StackInit = StackAddress;
	#else
	ContextTask[NUMBER_OF_TASKS+1].StackInit = StackAddress + USER_STACKED_BYTES;
	#endif

   // Determina a prioridade da função
   ContextTask[NUMBER_OF_TASKS+1].Priority = 0;
   // Determina a tarefa que irá ocupar esta prioridade
   PriorityVector[0] = NUMBER_OF_TASKS+1;
   
   // Fill the virtual task stack
   CreateVirtualStack(FctPtr, USER_STACKED_BYTES);    
   
   // Incrementa o contador de bytes do stack virtual (HEAP)
   iStackAddress = iStackAddress + USER_STACKED_BYTES;
   
   // Posiciona o endereço de stack virtual p/ a próxima tarefa instalada
   StackAddress = StackAddress + USER_STACKED_BYTES;   
   
   ContextTask[NUMBER_OF_TASKS+1].TimeToWait = NO_TIMEOUT;
   
   #if (VERBOSE == 1)
   ContextTask[NUMBER_OF_TASKS+1].Blocked = FALSE;
   ContextTask[NUMBER_OF_TASKS+1].State = READY;  
   #endif
   
   OSReadyList = OSReadyList | (PriorityType)1;
   
   if (currentTask)
    // Exit Critical Section
    OSExitCritical();
   
   return OK;
}





void BRTOS_Init(void)
{  
  ////////////////////////////////////////////////////////////  
  /////      Initialize Event Control Blocks             /////
  ////////////////////////////////////////////////////////////
  initEvents();
  
  ////////////////////////////////////////////////////////////  
  /////          Initialize global variables             /////
  ////////////////////////////////////////////////////////////  
  PreInstallTasks();  
  
  ////////////////////////////////////////////////////////////  
  /////            Initialize Tick Timer                 /////
  ////////////////////////////////////////////////////////////  
  TickTimerSetup(); 
}





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Initialize Block List Control               /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

void initEvents(void)
{
  INT8U i=0;
  
  #if (BRTOS_SEM_EN == 1)
    for(i=0;i<BRTOS_MAX_SEM;i++)
      BRTOS_Sem_Table[i].OSEventAllocated = 0;
  #endif
  
  #if (BRTOS_MUTEX_EN == 1)
    for(i=0;i<BRTOS_MAX_MUTEX;i++)
      BRTOS_Mutex_Table[i].OSEventAllocated = 0;
  #endif
    
  #if (BRTOS_MBOX_EN == 1)
    for(i=0;i<BRTOS_MAX_MBOX;i++)
      BRTOS_Mbox_Table[i].OSEventAllocated = 0;    
  #endif
  
  #if (BRTOS_QUEUE_EN == 1)
    for(i=0;i<BRTOS_MAX_QUEUE;i++)
      BRTOS_Queue_Table[i].OSEventAllocated = 0;    
  #endif
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////    Sucessive Aproximation Scheduler Algorithm    /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
INT8U SAScheduler(PriorityType ReadyList)
{
  INT8U prio = 0;
  
  #if (NUMBER_OF_PRIORITIES > 16)
  
  if (ReadyList > 0xFFFF)
  {
    if (ReadyList > 0xFFFFFF)
    {
      if (ReadyList > 0xFFFFFFF)
      {        
        if (ReadyList > 0x3FFFFFFF)
        {
          if (ReadyList > 0x7FFFFFFF)
          {
            prio = 31;
          }
          else
          {
            prio = 30;
          }
        }
        else
        {
          if (ReadyList > 0x1FFFFFFF)
          {
            prio = 29; 
          }
          else
          {
            prio = 28;
          }
        }
      }
      else
      {
        if (ReadyList > 0x3FFFFFF)
        {
          if (ReadyList > 0x7FFFFFF)
          {
            prio = 27;
          }
          else
          {
            prio = 26;
          }
        }
        else
        {
          if (ReadyList > 0x1FFFFFF)
          {
            prio = 25;
          }
          else
          {
            prio = 24;
          }
        }
      }    
    }
    else
    {
      if (ReadyList > 0xFFFFF)
      {
        if (ReadyList > 0x3FFFFF)
        {
          if (ReadyList > 0x7FFFFF)
          {
            prio = 23;
          }
          else
          {
            prio = 22;
          }
        }
        else
        {
          if (ReadyList > 0x1FFFFF)
          {
            prio = 21; 
          }
          else
          {
            prio = 20;
          }
        }
      }
      else
      {
        if (ReadyList > 0x3FFFF)
        {
          if (ReadyList > 0x7FFFF)
          {
            prio = 19;
          }
          else
          {
            prio = 18;
          }
        }
        else
        {
          if (ReadyList > 0x1FFFF)
          {
            prio = 17;
          }
          else
          {
            prio = 16;
          }
        }
      }
    }  
  }
  else
  {
  #endif
    #if (NUMBER_OF_PRIORITIES > 8)
    if (ReadyList > 0xFF)
    {
      if (ReadyList > 0xFFF)
      {        
        if (ReadyList > 0x3FFF)
        {
          if (ReadyList > 0x7FFF)
          {
            prio = 15;
          }
          else
          {
            prio = 14;
          }
        }
        else
        {
          if (ReadyList > 0x1FFF)
          {
            prio = 13; 
          }
          else
          {
            prio = 12;
          }
        }
      }
      else
      {
        if (ReadyList > 0x3FF)
        {
          if (ReadyList > 0x7FF)
          {
            prio = 11;
          }
          else
          {
            prio = 10;
          }
        }
        else
        {
          if (ReadyList > 0x1FF)
          {
            prio = 9;
          }
          else
          {
            prio = 8;
          }
        }
      }    
    }
    else
    {
    #endif
      if (ReadyList > 0x0F)
      {
        if (ReadyList > 0x3F)
        {
          if (ReadyList > 0x7F)
          {
            prio = 7;
          }
          else
          {
            prio = 6;
          }
        }
        else
        {
          if (ReadyList > 0x1F)
          {
            prio = 5; 
          }
          else
          {
            prio = 4;
          }
        }
      }
      else
      {
        if (ReadyList > 0x03)
        {
          if (ReadyList > 0x07)
          {
            prio = 3;
          }
          else
          {
            prio = 2;
          }
        }
        else
        {
          if (ReadyList > 0x1)
          {
            prio = 1;
          }
          else
          {
            prio = 0;
          }
        }
      }
    #if (NUMBER_OF_PRIORITIES > 8)
    }
    #endif
  #if (NUMBER_OF_PRIORITIES > 16)
  }
  #endif
  return prio;
}


