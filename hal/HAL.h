#ifndef OS_HAL_H
#define OS_HAL_H

#include "../includes/hardware.h"
#include "../brtos/includes/OS_types.h"



//#include "OS_types.h"
//#include "hardware.h"

/// Supported processors
#define COLDFIRE_V1        1
#define HCS08            2
#define MSP430            3
#define ATMEGA            4
#define PIC18            5


/// Define the used processor
#define PROCESSOR         PIC18

/// Define if nesting interrupt is active
#define NESTING_INT 0

/// Define if its necessary to save status register / interrupt info
#define OS_SR_SAVE_VAR

// Define CPU Stack Pointer Size
#define SP_SIZE 16

/// Define stack growth direction
#define STACK_GROWTH 1  /// 1 -> down; 0-> up

extern INT16U SPvalue;

#define TEXT_BUFFER_SIZE    32

//char *strcpypgm2ram (auto char *s1, auto const rom char far *s2);

// *******************************************************
// * Port Defines                                        *
// *******************************************************
#define ChangeContext() SwitchContext()
#define UserEnterCritical() INTCONbits.GIEH = 0;
#define UserExitCritical()  INTCONbits.GIEH = 1;

#define OSEnterCritical()    UserEnterCritical()
#define OSExitCritical()    UserExitCritical()


#define OS_Wait       __asm SLEEP __endasm;

#define OS_ENABLE_NESTING() OSExitCritical()

/// Defines the tick timer interrupt handler code (clear flag) of the choosen microcontroller
#define TICKTIMER_INT_HANDLER    PIR1bits.CCP1IF = 0;
#define TIMER_MODULE            CCPR1
#define TIMER_COUNTER             (TMR1H << 8) + TMR1L


//Stack Defines

/* stacked by the RTI interrupt process */
// M�nimo de 24 devido ao salvamento dos registradores da CPU
#define NUMBER_MIN_OF_STACKED_BYTES     56

/* User defined: stacked for user function calls + local variables */
// Ainda, como podem ocorrer interrup��es durante as tarefas, alocar 28 bytes a cada
// interrup��o ativa
// 4 bytes to Local Variable Allocation
// 4 bytes to Function Call



void CreateVirtualStack(void(*FctPtr)(void), INT16U NUMBER_OF_STACKED_BYTES);
void TickTimerSetup(void);                      
void SwitchContext(void);


/* Save the new top of the software stack. */
#define OS_SAVE_SP()            __asm MOVFF    _FSR1L, _SPvalue __endasm;                                                    \
                                __asm MOVFF    _FSR1H, _SPvalue+1 __endasm;


#define OS_RESTORE_SP()    __asm MOVFF    _SPvalue, _FSR1L   __endasm;                                                                       \
                           __asm MOVFF    _SPvalue+1, _FSR1H __endasm;                                               \
                                                                                                        \
                                /* How many return addresses are there on the hardware stack?  Discard    \
                                the first byte as we are pointing to the next free space. */            \
                           __asm MOVFF    _POSTDEC1, _FSR0L  __endasm;                                                    \
                           __asm MOVFF    _POSTDEC1, _FSR0L  __endasm;



/* Store the hardware stack pointer in a temp register before we modify it.    */

#define OS_SAVE_CONTEXT()       __asm MOVFF    _STKPTR, _FSR0L __endasm;                                     \
                                                                                                            \
                                    /* Store each address from the hardware stack. */                        \
                                    while( STKPTR > ( unsigned char ) 0 )                                    \
                                    {                                                                        \
                                           __asm MOVFF    _TOSL, _PREINC1 __endasm;                                            \
                                           __asm MOVFF    _TOSH, _PREINC1 __endasm;                                           \
                                           __asm MOVFF    _TOSU, _PREINC1 __endasm;                                           \
                                           __asm POP                    __endasm;                                            \
                                    }                                                                        \
                                                                                                            \
/* Store the number of addresses on the hardware stack (from the temporary register). */                     \
                               __asm     MOVFF    _FSR0L, _PREINC1 __endasm;                                                    \
                               __asm     MOVF    _PREINC1, 1, 0   __endasm;                                                    \



/* Fill the hardware stack from our software stack. */

#define OS_RESTORE_CONTEXT()    STKPTR = 0;                                                                    \
                                                                                                            \
                                while( STKPTR < FSR0L )                                                        \
                                {                                                                            \
                                                                                                      \
                                   __asm     PUSH                    __endasm;                                            \
                                   __asm     MOVF    _POSTDEC1, 0, 0  __endasm;                                              \
                                   __asm     MOVWF    _TOSU, 0        __endasm;                                                \
                                   __asm     MOVF    _POSTDEC1, 0, 0  __endasm;                                              \
                                   __asm     MOVWF    _TOSH, 0        __endasm;                                                \
                                   __asm     MOVF    _POSTDEC1, 0, 0  __endasm;                                              \
                                   __asm     MOVWF    _TOSL, 0        __endasm;                                                \
                                                                                                       \
                                }                                                                            \


