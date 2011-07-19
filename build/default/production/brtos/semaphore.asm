;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr 29 2011) (UNIX)
; This file was generated Tue Jul 19 15:07:13 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _OSSemCreate
	global _OSSemDelete
	global _OSSemPend
	global _OSSemPost

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
	extern __gptrput2
	extern __gptrput3
	extern __gptrget3
	extern __gptrget1
	extern __gptrget2
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _OSCTUNEbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _TXSTAbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _PWM1CONbits
	extern _BAUDCONbits
	extern _BAUDCTLbits
	extern _CCP2CONbits
	extern _CCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSPCON2bits
	extern _SSPCON1bits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _HLVDCONbits
	extern _LVDCONbits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _SPvalue
	extern _Hora
	extern _Data
	extern _BRTOS_Sem_Table
	extern _BRTOS_Mutex_Table
	extern _BRTOS_Queue_Table
	extern _OSReadyList
	extern _OSBlockedList
	extern _Tail
	extern _Head
	extern _iNesting
	extern _currentTask
	extern _SelectedTask
	extern _ContextTask
	extern _iStackAddress
	extern _NumberOfInstalledTasks
	extern _counter
	extern _OSDuty
	extern _PriorityVector
	extern _OSDutyTmp
	extern _LastOSDuty
	extern _STACK
	extern _TaskAlloc
	extern _QUEUE_STACK
	extern _iQueueAddress
	extern _version
	extern _BufferText
	extern _StackAddress
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _OSCTUNE
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _EECON1
	extern _EECON2
	extern _EEDATA
	extern _EEADR
	extern _RCSTA
	extern _TXSTA
	extern _TXREG
	extern _RCREG
	extern _SPBRG
	extern _SPBRGH
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _PWM1CON
	extern _BAUDCON
	extern _BAUDCTL
	extern _CCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSPCON2
	extern _SSPCON1
	extern _SSPSTAT
	extern _SSPADD
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _HLVDCON
	extern _LVDCON
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _SwitchContext
	extern _SAScheduler
	extern _PriorityMask
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1
r0x16	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_semaphore__OSSemPost	code
_OSSemPost:
;	.line	348; brtos/semaphore.c	INT8U OSSemPost(BRTOS_Sem *pont_event)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	BANKSEL	_iNesting
;	.line	366; brtos/semaphore.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00202_DS_
;	.line	368; brtos/semaphore.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00202_DS_:
;	.line	397; brtos/semaphore.c	if (pont_event->OSEventWait != 0)
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00208_DS_
;	.line	400; brtos/semaphore.c	iPriority = SAScheduler(pont_event->OSEventWaitList);    
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget2
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_SAScheduler
	MOVWF	r0x09
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	403; brtos/semaphore.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
; ;multiply lit val:0x02 by variable r0x09 and store in r0x09
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x09, F
	CLRF	r0x0c
	CLRF	r0x0d
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x09, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x0c, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x0d, F
	MOVFF	r0x09, TBLPTRL
	MOVFF	r0x0c, TBLPTRH
	MOVFF	r0x0d, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x09
	TBLRD*+	
	MOVFF	TABLAT, r0x0c
	COMF	r0x09, W
	MOVWF	r0x0d
	COMF	r0x0c, W
	MOVWF	r0x0e
	MOVF	r0x0d, W
	ANDWF	r0x0a, F
	MOVF	r0x0e, W
	ANDWF	r0x0b, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput2
;	.line	406; brtos/semaphore.c	pont_event->OSEventWait--;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	DECF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	414; brtos/semaphore.c	OSReadyList = OSReadyList | (PriorityMask[iPriority]);
	MOVF	r0x09, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x0c, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
	BANKSEL	_iNesting
;	.line	418; brtos/semaphore.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00204_DS_
;	.line	421; brtos/semaphore.c	ChangeContext();      
	CALL	_SwitchContext
_00204_DS_:
	BANKSEL	_iNesting
;	.line	426; brtos/semaphore.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00206_DS_
;	.line	428; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00206_DS_:
;	.line	430; brtos/semaphore.c	return OK;
	CLRF	WREG
	BRA	_00216_DS_
_00208_DS_:
;	.line	434; brtos/semaphore.c	if (pont_event->OSEventCount < 255)
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVLW	0xff
	SUBWF	r0x03, W
	BC	_00214_DS_
