;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr 29 2011) (UNIX)
; This file was generated Tue Jul 19 15:07:14 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4520

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _OSMutexCreate
	global _OSMutexDelete
	global _OSMutexAcquire
	global _OSMutexRelease

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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_mutex__OSMutexRelease	code
_OSMutexRelease:
;	.line	344; brtos/mutex.c	INT8U OSMutexRelease(BRTOS_Mutex *pont_event)
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
;	.line	367; brtos/mutex.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	393; brtos/mutex.c	if (pont_event->OSEventOwner != currentTask)
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
	MOVWF	r0x03
	MOVF	r0x03, W
	BANKSEL	_currentTask
	XORWF	_currentTask, W, B
	BZ	_00179_DS_
;	.line	395; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	396; brtos/mutex.c	return ERR_EVENT_OWNER;
	MOVLW	0x07
	BRA	_00184_DS_
; ;multiply lit val:0x10 by variable _currentTask and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00179_DS_:
	BANKSEL	_currentTask
;	.line	402; brtos/mutex.c	iPriority = ContextTask[currentTask].Priority;
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x03
	CLRF	r0x04
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x03, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x04, F
	MOVLW	0x09
	ADDWF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x05
;	.line	403; brtos/mutex.c	if (iPriority != pont_event->OSOriginalPriority)
	MOVF	r0x00, W
	ADDLW	0x04
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
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x05, W
	XORWF	r0x06, W
	BNZ	_00192_DS_
	BRA	_00181_DS_
; ;multiply lit val:0x02 by variable r0x05 and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00192_DS_:
;	.line	408; brtos/mutex.c	OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
	BCF	STATUS, 0
	RLCF	r0x05, W
	MOVWF	r0x07
	CLRF	r0x08
	CLRF	r0x09
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x07, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x08, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x09, F
	MOVFF	r0x07, TBLPTRL
	MOVFF	r0x08, TBLPTRH
	MOVFF	r0x09, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x07
	TBLRD*+	
	MOVFF	TABLAT, r0x08
	COMF	r0x07, F
	COMF	r0x08, F
	MOVF	r0x07, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x08, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
; ;multiply lit val:0x02 by variable r0x06 and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	410; brtos/mutex.c	OSReadyList = OSReadyList | (PriorityMask[pont_event->OSOriginalPriority]);
	BCF	STATUS, 0
	RLCF	r0x06, W
	MOVWF	r0x07
	CLRF	r0x08
	CLRF	r0x09
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x07, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x08, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x09, F
	MOVFF	r0x07, TBLPTRL
	MOVFF	r0x08, TBLPTRH
	MOVFF	r0x09, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x07
	TBLRD*+	
	MOVFF	TABLAT, r0x08
	MOVF	r0x07, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x08, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
;	.line	412; brtos/mutex.c	ContextTask[currentTask].Priority = pont_event->OSOriginalPriority;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x06, INDF0
_00181_DS_:
;	.line	416; brtos/mutex.c	if (pont_event->OSEventWait != 0)
	MOVF	r0x00, W
	ADDLW	0x05
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00183_DS_
;	.line	419; brtos/mutex.c	iPriority = SAScheduler(pont_event->OSEventWaitList);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_SAScheduler
	MOVWF	r0x05
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	422; brtos/mutex.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
; ;multiply lit val:0x02 by variable r0x05 and store in r0x05
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x05, F
	CLRF	r0x0c
	CLRF	r0x0d
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x05, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x0c, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x0d, F
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x0c, TBLPTRH
	MOVFF	r0x0d, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x05
	TBLRD*+	
	MOVFF	TABLAT, r0x0c
	COMF	r0x05, W
	MOVWF	r0x0d
	COMF	r0x0c, W
	MOVWF	r0x0e
	MOVF	r0x0d, W
	ANDWF	r0x0a, F
	MOVF	r0x0e, W
	ANDWF	r0x0b, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
;	.line	425; brtos/mutex.c	pont_event->OSEventWait--;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x07
	DECF	r0x07, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	434; brtos/mutex.c	OSReadyList = OSReadyList | (PriorityMask[iPriority]);
	MOVF	r0x05, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x0c, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
;	.line	437; brtos/mutex.c	ChangeContext();
	CALL	_SwitchContext
