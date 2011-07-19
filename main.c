//#pragma config WDT = ON

#include "brtos/includes/BRTOS.h"
#include "includes/tasks.h"
#include "drivers/serial.h"


BRTOS_Sem *SemTeste;


void main(void)
{
  OSCCONbits.IDLEN = 1;

  // Initialize BRTOS
  BRTOS_Init(); 

  Serial_Init(57600,3); 
  
  if (OSSemCreate(0,&SemTeste) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };      

 
  if(InstallTask(&System_Time,(const CHAR8 *)"System Time",90,6) != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };

  
  
  if(InstallTask(&Task_2,(const CHAR8 *)"Tarefa Teste 1",83,4) != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };
  
  if(InstallTask(&Task_3,(const CHAR8 *)"Tarefa Teste 2",83,5) != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };
  
 
  if(InstallTask(&Task_Serial,(const CHAR8 *)"Tarefa Serial",128,2) != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };


  if(InstallTask(&Task_LCD,(const CHAR8 *)"Tarefa LCD",128,1) != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };

  // Start Task Scheduler
  if(BRTOSStart() != OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };

  for(;;){};


}