;	.line	437; brtos/semaphore.c	pont_event->OSEventCount++;
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_iNesting
;	.line	441; brtos/semaphore.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00210_DS_
;	.line	443; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00210_DS_:
;	.line	444; brtos/semaphore.c	return OK;
	CLRF	WREG
	BRA	_00216_DS_
_00214_DS_:
	BANKSEL	_iNesting
;	.line	450; brtos/semaphore.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00212_DS_
;	.line	452; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00212_DS_:
;	.line	455; brtos/semaphore.c	return ERR_SEM_OVF;
	MOVLW	0x03
_00216_DS_:
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_semaphore__OSSemPend	code
_OSSemPend:
;	.line	188; brtos/semaphore.c	INT8U OSSemPend (BRTOS_Sem *pont_event, INT16U time_wait)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
;	.line	210; brtos/semaphore.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	232; brtos/semaphore.c	if (pont_event->OSEventCount > 0)
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	BZ	_00147_DS_
;	.line	235; brtos/semaphore.c	pont_event->OSEventCount--;
	DECF	r0x08, F
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	238; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	239; brtos/semaphore.c	return OK;
	CLRF	WREG
	GOTO	_00173_DS_
; ;multiply lit val:0x10 by variable _currentTask and store in r0x05
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00147_DS_:
	BANKSEL	_currentTask
;	.line	242; brtos/semaphore.c	Task = &ContextTask[currentTask];
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x05
	CLRF	r0x06
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x05, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
;	.line	245; brtos/semaphore.c	iPriority = Task->Priority;
	MOVF	r0x05, W
	ADDLW	0x09
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0a
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget1
	MOVWF	r0x08
;	.line	247; brtos/semaphore.c	pont_event->OSEventWait++;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget1
	MOVWF	r0x0c
	INCF	r0x0c, F
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	250; brtos/semaphore.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList | (PriorityMask[iPriority]);
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
; ;multiply lit val:0x02 by variable r0x08 and store in r0x0e
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x08, W
	MOVWF	r0x0e
	CLRF	r0x0f
	CLRF	r0x10
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x0e, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x0f, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x10, F
	MOVFF	r0x0e, TBLPTRL
	MOVFF	r0x0f, TBLPTRH
	MOVFF	r0x10, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x0e
	TBLRD*+	
	MOVFF	TABLAT, r0x0f
	MOVF	r0x0e, W
	IORWF	r0x0c, F
	MOVF	r0x0f, W
	IORWF	r0x0d, F
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	259; brtos/semaphore.c	OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
	COMF	r0x0e, F
	COMF	r0x0f, F
	MOVF	r0x0e, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x0f, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
;	.line	262; brtos/semaphore.c	if (time_wait)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BTFSC	STATUS, 2
	BRA	_00155_DS_
;	.line	264; brtos/semaphore.c	timeout = (INT32U)((INT32U)counter + (INT32U)time_wait);
	MOVFF	_counter, r0x0c
	MOVFF	(_counter + 1), r0x0d
	CLRF	r0x0e
	CLRF	r0x0f
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	CLRF	r0x12
	CLRF	r0x13
	MOVF	r0x10, W
	ADDWF	r0x0c, F
	MOVF	r0x11, W
	ADDWFC	r0x0d, F
	MOVF	r0x12, W
	ADDWFC	r0x0e, F
	MOVF	r0x13, W
	ADDWFC	r0x0f, F
;	.line	266; brtos/semaphore.c	if (timeout >= TickCountOverFlow)
	MOVLW	0x00
	SUBWF	r0x0f, W
	BNZ	_00187_DS_
	MOVLW	0x00
	SUBWF	r0x0e, W
	BNZ	_00187_DS_
	MOVLW	0xfa
	SUBWF	r0x0d, W
	BNZ	_00187_DS_
	MOVLW	0x00
	SUBWF	r0x0c, W
_00187_DS_:
	BNC	_00149_DS_
;	.line	268; brtos/semaphore.c	Task->TimeToWait = (INT16U)(timeout - TickCountOverFlow);
	MOVF	r0x05, W
	ADDLW	0x07
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x12
	MOVF	r0x0c, W
	MOVWF	r0x13
	MOVLW	0x06
	ADDWF	r0x0d, W
	MOVWF	r0x14
	MOVLW	0xff
	ADDWFC	r0x0e, W
	MOVWF	r0x15
	MOVLW	0xff
	ADDWFC	r0x0f, W
	MOVWF	r0x16
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, PRODH
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput2
	BRA	_00150_DS_