;	.line	440; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	442; brtos/mutex.c	return OK;
	CLRF	WREG
	BRA	_00184_DS_
_00183_DS_:
;	.line	446; brtos/mutex.c	pont_event->OSEventState = AVAILABLE_RESOURCE;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	447; brtos/mutex.c	PriorityVector[pont_event->OSMaxPriority] = MUTEX_PRIO;
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x00, F
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0xfe
	MOVWF	INDF0
;	.line	450; brtos/mutex.c	OSExitCritical();      
	BSF	_INTCONbits, 7
;	.line	452; brtos/mutex.c	return OK;
	CLRF	WREG
_00184_DS_:
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
S_mutex__OSMutexAcquire	code
_OSMutexAcquire:
;	.line	198; brtos/mutex.c	INT8U OSMutexAcquire(BRTOS_Mutex *pont_event)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
;	.line	219; brtos/mutex.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	241; brtos/mutex.c	if (pont_event->OSEventState == AVAILABLE_RESOURCE)
	MOVF	r0x00, W
	ADDLW	0x01
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
	XORLW	0x09
	BZ	_00167_DS_
	BRA	_00159_DS_
_00167_DS_:
;	.line	244; brtos/mutex.c	pont_event->OSEventState = BUSY_RESOURCE;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	247; brtos/mutex.c	pont_event->OSEventOwner = currentTask;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVFF	_currentTask, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	254; brtos/mutex.c	pont_event->OSOriginalPriority = ContextTask[currentTask].Priority;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
; ;multiply lit val:0x10 by variable _currentTask and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x06
	CLRF	r0x07
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x06, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x07, F
	MOVLW	0x09
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x08
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	256; brtos/mutex.c	if (pont_event->OSMaxPriority > ContextTask[currentTask].Priority)
	MOVF	r0x00, W
	ADDLW	0x03
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
	MOVWF	r0x09
	MOVF	r0x09, W
	SUBWF	r0x08, W
	BTFSC	STATUS, 0
	BRA	_00155_DS_
;	.line	259; brtos/mutex.c	ContextTask[currentTask].Priority = pont_event->OSMaxPriority;
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x09, INDF0
;	.line	262; brtos/mutex.c	PriorityVector[pont_event->OSMaxPriority] = currentTask;
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x09, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	_currentTask, INDF0
;	.line	265; brtos/mutex.c	OSReadyList = OSReadyList & ~(PriorityMask[pont_event->OSOriginalPriority]);
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x03
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x03, F
	CLRF	r0x04
	CLRF	r0x05
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x03, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x04, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x05, F
	MOVFF	r0x03, TBLPTRL
	MOVFF	r0x04, TBLPTRH
	MOVFF	r0x05, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	TBLRD*+	
	MOVFF	TABLAT, r0x04
	COMF	r0x03, F
	COMF	r0x04, F
	MOVF	r0x03, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x04, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
; ;multiply lit val:0x02 by variable r0x09 and store in r0x09
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	267; brtos/mutex.c	OSReadyList = OSReadyList | (PriorityMask[pont_event->OSMaxPriority]);
	BCF	STATUS, 0
	RLCF	r0x09, F
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x09, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x04, F
	MOVFF	r0x09, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x09
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x09, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x03, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
_00155_DS_:
;	.line	270; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	271; brtos/mutex.c	return OK;
	CLRF	WREG
	BRA	_00161_DS_
; ;multiply lit val:0x10 by variable _currentTask and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00159_DS_:
	BANKSEL	_currentTask
;	.line	276; brtos/mutex.c	iPriority = ContextTask[currentTask].Priority;
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x03
	CLRF	r0x04
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x03, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x04, F
	MOVLW	0x09
	ADDWF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
;	.line	278; brtos/mutex.c	pont_event->OSEventWait++;
	MOVF	r0x00, W
	ADDLW	0x05
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x07
	INCF	r0x07, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	281; brtos/mutex.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList | (PriorityMask[iPriority]);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
; ;multiply lit val:0x02 by variable r0x03 and store in r0x09
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x03, W
	MOVWF	r0x09
	CLRF	r0x0a
	CLRF	r0x0b
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x09, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x0a, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x0b, F
	MOVFF	r0x09, TBLPTRL
	MOVFF	r0x0a, TBLPTRH
	MOVFF	r0x0b, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x09
	TBLRD*+	
	MOVFF	TABLAT, r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
