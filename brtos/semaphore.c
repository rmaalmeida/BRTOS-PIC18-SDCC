/**
* \file semaphore.c
* \brief BRTOS Semaphore functions
*
* Functions to install and use semaphores
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
*                                       OS Semaphore functions
*
*
*   Author:   Gustavo Weber Denardin
*   Revision: 1.0
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
*   Authors:  Douglas Fran�a
*   Revision: 1.62
*   Date:     13/12/2010
*
*   Authors:  Carlos Henrique Barriquelo
*   Revision: 1.64
*   Date:     22/02/2011
*
*********************************************************************************************************/

#include "includes/BRTOS.h"
//#include "BRTOS.h"

#if (PROCESSOR == COLDFIRE_V1)
#pragma warn_implicitconv off
#endif

#if (BRTOS_SEM_EN == 1)
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Create Semaphore Function                   /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U OSSemCreate (INT8U cnt, BRTOS_Sem **event)
{
  OS_SR_SAVE_VAR
  int i=0;

  BRTOS_Sem *pont_event;

  if (iNesting > 0) {                                // See if caller is an interrupt
     return(IRQ_PEND_ERR);                           // Can't be create by interrupt
  }
    
  // Enter critical Section
  if (currentTask)
     OSEnterCritical();
  
  // Verifica se ainda h� blocos de controle de eventos dispon�veis
  for(i=0;i<=BRTOS_MAX_SEM;i++)
  {
    
    if(i >= BRTOS_MAX_SEM)
    {
      // Caso n�o haja mais blocos dispon�veis, retorna exce��o
      
      // Exit critical Section
      if (currentTask)
         OSExitCritical();
      
      return(NO_AVAILABLE_EVENT);
    }
          
    
    if(BRTOS_Sem_Table[i].OSEventAllocated != TRUE)
    {
      BRTOS_Sem_Table[i].OSEventAllocated = TRUE;
      pont_event = &BRTOS_Sem_Table[i];
      break;      
    }
  }
  
    // Exit Critical
  pont_event->OSEventCount = cnt;                      // Set semaphore count value
  pont_event->OSEventWait  = 0;
  
  pont_event->OSEventWaitList=0;
  
  *event = pont_event;
  
  // Exit critical Section
  if (currentTask)
     OSExitCritical();
  
  return(ALLOC_EVENT_OK);
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Delete Semaphore Function                   /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U OSSemDelete (BRTOS_Sem **event)
{
  OS_SR_SAVE_VAR
  BRTOS_Sem *pont_event;

  if (iNesting > 0) {                                // See if caller is an interrupt
      return(IRQ_PEND_ERR);                          // Can't be delete by interrupt
  }
    
  // Enter Critical Section
  OSEnterCritical();
  
  pont_event = *event;  
  pont_event->OSEventAllocated = 0;
  pont_event->OSEventCount     = 0;                      
  pont_event->OSEventWait      = 0;
  
  pont_event->OSEventWaitList=0;
  
  *event = NULL;
  
  // Exit Critical Section
  OSExitCritical();
  
  return(DELETE_EVENT_OK);
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////





////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////      Semaphore Pend Function                     /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U OSSemPend (BRTOS_Sem *pont_event, INT16U time_wait)
{
  OS_SR_SAVE_VAR
  INT8U  iPriority = 0;
  INT32U timeout;
  ContextType *Task;
  
  #if (ERROR_CHECK == 1)
    // Can not use semaphore pend function from interrupt handling code
    if(iNesting > 0)
    {
      return(IRQ_PEND_ERR);
    }
    
    // Verifies if the pointer is NULL
    if(pont_event == NULL)
    {
      return(NULL_EVENT_POINTER);
    }
  #endif
    
  // Enter Critical Section
  OSEnterCritical();

  #if (ERROR_CHECK == 1)
    // Verifies if the event is allocated
    if(pont_event->OSEventAllocated != TRUE)
    {
      // Exit Critical Section
      OSExitCritical();
      return(ERR_EVENT_NO_CREATED);
    }
  #endif
  
  // BRTOS TRACE SUPPORT
  #if (OSTRACE == 1)     
      #if(OS_TRACE_BY_TASK == 1)
      Update_OSTrace(currentTask, SEMPEND);
      #else
      Update_OSTrace(ContextTask[currentTask].Priority, SEMPEND);
      #endif
  #endif    

  // Verify if there was a post
  if (pont_event->OSEventCount > 0)
  {        
    // Decreases semaphore count
    pont_event->OSEventCount--;
    
    // Exit Critical Section
    OSExitCritical();
    return OK;
  } 
 
  Task = &ContextTask[currentTask];
    
  // Copy task priority to local scope
  iPriority = Task->Priority;
  // Increases the semaphore wait list counter
  pont_event->OSEventWait++;
  
  // Allocates the current task on the semaphore wait list
  pont_event->OSEventWaitList = pont_event->OSEventWaitList | (PriorityMask[iPriority]);
  
  // Task entered suspended state, waiting for semaphore post
  #if (VERBOSE == 1)
  Task->State = SUSPENDED;
  Task->SuspendedType = SEMAPHORE;
  #endif
  
  // Remove current task from the Ready List
  OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
  
  // Set timeout overflow
  if (time_wait)
  {  
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
  } else
  {
    Task->TimeToWait = NO_TIMEOUT;
  }
  
  // Change Context - Returns on time overflow or semaphore post
  ChangeContext();

  
  if (time_wait)
  {   
      /* Edited by Carlos H. Barriquello */
      
      /* Moved critical region to inside test region */
      // Exit Critical Section
      OSExitCritical();
      // Enter Critical Section
      OSEnterCritical();
      
      /* End of edition */
   
      // Verify if the reason of task wake up was queue timeout
      if(Task->TimeToWait == EXIT_BY_TIMEOUT)
      {
          // Test if both timeout and post have occured before arrive here
          if ((pont_event->OSEventWaitList & PriorityMask[iPriority]))
          {
            // Remove the task from the queue wait list
            pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
            
            // Decreases the queue wait list counter
            pont_event->OSEventWait--;
            
            // Exit Critical Section
            OSExitCritical();
            
            // Indicates queue timeout
            return TIMEOUT;
          }
      }
      else
      {
          // Remove the time to wait condition
          Task->TimeToWait = NO_TIMEOUT;
          
          // Remove from delay list
          RemoveFromDelayList();
      }
     
  }    
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
/////      Semaphore Post Function                     /////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

INT8U OSSemPost(BRTOS_Sem *pont_event)
{
  OS_SR_SAVE_VAR  
  INT8U iPriority = (INT8U)0;
  #if (VERBOSE == 1)
  INT8U TaskSelect = 0;
  #endif
  
  #if (ERROR_CHECK == 1)    
    // Verifies if the pointer is NULL
    if(pont_event == NULL)
    {
      return(NULL_EVENT_POINTER);
    }
  #endif

  // Enter Critical Section
  #if (NESTING_INT == 0)
  if (!iNesting)
  #endif
     OSEnterCritical();
     
  #if (ERROR_CHECK == 1)        
    // Verifies if the event is allocated
    if(pont_event->OSEventAllocated != TRUE)
    {
      // Exit Critical Section
      #if (NESTING_INT == 0)
      if (!iNesting)
      #endif
         OSExitCritical();
      return(ERR_EVENT_NO_CREATED);
    }
  #endif
     
  // BRTOS TRACE SUPPORT
  #if (OSTRACE == 1)  
    if(!iNesting){ 
      #if(OS_TRACE_BY_TASK == 1)
      Update_OSTrace(currentTask, SEMPOST);
      #else
      Update_OSTrace(ContextTask[currentTask].Priority, SEMPOST);
      #endif
    }else{
      Update_OSTrace(0, SEMPOST);
    }
  #endif      
  
  // See if any task is waiting for semaphore
  if (pont_event->OSEventWait != 0)
  {
    // Selects the highest priority task
    iPriority = SAScheduler(pont_event->OSEventWaitList);    

    // Remove the selected task from the semaphore wait list
    pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
    
    // Decreases the semaphore wait list counter
    pont_event->OSEventWait--;
    
    // Put the selected task into Ready List
    #if (VERBOSE == 1)
    TaskSelect = PriorityVector[iPriority];
    ContextTask[TaskSelect].State = READY;
    #endif
    
    OSReadyList = OSReadyList | (PriorityMask[iPriority]);
    
    // If outside of an interrupt service routine, change context to the highest priority task
    // If inside of an interrupt, the interrupt itself will change the context to the highest priority task
    if (!iNesting)
    {
      // Verify if there is a higher priority task ready to run
      ChangeContext();      
    }

    // Exit Critical Section
    #if (NESTING_INT == 0)
    if (!iNesting)
    #endif
      OSExitCritical();
    
    return OK;
  }
    
  // Make sure semaphore will not overflow
  if (pont_event->OSEventCount < 255)
  {
    // Increment semaphore count
    pont_event->OSEventCount++;
                         
    // Exit Critical Section
    #if (NESTING_INT == 0)
    if (!iNesting)
    #endif
       OSExitCritical();
    return OK;
  }
  else
  {
    // Exit Critical Section             
    #if (NESTING_INT == 0)
    if (!iNesting)
    #endif
       OSExitCritical();
    
    // Indicates semaphore overflow
    return ERR_SEM_OVF;
  }
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
#endif