_00149_DS_:
;	.line	272; brtos/semaphore.c	Task->TimeToWait = (INT16U)timeout;
	MOVF	r0x05, W
	ADDLW	0x07
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x12
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, PRODH
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput2
_00150_DS_:
	BANKSEL	_Tail
;	.line	276; brtos/semaphore.c	IncludeTaskIntoDelayList();
	MOVF	_Tail, W, B
	BANKSEL	(_Tail + 1)
	IORWF	(_Tail + 1), W, B
	BANKSEL	(_Tail + 2)
	IORWF	(_Tail + 2), W, B
	BTFSC	STATUS, 2
	BRA	_00152_DS_
	MOVFF	_Tail, r0x0c
	MOVFF	(_Tail + 1), r0x0d
	MOVFF	(_Tail + 2), r0x0e
	MOVLW	0x0a
	ADDWF	r0x0c, F
	MOVLW	0x00
	ADDWFC	r0x0d, F
	MOVLW	0x00
	ADDWFC	r0x0e, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, PRODH
	MOVFF	r0x07, TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
	MOVF	r0x05, W
	ADDLW	0x0d
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0e
	MOVFF	_Tail, POSTDEC1
	MOVFF	(_Tail + 1), PRODH
	MOVFF	(_Tail + 2), TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
	MOVFF	r0x05, _Tail
	MOVFF	r0x06, (_Tail + 1)
	MOVFF	r0x07, (_Tail + 2)
	MOVFF	_Tail, r0x0c
	MOVFF	(_Tail + 1), r0x0d
	MOVFF	(_Tail + 2), r0x0e
	MOVLW	0x0a
	ADDWF	r0x0c, F
	MOVLW	0x00
	ADDWFC	r0x0d, F
	MOVLW	0x00
	ADDWFC	r0x0e, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
	BRA	_00156_DS_
_00152_DS_:
	MOVFF	r0x05, _Tail
	MOVFF	r0x06, (_Tail + 1)
	MOVFF	r0x07, (_Tail + 2)
	MOVFF	r0x05, _Head
	MOVFF	r0x06, (_Head + 1)
	MOVFF	r0x07, (_Head + 2)
	MOVF	r0x05, W
	ADDLW	0x0a
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
	MOVF	r0x05, W
	ADDLW	0x0d
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
	BRA	_00156_DS_
_00155_DS_:
;	.line	279; brtos/semaphore.c	Task->TimeToWait = NO_TIMEOUT;
	MOVF	r0x05, W
	ADDLW	0x07
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0e
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput2
_00156_DS_:
;	.line	283; brtos/semaphore.c	ChangeContext();
	CALL	_SwitchContext
;	.line	286; brtos/semaphore.c	if (time_wait)
	MOVF	r0x03, W
	IORWF	r0x04, W
	BTFSC	STATUS, 2
	BRA	_00172_DS_
;	.line	292; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	294; brtos/semaphore.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	299; brtos/semaphore.c	if(Task->TimeToWait == EXIT_BY_TIMEOUT)
	MOVF	r0x05, W
	ADDLW	0x07
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0c
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget2
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	MOVF	r0x0d, W
	XORLW	0xe9
	BNZ	_00188_DS_
	MOVF	r0x0e, W
	XORLW	0xfd
	BZ	_00189_DS_
_00188_DS_:
	BRA	_00169_DS_
_00189_DS_:
;	.line	302; brtos/semaphore.c	if ((pont_event->OSEventWaitList & PriorityMask[iPriority]))
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
; ;multiply lit val:0x02 by variable r0x08 and store in r0x08
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x08, F
	CLRF	r0x0f
	CLRF	r0x10
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x08, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x0f, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x10, F
	MOVFF	r0x08, TBLPTRL
	MOVFF	r0x0f, TBLPTRH
	MOVFF	r0x10, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x08
	TBLRD*+	
	MOVFF	TABLAT, r0x0f
	MOVF	r0x08, W
	ANDWF	r0x0d, F
	MOVF	r0x0f, W
	ANDWF	r0x0e, F
	MOVF	r0x0d, W
	IORWF	r0x0e, W
	BTFSC	STATUS, 2
	BRA	_00172_DS_