;	.line	290; brtos/mutex.c	OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
	COMF	r0x09, F
	COMF	r0x0a, F
	MOVF	r0x09, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x0a, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
;	.line	293; brtos/mutex.c	ChangeContext();
	CALL	_SwitchContext
;	.line	296; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	298; brtos/mutex.c	OSEnterCritical();    
	BCF	_INTCONbits, 7
;	.line	301; brtos/mutex.c	pont_event->OSEventOwner = currentTask;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	_currentTask, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	308; brtos/mutex.c	pont_event->OSOriginalPriority = iPriority;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	310; brtos/mutex.c	if (pont_event->OSMaxPriority > iPriority)
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x00, W
	SUBWF	r0x03, W
	BTFSC	STATUS, 0
	BRA	_00157_DS_
; ;multiply lit val:0x10 by variable _currentTask and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
;	.line	313; brtos/mutex.c	ContextTask[currentTask].Priority = pont_event->OSMaxPriority;
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x01
	CLRF	r0x02
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x01, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x02, F
	MOVLW	0x09
	ADDWF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
;	.line	316; brtos/mutex.c	PriorityVector[pont_event->OSMaxPriority] = currentTask;
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	_currentTask, INDF0
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	319; brtos/mutex.c	OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
	BCF	STATUS, 0
	RLCF	r0x03, F
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x03, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x02, F
	MOVFF	r0x03, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	COMF	r0x03, F
	COMF	r0x01, F
	MOVF	r0x03, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x01, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	321; brtos/mutex.c	OSReadyList = OSReadyList | (PriorityMask[pont_event->OSMaxPriority]);
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x01, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
_00157_DS_:
;	.line	324; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	325; brtos/mutex.c	return OK;
	CLRF	WREG
_00161_DS_:
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
S_mutex__OSMutexDelete	code
_OSMutexDelete:
;	.line	153; brtos/mutex.c	INT8U OSMutexDelete (BRTOS_Mutex **event)
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
;	.line	158; brtos/mutex.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00148_DS_
;	.line	159; brtos/mutex.c	return(IRQ_PEND_ERR);                          // Can't be delete by interrupt
	MOVLW	0x02
	BRA	_00149_DS_
_00148_DS_:
;	.line	163; brtos/mutex.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	165; brtos/mutex.c	pont_event = *event;  
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
;	.line	166; brtos/mutex.c	pont_event->OSEventAllocated   = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	167; brtos/mutex.c	pont_event->OSEventState       = 0;
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
;	.line	168; brtos/mutex.c	pont_event->OSEventOwner       = 0;                        
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
;	.line	169; brtos/mutex.c	pont_event->OSMaxPriority      = 0;                      
	MOVF	r0x03, W
	ADDLW	0x03
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
;	.line	170; brtos/mutex.c	pont_event->OSOriginalPriority = 0;                
	MOVF	r0x03, W
	ADDLW	0x04
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
;	.line	171; brtos/mutex.c	pont_event->OSEventWait        = 0;  
	MOVF	r0x03, W
	ADDLW	0x05
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
;	.line	173; brtos/mutex.c	pont_event->OSEventWaitList=0;
	MOVLW	0x06
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
;	.line	175; brtos/mutex.c	*event = NULL;
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
;	.line	178; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	180; brtos/mutex.c	return(DELETE_EVENT_OK);
	MOVLW	0x08
_00149_DS_:
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
S_mutex__OSMutexCreate	code
_OSMutexCreate:
;	.line	70; brtos/mutex.c	INT8U OSMutexCreate (BRTOS_Mutex **event, INT8U HigherPriority)
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
;	.line	77; brtos/mutex.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00106_DS_
;	.line	78; brtos/mutex.c	return(IRQ_PEND_ERR);                          // Can't be create by interrupt
	MOVLW	0x02
	BRA	_00125_DS_
_00106_DS_:
	BANKSEL	_currentTask