#define OS_SAVE_ISR()    __asm   MOVFF    _STATUS, PREINC1   __endasm;                                                 \
                         __asm   MOVFF    _WREG, PREINC1     __endasm;                                               \
                         __asm   MOVFF    _BSR, PREINC1      __endasm;                                                \
                         __asm   MOVFF    _FSR2H, PREINC1     __endasm;                                               \
                         __asm   MOVFF    _FSR1H, _FSR2H       __endasm;                                             \
                         __asm   MOVFF    _FSR2L, PREINC1     __endasm;                                               \
                         __asm   MOVFF    _FSR0L, PREINC1    __endasm;                                                \
                         __asm   MOVFF    _FSR0H, PREINC1    __endasm;                                                \
                         __asm   MOVFF    _TABLAT, PREINC1   __endasm;                                                 \
                         __asm   MOVFF    _TBLPTRL, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _TBLPTRH, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _TBLPTRU, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _PRODL, PREINC1    __endasm;                                                \
                         __asm   MOVFF    _PRODH, PREINC1    __endasm;                                                \
                         /*__asm   MOVFF    _AARGB3, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _AARGB2, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _AARGB1, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _AARGB0, PREINC1 __endasm;                                                 \
                         __asm   MOVFF    _BARGB3, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _BARGB2, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _BARGB1, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _BARGB0, PREINC1 __endasm;                                                 \
                         __asm   MOVFF    _REMB3, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _REMB2, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _REMB1, PREINC1  __endasm;                                              \
                         __asm   MOVFF    _REMB0, PREINC1  __endasm;                                                \
                         __asm   MOVFF    _FPFLAGS, PREINC1 __endasm;                                                 \
                         __asm   MOVFF    _FPFLAGS-1, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _AEXP, PREINC1   __endasm;                                               \
                         __asm   MOVFF    _BEXP, PREINC1   __endasm;                                              \
                         __asm   MOVFF    _TEMPB3, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _TEMPB2, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _TEMPB1, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _TEMPB0, PREINC1 __endasm;                                                 \
                         __asm   MOVFF    _TEMPB0+1, PREINC1 __endasm;                                               \
                         __asm   MOVFF    _TEMPB0+2, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+3, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+4, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+5, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+6, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+7, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+8, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+9, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+10, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+11, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+12, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+13, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+14, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+15, PREINC1 __endasm;                                             \
                         __asm   MOVFF    _TEMPB0+16, PREINC1 __endasm;                                             */\
                         __asm   MOVFF    _PCLATH, PREINC1      __endasm;                                              \
                         __asm   MOVFF    _PCLATU, PREINC1      __endasm;                                              \


/* Restore the other registers forming the tasks context. */
#define OS_RESTORE_ISR() \
                         __asm   MOVFF    POSTDEC1, _PCLATU       __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _PCLATH       __endasm;                                         \
                         /*__asm   MOVFF    POSTDEC1, _TEMPB0+16  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+15  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+14  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+13  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+12  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+11  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+10  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+9   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+8   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+7   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+6   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+5   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+4   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+3   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+2   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0+1   __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _TEMPB0     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _TEMPB1     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _TEMPB2     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _TEMPB3     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _BEXP       __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _AEXP       __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _FPFLAGS-1  __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _FPFLAGS    __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _REMB0      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _REMB1      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _REMB2      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _REMB3      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _BARGB0     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _BARGB1     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _BARGB2     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _BARGB3     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _AARGB0     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _AARGB1     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _AARGB2     __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _AARGB3     __endasm;                                           */\
                         __asm   MOVFF    POSTDEC1, _PRODH        __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _PRODL        __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _TBLPTRU      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TBLPTRH      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TBLPTRL      __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _TABLAT       __endasm;                                         \
                         __asm   MOVFF    POSTDEC1, _FSR0H        __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _FSR0L        __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _FSR2L        __endasm;                                            \
                         __asm   MOVFF    POSTDEC1, _FSR2H        __endasm;                                            \
                         __asm   MOVFF    _FSR2H, _FSR1H           __endasm;                                        \
                         __asm   MOVFF    POSTDEC1, _BSR          __endasm;                                          \
                         __asm   MOVFF    POSTDEC1, _WREG         __endasm;                                           \
                         __asm   MOVFF    POSTDEC1, _STATUS       __endasm;                                         \
                         __asm   RETFIE  0                       __endasm;                                          \


#define CriticalDecNesting()        \
{                                   \
  /*UserEnterCritical();*/          \
  iNesting--;                       \
}                                    \


#endif