;	.line	305; brtos/semaphore.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	COMF	r0x08, F
	COMF	r0x0f, F
	MOVF	r0x08, W
	ANDWF	r0x0d, F
	MOVF	r0x0f, W
	ANDWF	r0x0e, F
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	308; brtos/semaphore.c	pont_event->OSEventWait--;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget1
	MOVWF	r0x00
	DECF	r0x00, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	311; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	314; brtos/semaphore.c	return TIMEOUT;
	MOVLW	0x06
	BRA	_00173_DS_
_00169_DS_:
;	.line	320; brtos/semaphore.c	Task->TimeToWait = NO_TIMEOUT;
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x0c, W
	CALL	__gptrput2
;	.line	323; brtos/semaphore.c	RemoveFromDelayList();
	MOVF	r0x05, W
	BANKSEL	_Head
	XORWF	_Head, W, B
	BNZ	_00191_DS_
	MOVF	r0x06, W
	BANKSEL	(_Head + 1)
	XORWF	(_Head + 1), W, B
	BNZ	_00191_DS_
	MOVF	r0x07, W
	BANKSEL	(_Head + 2)
	XORWF	(_Head + 2), W, B
	BZ	_00192_DS_
_00191_DS_:
	BRA	_00166_DS_
_00192_DS_:
	MOVF	r0x05, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00193_DS_
	MOVF	r0x06, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00193_DS_
	MOVF	r0x07, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00194_DS_
_00193_DS_:
	BRA	_00160_DS_
_00194_DS_:
	BANKSEL	_Tail
	CLRF	_Tail, B
	BANKSEL	(_Tail + 1)
	CLRF	(_Tail + 1), B
	BANKSEL	(_Tail + 2)
	CLRF	(_Tail + 2), B
	BANKSEL	_Head
	CLRF	_Head, B
	BANKSEL	(_Head + 1)
	CLRF	(_Head + 1), B
	BANKSEL	(_Head + 2)
	CLRF	(_Head + 2), B
	BRA	_00172_DS_
_00160_DS_:
	MOVF	r0x05, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	BANKSEL	_Head
	MOVWF	_Head, B
	MOVFF	PRODL, (_Head + 1)
	MOVFF	PRODH, (_Head + 2)
	MOVFF	_Head, r0x00
	MOVFF	(_Head + 1), r0x01
	MOVFF	(_Head + 2), r0x02
	MOVLW	0x0d
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00172_DS_
_00166_DS_:
	MOVF	r0x05, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00195_DS_
	MOVF	r0x06, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00195_DS_
	MOVF	r0x07, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00196_DS_
_00195_DS_:
	BRA	_00163_DS_
_00196_DS_:
	MOVF	r0x05, W
	ADDLW	0x0d
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	BANKSEL	_Tail
	MOVWF	_Tail, B
	MOVFF	PRODL, (_Tail + 1)
	MOVFF	PRODH, (_Tail + 2)
	MOVFF	_Tail, r0x00
	MOVFF	(_Tail + 1), r0x01
	MOVFF	(_Tail + 2), r0x02
	MOVLW	0x0a
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BRA	_00172_DS_
_00163_DS_:
	MOVF	r0x05, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x00, W
	ADDLW	0x0d
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVLW	0x0d
	ADDWF	r0x05, F
	MOVLW	0x00
	ADDWFC	r0x06, F
	MOVLW	0x00
	ADDWFC	r0x07, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, PRODH
	MOVFF	r0x07, TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x08, W
	CALL	__gptrput3
	MOVLW	0x0a
	ADDWF	r0x05, F
	MOVLW	0x00
	ADDWFC	r0x06, F
	MOVLW	0x00
	ADDWFC	r0x07, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput3
_00172_DS_:
;	.line	328; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	330; brtos/semaphore.c	return OK;
	CLRF	WREG
_00173_DS_:
	MOVFF	PREINC1, r0x16
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_semaphore__OSSemDelete	code
_OSSemDelete:
;	.line	146; brtos/semaphore.c	INT8U OSSemDelete (BRTOS_Sem **event)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	BANKSEL	_iNesting
;	.line	151; brtos/semaphore.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00140_DS_
;	.line	152; brtos/semaphore.c	return(IRQ_PEND_ERR);                          // Can't be delete by interrupt
	MOVLW	0x02
	BRA	_00141_DS_