;	.line	82; brtos/mutex.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00108_DS_
;	.line	83; brtos/mutex.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00108_DS_:
;	.line	85; brtos/mutex.c	if (PriorityVector[HigherPriority] != EMPTY_PRIO)
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x06
	MOVF	r0x06, W
	XORLW	0xff
	BZ	_00112_DS_
_00138_DS_:
	BANKSEL	_currentTask
;	.line	88; brtos/mutex.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00110_DS_
;	.line	89; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00110_DS_:
;	.line	90; brtos/mutex.c	return BUSY_PRIORITY;                          // The priority is busy
	MOVLW	0x04
	BRA	_00125_DS_
_00112_DS_:
;	.line	94; brtos/mutex.c	PriorityVector[HigherPriority] = MUTEX_PRIO;
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVLW	0xfe
	MOVWF	INDF0
;	.line	97; brtos/mutex.c	for(i=0;i<=BRTOS_MAX_MUTEX;i++)
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00119_DS_:
	MOVF	r0x05, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00139_DS_
	MOVLW	0x03
	SUBWF	r0x04, W
_00139_DS_:
	BC	_00122_DS_
;	.line	100; brtos/mutex.c	if(i >= BRTOS_MAX_MUTEX)
	MOVF	r0x05, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00140_DS_
	MOVLW	0x02
	SUBWF	r0x04, W
_00140_DS_:
	BNC	_00116_DS_
	BANKSEL	_currentTask
;	.line	105; brtos/mutex.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00114_DS_
;	.line	106; brtos/mutex.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00114_DS_:
;	.line	108; brtos/mutex.c	return(NO_AVAILABLE_EVENT);
	MOVLW	0x01
	BRA	_00125_DS_
_00116_DS_:
;	.line	112; brtos/mutex.c	if(BRTOS_Mutex_Table[i].OSEventAllocated != TRUE)
	MOVLW	LOW(_BRTOS_Mutex_Table)
	ADDWF	r0x06, W
	MOVWF	r0x08
	MOVLW	HIGH(_BRTOS_Mutex_Table)
	ADDWFC	r0x07, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	INDF0, r0x0a
	MOVF	r0x0a, W
	XORLW	0x01
	BZ	_00121_DS_
;	.line	114; brtos/mutex.c	BRTOS_Mutex_Table[i].OSEventAllocated = TRUE;
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	115; brtos/mutex.c	pont_event = &BRTOS_Mutex_Table[i];
	MOVLW	LOW(_BRTOS_Mutex_Table)
	ADDWF	r0x06, W
	MOVWF	r0x08
	MOVLW	HIGH(_BRTOS_Mutex_Table)
	ADDWFC	r0x07, W
	MOVWF	r0x09
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVF	r0x08, W
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
;	.line	116; brtos/mutex.c	break;      
	BRA	_00122_DS_
_00121_DS_:
;	.line	97; brtos/mutex.c	for(i=0;i<=BRTOS_MAX_MUTEX;i++)
	MOVLW	0x08
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BRA	_00119_DS_
_00122_DS_:
;	.line	122; brtos/mutex.c	pont_event->OSEventState = AVAILABLE_RESOURCE;       // Set mutex init value
	MOVF	r0x08, W
	ADDLW	0x01
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x06
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	123; brtos/mutex.c	pont_event->OSEventWait  = 0;
	MOVF	r0x08, W
	ADDLW	0x05
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	124; brtos/mutex.c	pont_event->OSMaxPriority = HigherPriority;          // Determina a tarefa de maior prioridade acessando o mutex
	MOVF	r0x08, W
	ADDLW	0x03
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x06
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	127; brtos/mutex.c	pont_event->OSEventWaitList=0;
	MOVF	r0x08, W
	ADDLW	0x06
	MOVWF	r0x03
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
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	129; brtos/mutex.c	*event = pont_event;
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x0a, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BANKSEL	_currentTask
;	.line	132; brtos/mutex.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00124_DS_
;	.line	133; brtos/mutex.c	OSExitCritical();  
	BSF	_INTCONbits, 7
_00124_DS_:
;	.line	135; brtos/mutex.c	return(ALLOC_EVENT_OK);
	CLRF	WREG
_00125_DS_:
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
; code size:	 2772 (0x0ad4) bytes ( 2.11%)
;           	 1386 (0x056a) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   15 (0x000f) bytes


	end
