#include "brtos/includes/BRTOS.h"
#include "includes/drivers.h"
#include "includes/tasks.h"
#include "drivers/serial.h"
#include "drivers/lcd.h"
#include "drivers/adc.h"
//#include "BRTOS.h"
//#include "drivers.h"
//#include "tasks.h"
//#include "serial.h"
//#include "lcd.h"
//#include "debug_stack.h"
//#include <adc.h>


extern BRTOS_Sem    *SemTeste;
extern BRTOS_Queue  *QSerialRX;

CHAR8 BufferLCD[17];


void System_Time(void)
{
   // task setup
   INT8U i = 0;
   OSResetTime(&Hora); 
   OSResetDate(&Data);  
  
   /* task main loop */
   for (;;)
   {
      #if (WATCHDOG == 1)
        __asm
        CLRWDT
        __endasm;
      #endif
      (void)DelayTask(10);
      i++;
      if (i >= 100)
      {
        OSUpdateUptime(&Hora,&Data);
        i = 0;
      }
   }
}



void Task_2(void)
{
   /* task setup */
   INT8U cont = 0;   
  
   /* task main loop */
   for (;;)
   {
      cont++;
      (void)DelayTask(35);
      
      //Acorda a tarefa 3
      (void)OSSemPost(SemTeste);
   }
}





void Task_3(void)
{
   /* task setup */
   INT8U seq1 = 0x08;
   INT8U sent1 = 0;
   
   LATB = 0;    
   TRISB = 0;

   /* task main loop */
   for (;;)
   {
         LATB=seq1;

         //Se sentido de P2.0 a P2.7 transla��o para esquerda
         if(sent1==0){ seq1<<=1;

                            //Se o �ltimo Led ficar� aceso, inverte sentido
                            if(seq1==0x80) sent1=1;
                            }
               //Caso contr�rio rota��o para direita
               else{ seq1>>=1;

                            //Se o primeiro Led ficar� aceso, inverte sentido                    oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
                            if(seq1==0x01) sent1=0;
                            }

      (void)OSSemPend(SemTeste,0);
      //(void)DelayTask(30);
   }
}





void Task_Serial(void)
{
   /* task setup */
   volatile INT8U pedido = 0;
   
   // task main loop
   for (;;) 
   {

/*
      if(!OSQueuePend(QSerialRX, (INT8U*)&pedido, 0))
      {
        switch(pedido)
        {
          #if (COMPUTES_CPU_LOAD == 1)
          case '1':
            acquireUART();
            Transmite_CPU_Load();
            releaseUART();
            break;
          #endif
          case '2':
            acquireUART();
            Transmite_Uptime();
            releaseUART();
            break;
          case '3':
            acquireUART();
            //Serial_Envia_Frase((CHAR8*)version);
               //strcpypgm2ram (BufferText, (const rom far CHAR8*)version);
               Serial_Envia_Frase(BufferText);
            Serial_Envia_Caracter(10);
            Serial_Envia_Caracter(13);
            releaseUART();
            break;
          case '4':
            acquireUART();
            Transmite_RAM_Ocupada();
            releaseUART();
            break;
          case '5':
            acquireUART();
            Transmite_Task_Stacks();
            releaseUART();
            break;
          case '6':
            acquireUART();
               //strcpypgm2ram (BufferText, (const rom char far *)"CPU: PIC18F Core");
               Serial_Envia_Frase(BufferText);
            Serial_Envia_Caracter(10);
            Serial_Envia_Caracter(13);
            releaseUART();
            break;
/ *
          #if (OSTRACE == 1) 
          case '6':
            Send_OSTrace();
            Serial_Envia_Caracter(LF);
            Serial_Envia_Caracter(CR);            
            break;            
          #endif  
         * /
          default:
            acquireUART();
            Serial_Envia_Caracter(pedido);
            releaseUART();
            break;
        }
      }
*/
   }
}



void Task_LCD(void)
{
   /* task setup */
   INT16U uiValorAD = 0;
   init_lcd();

   //strcpypgm2ram (BufferLCD, (const rom char far *)"ugenios + BRTOS");
   BufferLCD[0] = 0xE4;

   write_lcd(BufferLCD);
   
   posiciona(2, 1);
   //strcpypgm2ram (BufferLCD, (const rom char far *)"Temp: ");
   write_lcd(BufferLCD);


   TRISA = 0xFF;   

   InicializaAD();

   // Liga resistencia de aquecimento
   LATCbits.LATC5 = 1;
   TRISCbits.TRISC5 = 0;

   // Liga ventilador
   LATCbits.LATC2 = 0;
   TRISCbits.TRISC2 = 0;

   uiValorAD = LeValorAD();

    // task main loop
    for (;;) 
    {
    
      
      uiValorAD = LeValorAD();

      if (uiValorAD >= 30)
      {
         // Liga ventilador
         LATCbits.LATC2 = 1;    
         // Desliga resist�ncia
         LATCbits.LATC5 = 0;
      }else
      {
         // Desliga ventilador
         LATCbits.LATC2 = 0;    
         // Liga resist�ncia
         LATCbits.LATC5 = 1;
      }

      posiciona(2, 7);
      write_numero(uiValorAD);

      BufferLCD[0]=0xDF;
      BufferLCD[1]='C';
      BufferLCD[2]=0;
      write_lcd(BufferLCD);
 
      DelayTask(1000);
    }
}