_00140_DS_:
;	.line	156; brtos/semaphore.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	158; brtos/semaphore.c	pont_event = *event;  
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
;	.line	159; brtos/semaphore.c	pont_event->OSEventAllocated = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	160; brtos/semaphore.c	pont_event->OSEventCount     = 0;                      
	MOVF	r0x03, W
	ADDLW	0x01
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	161; brtos/semaphore.c	pont_event->OSEventWait      = 0;
	MOVF	r0x03, W
	ADDLW	0x02
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	163; brtos/semaphore.c	pont_event->OSEventWaitList=0;
	MOVLW	0x03
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	165; brtos/semaphore.c	*event = NULL;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
;	.line	168; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	170; brtos/semaphore.c	return(DELETE_EVENT_OK);
	MOVLW	0x08
_00141_DS_:
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_semaphore__OSSemCreate	code
_OSSemCreate:
;	.line	77; brtos/semaphore.c	INT8U OSSemCreate (INT8U cnt, BRTOS_Sem **event)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	BANKSEL	_iNesting
;	.line	84; brtos/semaphore.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00106_DS_
;	.line	85; brtos/semaphore.c	return(IRQ_PEND_ERR);                           // Can't be create by interrupt
	MOVLW	0x02
	BRA	_00121_DS_
_00106_DS_:
	BANKSEL	_currentTask
;	.line	89; brtos/semaphore.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00129_DS_
;	.line	90; brtos/semaphore.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00129_DS_:
;	.line	93; brtos/semaphore.c	for(i=0;i<=BRTOS_MAX_SEM;i++)
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00115_DS_:
	MOVF	r0x05, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00131_DS_
	MOVLW	0x03
	SUBWF	r0x04, W
_00131_DS_:
	BC	_00118_DS_
;	.line	96; brtos/semaphore.c	if(i >= BRTOS_MAX_SEM)
	MOVF	r0x05, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00132_DS_
	MOVLW	0x02
	SUBWF	r0x04, W
_00132_DS_:
	BNC	_00112_DS_
	BANKSEL	_currentTask
;	.line	101; brtos/semaphore.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00110_DS_
;	.line	102; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00110_DS_:
;	.line	104; brtos/semaphore.c	return(NO_AVAILABLE_EVENT);
	MOVLW	0x01
	BRA	_00121_DS_
_00112_DS_:
;	.line	108; brtos/semaphore.c	if(BRTOS_Sem_Table[i].OSEventAllocated != TRUE)
	MOVLW	LOW(_BRTOS_Sem_Table)
	ADDWF	r0x06, W
	MOVWF	r0x08
	MOVLW	HIGH(_BRTOS_Sem_Table)
	ADDWFC	r0x07, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	INDF0, r0x0a
	MOVF	r0x0a, W
	XORLW	0x01
	BZ	_00117_DS_
;	.line	110; brtos/semaphore.c	BRTOS_Sem_Table[i].OSEventAllocated = TRUE;
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	111; brtos/semaphore.c	pont_event = &BRTOS_Sem_Table[i];
	MOVLW	LOW(_BRTOS_Sem_Table)
	ADDWF	r0x06, W
	MOVWF	r0x08
	MOVLW	HIGH(_BRTOS_Sem_Table)
	ADDWFC	r0x07, W
	MOVWF	r0x09
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVF	r0x08, W
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
;	.line	112; brtos/semaphore.c	break;      
	BRA	_00118_DS_
_00117_DS_:
;	.line	93; brtos/semaphore.c	for(i=0;i<=BRTOS_MAX_SEM;i++)
	MOVLW	0x05
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00115_DS_
_00118_DS_:
;	.line	117; brtos/semaphore.c	pont_event->OSEventCount = cnt;                      // Set semaphore count value
	MOVF	r0x08, W
	ADDLW	0x01
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x06
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	118; brtos/semaphore.c	pont_event->OSEventWait  = 0;
	MOVF	r0x08, W
	ADDLW	0x02
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	120; brtos/semaphore.c	pont_event->OSEventWaitList=0;
	MOVF	r0x08, W
	ADDLW	0x03
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	122; brtos/semaphore.c	*event = pont_event;
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x0a, TBLPTRL
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrput3
	BANKSEL	_currentTask
;	.line	125; brtos/semaphore.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00120_DS_
;	.line	126; brtos/semaphore.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00120_DS_:
;	.line	128; brtos/semaphore.c	return(ALLOC_EVENT_OK);
	CLRF	WREG
_00121_DS_:
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	



; Statistics:
; code size:	 3042 (0x0be2) bytes ( 2.32%)
;           	 1521 (0x05f1) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   23 (0x0017) bytes


	end
