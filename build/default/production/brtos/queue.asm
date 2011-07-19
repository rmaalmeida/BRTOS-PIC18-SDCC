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
	global _OSQueueCreate
	global _OSWQueue
	global _OSRQueue
	global _OSCleanQueue
	global _OSQueuePend
	global _OSQueuePost

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput3
	extern __gptrput2
	extern __gptrput1
	extern __gptrget2
	extern __gptrget3
	extern __gptrget1
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
r0x17	res	1
r0x18	res	1
r0x19	res	1
r0x1a	res	1
r0x1b	res	1
r0x1c	res	1
r0x1d	res	1
r0x1e	res	1
r0x1f	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_queue__OSQueuePost	code
_OSQueuePost:
;	.line	499; brtos/queue.c	INT8U OSQueuePost(BRTOS_Queue *pont_event, INT8U newdata)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
;	.line	506; brtos/queue.c	OS_QUEUE *cqueue = pont_event->OSEventPointer;
	MOVF	r0x00, W
	ADDLW	0x03
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
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	BANKSEL	_iNesting
;	.line	518; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00271_DS_
;	.line	520; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00271_DS_:
;	.line	549; brtos/queue.c	if (cqueue->OSQEntries < cqueue->OSQSize)
	MOVF	r0x04, W
	ADDLW	0x11
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVF	r0x04, W
	ADDLW	0x0f
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVF	r0x0d, W
	SUBWF	r0x0b, W
	BNZ	_00298_DS_
	MOVF	r0x0c, W
	SUBWF	r0x0a, W
_00298_DS_:
	BC	_00275_DS_
;	.line	552; brtos/queue.c	cqueue->OSQEntries++;
	INCF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
	BRA	_00276_DS_
_00275_DS_:
	BANKSEL	_iNesting
;	.line	558; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00273_DS_
;	.line	560; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00273_DS_:
;	.line	563; brtos/queue.c	return BUFFER_UNDERRUN;
	MOVLW	0x01
	BRA	_00288_DS_
_00276_DS_:
;	.line	567; brtos/queue.c	if (cqueue->OSQIn == cqueue->OSQEnd)
	MOVF	r0x04, W
	ADDLW	0x09
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget3
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVF	r0x04, W
	ADDLW	0x06
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0e
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x0f
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, PRODL
	MOVF	r0x0f, W
	CALL	__gptrget3
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	MOVFF	PRODH, r0x0f
	MOVF	r0x0a, W
	XORWF	r0x0d, W
	BNZ	_00299_DS_
	MOVF	r0x0b, W
	XORWF	r0x0e, W
	BNZ	_00299_DS_
	MOVF	r0x0c, W
	XORWF	r0x0f, W
	BZ	_00300_DS_
_00299_DS_:
	BRA	_00278_DS_
_00300_DS_:
;	.line	568; brtos/queue.c	cqueue->OSQIn = cqueue->OSQStart;
	MOVLW	0x03
	ADDWF	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVLW	0x00
	ADDWFC	r0x06, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput3
_00278_DS_:
;	.line	571; brtos/queue.c	*(cqueue->OSQIn) = newdata;
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	574; brtos/queue.c	cqueue->OSQIn++;
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput3
;	.line	577; brtos/queue.c	if (pont_event->OSEventWait != 0)
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
	BRA	_00286_DS_
;	.line	580; brtos/queue.c	iPriority = SAScheduler(pont_event->OSEventWaitList);    
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_SAScheduler
	MOVWF	r0x06
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	583; brtos/queue.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x06, F
	CLRF	r0x09
	CLRF	r0x0a
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x06, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x09, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x0a, F
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x09, TBLPTRH
	MOVFF	r0x0a, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x06
	TBLRD*+	
	MOVFF	TABLAT, r0x09
	COMF	r0x06, W
	MOVWF	r0x0a
	COMF	r0x09, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	ANDWF	r0x07, F
	MOVF	r0x0b, W
	ANDWF	r0x08, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	586; brtos/queue.c	pont_event->OSEventWait--;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x00
	DECF	r0x00, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	594; brtos/queue.c	OSReadyList = OSReadyList | (PriorityMask[iPriority]);
	MOVF	r0x06, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x09, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
	BANKSEL	_iNesting
;	.line	598; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00280_DS_
;	.line	601; brtos/queue.c	ChangeContext();      
	CALL	_SwitchContext
_00280_DS_:
	BANKSEL	_iNesting
;	.line	606; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00282_DS_
;	.line	608; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00282_DS_:
;	.line	610; brtos/queue.c	return WRITE_BUFFER_OK;
	CLRF	WREG
	BRA	_00288_DS_
_00286_DS_:
	BANKSEL	_iNesting
;	.line	616; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00284_DS_
;	.line	618; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00284_DS_:
;	.line	620; brtos/queue.c	return WRITE_BUFFER_OK;
	CLRF	WREG
_00288_DS_:
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
S_queue__OSQueuePend	code
_OSQueuePend:
;	.line	318; brtos/queue.c	INT8U OSQueuePend (BRTOS_Queue *pont_event, INT8U* pdata, INT16U time_wait)
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
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x18, POSTDEC1
	MOVFF	r0x19, POSTDEC1
	MOVFF	r0x1a, POSTDEC1
	MOVFF	r0x1b, POSTDEC1
	MOVFF	r0x1c, POSTDEC1
	MOVFF	r0x1d, POSTDEC1
	MOVFF	r0x1e, POSTDEC1
	MOVFF	r0x1f, POSTDEC1
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
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
	MOVLW	0x09
	MOVFF	PLUSW2, r0x06
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x07
;	.line	324; brtos/queue.c	OS_QUEUE *cqueue = pont_event->OSEventPointer;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget3
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
;	.line	341; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	363; brtos/queue.c	if(cqueue->OSQEntries > 0)
	MOVF	r0x08, W
	ADDLW	0x11
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget2
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BTFSC	STATUS, 2
	BRA	_00234_DS_
;	.line	366; brtos/queue.c	if (cqueue->OSQOut == cqueue->OSQEnd)
	MOVF	r0x08, W
	ADDLW	0x0c
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x12
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget3
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVF	r0x08, W
	ADDLW	0x06
	MOVWF	r0x16
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x17
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x18
	MOVFF	r0x16, FSR0L
	MOVFF	r0x17, PRODL
	MOVF	r0x18, W
	CALL	__gptrget3
	MOVWF	r0x16
	MOVFF	PRODL, r0x17
	MOVFF	PRODH, r0x18
	MOVF	r0x13, W
	XORWF	r0x16, W
	BNZ	_00250_DS_
	MOVF	r0x14, W
	XORWF	r0x17, W
	BNZ	_00250_DS_
	MOVF	r0x15, W
	XORWF	r0x18, W
	BZ	_00251_DS_
_00250_DS_:
	BRA	_00205_DS_
_00251_DS_:
;	.line	367; brtos/queue.c	cqueue->OSQOut = cqueue->OSQStart;
	MOVF	r0x08, W
	ADDLW	0x03
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x14
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x15
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget3
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, PRODH
	MOVFF	r0x15, TBLPTRL
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput3
_00205_DS_:
;	.line	370; brtos/queue.c	*pdata = *cqueue->OSQOut;
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget3
	MOVWF	r0x13
	MOVFF	PRODL, r0x14
	MOVFF	PRODH, r0x15
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, PRODL
	MOVF	r0x15, W
	CALL	__gptrget1
	MOVWF	r0x16
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	373; brtos/queue.c	cqueue->OSQOut++;
	INCF	r0x13, F
	BTFSC	STATUS, 0
	INCF	r0x14, F
	BTFSC	STATUS, 0
	INCF	r0x15, F
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, PRODH
	MOVFF	r0x15, TBLPTRL
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput3
;	.line	376; brtos/queue.c	cqueue->OSQEntries--;
	MOVLW	0xff
	ADDWF	r0x0e, F
	BTFSS	STATUS, 0
	DECF	r0x0f, F
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, PRODH
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput2
;	.line	379; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	380; brtos/queue.c	return READ_BUFFER_OK;
	CLRF	WREG
	GOTO	_00236_DS_
; ;multiply lit val:0x10 by variable _currentTask and store in r0x0e
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00234_DS_:
	BANKSEL	_currentTask
;	.line	384; brtos/queue.c	Task = &ContextTask[currentTask];
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x0e
	CLRF	r0x0f
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x0e, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x0f, F
	MOVF	r0x0f, W
	MOVWF	r0x0f
	MOVF	r0x0e, W
	MOVWF	r0x0e
	MOVLW	0x80
	MOVWF	r0x10
;	.line	387; brtos/queue.c	iPriority = Task->Priority;
	MOVF	r0x0e, W
	ADDLW	0x09
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x13
	MOVFF	r0x11, FSR0L
	MOVFF	r0x12, PRODL
	MOVF	r0x13, W
	CALL	__gptrget1
	MOVWF	r0x11
;	.line	390; brtos/queue.c	pont_event->OSEventWait++;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x14
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x15, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
;	.line	393; brtos/queue.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList | (PriorityMask[iPriority]);
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x15
	MOVFF	PRODL, r0x16
; ;multiply lit val:0x02 by variable r0x11 and store in r0x17
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x11, W
	MOVWF	r0x17
	CLRF	r0x18
	CLRF	r0x19
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x17, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x18, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x19, F
	MOVFF	r0x17, TBLPTRL
	MOVFF	r0x18, TBLPTRH
	MOVFF	r0x19, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x17
	TBLRD*+	
	MOVFF	TABLAT, r0x18
	MOVF	r0x17, W
	IORWF	r0x15, F
	MOVF	r0x18, W
	IORWF	r0x16, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	402; brtos/queue.c	OSReadyList = OSReadyList & ~(PriorityMask[iPriority]);
	COMF	r0x17, F
	COMF	r0x18, F
	MOVF	r0x17, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x18, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
;	.line	405; brtos/queue.c	if (time_wait)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00213_DS_
;	.line	407; brtos/queue.c	timeout = (INT32U)((INT32U)counter + (INT32U)time_wait);
	MOVFF	_counter, r0x15
	MOVFF	(_counter + 1), r0x16
	CLRF	r0x17
	CLRF	r0x18
	MOVFF	r0x06, r0x19
	MOVFF	r0x07, r0x1a
	CLRF	r0x1b
	CLRF	r0x1c
	MOVF	r0x19, W
	ADDWF	r0x15, F
	MOVF	r0x1a, W
	ADDWFC	r0x16, F
	MOVF	r0x1b, W
	ADDWFC	r0x17, F
	MOVF	r0x1c, W
	ADDWFC	r0x18, F
;	.line	409; brtos/queue.c	if (timeout >= TickCountOverFlow)
	MOVLW	0x00
	SUBWF	r0x18, W
	BNZ	_00254_DS_
	MOVLW	0x00
	SUBWF	r0x17, W
	BNZ	_00254_DS_
	MOVLW	0xfa
	SUBWF	r0x16, W
	BNZ	_00254_DS_
	MOVLW	0x00
	SUBWF	r0x15, W
_00254_DS_:
	BNC	_00207_DS_
;	.line	411; brtos/queue.c	Task->TimeToWait = (INT16U)(timeout - TickCountOverFlow);
	MOVF	r0x0e, W
	ADDLW	0x07
	MOVWF	r0x19
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x1a
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x1b
	MOVF	r0x15, W
	MOVWF	r0x1c
	MOVLW	0x06
	ADDWF	r0x16, W
	MOVWF	r0x1d
	MOVLW	0xff
	ADDWFC	r0x17, W
	MOVWF	r0x1e
	MOVLW	0xff
	ADDWFC	r0x18, W
	MOVWF	r0x1f
	MOVFF	r0x1c, POSTDEC1
	MOVFF	r0x1d, PRODH
	MOVFF	r0x19, FSR0L
	MOVFF	r0x1a, PRODL
	MOVF	r0x1b, W
	CALL	__gptrput2
	BRA	_00208_DS_
_00207_DS_:
;	.line	415; brtos/queue.c	Task->TimeToWait = (INT16U)timeout;
	MOVF	r0x0e, W
	ADDLW	0x07
	MOVWF	r0x19
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x1a
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x1b
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, PRODH
	MOVFF	r0x19, FSR0L
	MOVFF	r0x1a, PRODL
	MOVF	r0x1b, W
	CALL	__gptrput2
_00208_DS_:
	BANKSEL	_Tail
;	.line	419; brtos/queue.c	IncludeTaskIntoDelayList();
	MOVF	_Tail, W, B
	BANKSEL	(_Tail + 1)
	IORWF	(_Tail + 1), W, B
	BANKSEL	(_Tail + 2)
	IORWF	(_Tail + 2), W, B
	BTFSC	STATUS, 2
	BRA	_00210_DS_
	MOVFF	_Tail, r0x15
	MOVFF	(_Tail + 1), r0x16
	MOVFF	(_Tail + 2), r0x17
	MOVLW	0x0a
	ADDWF	r0x15, F
	MOVLW	0x00
	ADDWFC	r0x16, F
	MOVLW	0x00
	ADDWFC	r0x17, F
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, PRODH
	MOVFF	r0x10, TBLPTRL
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput3
	MOVF	r0x0e, W
	ADDLW	0x0d
	MOVWF	r0x15
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x16
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x17
	MOVFF	_Tail, POSTDEC1
	MOVFF	(_Tail + 1), PRODH
	MOVFF	(_Tail + 2), TBLPTRL
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput3
	MOVFF	r0x0e, _Tail
	MOVFF	r0x0f, (_Tail + 1)
	MOVFF	r0x10, (_Tail + 2)
	MOVFF	_Tail, r0x15
	MOVFF	(_Tail + 1), r0x16
	MOVFF	(_Tail + 2), r0x17
	MOVLW	0x0a
	ADDWF	r0x15, F
	MOVLW	0x00
	ADDWFC	r0x16, F
	MOVLW	0x00
	ADDWFC	r0x17, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput3
	BRA	_00214_DS_
_00210_DS_:
	MOVFF	r0x0e, _Tail
	MOVFF	r0x0f, (_Tail + 1)
	MOVFF	r0x10, (_Tail + 2)
	MOVFF	r0x0e, _Head
	MOVFF	r0x0f, (_Head + 1)
	MOVFF	r0x10, (_Head + 2)
	MOVF	r0x0e, W
	ADDLW	0x0a
	MOVWF	r0x15
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x16
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x17
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput3
	MOVF	r0x0e, W
	ADDLW	0x0d
	MOVWF	r0x15
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x16
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x17
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput3
	BRA	_00214_DS_
_00213_DS_:
;	.line	422; brtos/queue.c	Task->TimeToWait = NO_TIMEOUT;
	MOVF	r0x0e, W
	ADDLW	0x07
	MOVWF	r0x15
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x16
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x17
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x15, FSR0L
	MOVFF	r0x16, PRODL
	MOVF	r0x17, W
	CALL	__gptrput2
_00214_DS_:
;	.line	426; brtos/queue.c	ChangeContext();
	CALL	_SwitchContext
;	.line	429; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	431; brtos/queue.c	OSEnterCritical();  
	BCF	_INTCONbits, 7
;	.line	433; brtos/queue.c	if (time_wait)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00230_DS_
;	.line	436; brtos/queue.c	if(Task->TimeToWait == EXIT_BY_TIMEOUT)
	MOVF	r0x0e, W
	ADDLW	0x07
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x15
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x15, W
	CALL	__gptrget2
	MOVWF	r0x16
	MOVFF	PRODL, r0x17
	MOVF	r0x16, W
	XORLW	0xe9
	BNZ	_00255_DS_
	MOVF	r0x17, W
	XORLW	0xfd
	BZ	_00256_DS_
_00255_DS_:
	BRA	_00227_DS_
_00256_DS_:
;	.line	439; brtos/queue.c	if ((pont_event->OSEventWaitList & PriorityMask[iPriority]))
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x16
	MOVFF	PRODL, r0x17
; ;multiply lit val:0x02 by variable r0x11 and store in r0x11
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x11, F
	CLRF	r0x18
	CLRF	r0x19
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x11, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x18, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x19, F
	MOVFF	r0x11, TBLPTRL
	MOVFF	r0x18, TBLPTRH
	MOVFF	r0x19, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x11
	TBLRD*+	
	MOVFF	TABLAT, r0x18
	MOVF	r0x11, W
	ANDWF	r0x16, F
	MOVF	r0x18, W
	ANDWF	r0x17, F
	MOVF	r0x16, W
	IORWF	r0x17, W
	BTFSC	STATUS, 2
	BRA	_00230_DS_
;	.line	442; brtos/queue.c	pont_event->OSEventWaitList = pont_event->OSEventWaitList & ~(PriorityMask[iPriority]);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x16
	MOVFF	PRODL, r0x17
	COMF	r0x11, F
	COMF	r0x18, F
	MOVF	r0x11, W
	ANDWF	r0x16, F
	MOVF	r0x18, W
	ANDWF	r0x17, F
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x17, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	445; brtos/queue.c	pont_event->OSEventWait--;
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget1
	MOVWF	r0x00
	DECF	r0x00, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrput1
;	.line	448; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	451; brtos/queue.c	return TIMEOUT;
	MOVLW	0x06
	BRA	_00236_DS_
_00227_DS_:
;	.line	457; brtos/queue.c	Task->TimeToWait = NO_TIMEOUT;
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x15, W
	CALL	__gptrput2
;	.line	460; brtos/queue.c	RemoveFromDelayList();
	MOVF	r0x0e, W
	BANKSEL	_Head
	XORWF	_Head, W, B
	BNZ	_00258_DS_
	MOVF	r0x0f, W
	BANKSEL	(_Head + 1)
	XORWF	(_Head + 1), W, B
	BNZ	_00258_DS_
	MOVF	r0x10, W
	BANKSEL	(_Head + 2)
	XORWF	(_Head + 2), W, B
	BZ	_00259_DS_
_00258_DS_:
	BRA	_00224_DS_
_00259_DS_:
	MOVF	r0x0e, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00260_DS_
	MOVF	r0x0f, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00260_DS_
	MOVF	r0x10, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00261_DS_
_00260_DS_:
	BRA	_00218_DS_
_00261_DS_:
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
	BRA	_00230_DS_
_00218_DS_:
	MOVF	r0x0e, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x10, W
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
	BRA	_00230_DS_
_00224_DS_:
	MOVF	r0x0e, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00262_DS_
	MOVF	r0x0f, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00262_DS_
	MOVF	r0x10, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00263_DS_
_00262_DS_:
	BRA	_00221_DS_
_00263_DS_:
	MOVF	r0x0e, W
	ADDLW	0x0d
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x10, W
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
	BRA	_00230_DS_
_00221_DS_:
	MOVF	r0x0e, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x10, W
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
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x11
	MOVLW	0x0d
	ADDWF	r0x0e, F
	MOVLW	0x00
	ADDWFC	r0x0f, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget3
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, PRODH
	MOVFF	r0x10, TBLPTRL
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x11, W
	CALL	__gptrput3
	MOVLW	0x0a
	ADDWF	r0x0e, F
	MOVLW	0x00
	ADDWFC	r0x0f, F
	MOVLW	0x00
	ADDWFC	r0x10, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrput3
_00230_DS_:
;	.line	466; brtos/queue.c	if (cqueue->OSQOut == cqueue->OSQEnd)
	MOVF	r0x08, W
	ADDLW	0x0c
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x0e
	MOVF	r0x08, W
	ADDLW	0x06
	MOVWF	r0x0f
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x11
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrget3
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	MOVFF	PRODH, r0x11
	MOVF	r0x06, W
	XORWF	r0x0f, W
	BNZ	_00264_DS_
	MOVF	r0x07, W
	XORWF	r0x10, W
	BNZ	_00264_DS_
	MOVF	r0x0e, W
	XORWF	r0x11, W
	BZ	_00265_DS_
_00264_DS_:
	BRA	_00232_DS_
_00265_DS_:
;	.line	467; brtos/queue.c	cqueue->OSQOut = cqueue->OSQStart;
	MOVLW	0x03
	ADDWF	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVLW	0x00
	ADDWFC	r0x0a, F
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget3
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x0a, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
_00232_DS_:
;	.line	470; brtos/queue.c	*pdata = *cqueue->OSQOut;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	r0x09
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	473; brtos/queue.c	cqueue->OSQOut++;
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BTFSC	STATUS, 0
	INCF	r0x08, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, PRODH
	MOVFF	r0x08, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
;	.line	476; brtos/queue.c	cqueue->OSQEntries--;
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0xff
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x01, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput2
;	.line	479; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	480; brtos/queue.c	return READ_BUFFER_OK;
	CLRF	WREG
_00236_DS_:
	MOVFF	PREINC1, r0x1f
	MOVFF	PREINC1, r0x1e
	MOVFF	PREINC1, r0x1d
	MOVFF	PREINC1, r0x1c
	MOVFF	PREINC1, r0x1b
	MOVFF	PREINC1, r0x1a
	MOVFF	PREINC1, r0x19
	MOVFF	PREINC1, r0x18
	MOVFF	PREINC1, r0x17
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
S_queue__OSCleanQueue	code
_OSCleanQueue:
;	.line	278; brtos/queue.c	INT8U OSCleanQueue(BRTOS_Queue *pont_event)
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
;	.line	281; brtos/queue.c	OS_QUEUE *cqueue = pont_event->OSEventPointer;
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	BANKSEL	_iNesting
;	.line	285; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00196_DS_
;	.line	287; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00196_DS_:
;	.line	289; brtos/queue.c	cqueue->OSQEntries = 0;
	MOVF	r0x00, W
	ADDLW	0x11
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	291; brtos/queue.c	cqueue->OSQIn = cqueue->OSQStart;
	MOVF	r0x00, W
	ADDLW	0x09
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
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
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, PRODH
	MOVFF	r0x08, TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
;	.line	292; brtos/queue.c	cqueue->OSQOut = cqueue->OSQStart;
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, PRODH
	MOVFF	r0x08, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
	BANKSEL	_iNesting
;	.line	296; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00198_DS_
;	.line	298; brtos/queue.c	OSExitCritical();  
	BSF	_INTCONbits, 7
_00198_DS_:
;	.line	300; brtos/queue.c	return CLEAN_BUFFER_OK;
	MOVLW	0x02
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
S_queue__OSRQueue	code
_OSRQueue:
;	.line	222; brtos/queue.c	INT8U OSRQueue(OS_QUEUE *cqueue, INT8U* pdata)
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
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
	BANKSEL	_iNesting
;	.line	228; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00172_DS_
;	.line	230; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00172_DS_:
;	.line	232; brtos/queue.c	if(cqueue->OSQEntries > 0)
	MOVF	r0x00, W
	ADDLW	0x11
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
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BTFSC	STATUS, 2
	BRA	_00180_DS_
;	.line	235; brtos/queue.c	if (cqueue->OSQOut == cqueue->OSQEnd)
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget3
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x13
	MOVFF	r0x11, FSR0L
	MOVFF	r0x12, PRODL
	MOVF	r0x13, W
	CALL	__gptrget3
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVFF	PRODH, r0x13
	MOVF	r0x0e, W
	XORWF	r0x11, W
	BNZ	_00189_DS_
	MOVF	r0x0f, W
	XORWF	r0x12, W
	BNZ	_00189_DS_
	MOVF	r0x10, W
	XORWF	r0x13, W
	BZ	_00190_DS_
_00189_DS_:
	BRA	_00174_DS_
_00190_DS_:
;	.line	236; brtos/queue.c	cqueue->OSQOut = cqueue->OSQStart;
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput3
_00174_DS_:
;	.line	238; brtos/queue.c	*pdata = *(cqueue->OSQOut);
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	240; brtos/queue.c	cqueue->OSQOut++;
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput3
;	.line	241; brtos/queue.c	cqueue->OSQEntries--;
	MOVLW	0xff
	ADDWF	r0x09, F
	BTFSS	STATUS, 0
	DECF	r0x0a, F
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, PRODH
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput2
	BANKSEL	_iNesting
;	.line	245; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00176_DS_
;	.line	247; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00176_DS_:
;	.line	249; brtos/queue.c	return READ_BUFFER_OK;
	CLRF	WREG
	BRA	_00182_DS_
_00180_DS_:
	BANKSEL	_iNesting
;	.line	255; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00178_DS_
;	.line	257; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00178_DS_:
;	.line	259; brtos/queue.c	return NO_ENTRY_AVAILABLE;
	MOVLW	0x03
_00182_DS_:
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
S_queue__OSWQueue	code
_OSWQueue:
;	.line	166; brtos/queue.c	INT8U OSWQueue(OS_QUEUE *cqueue, INT8U newdata)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	BANKSEL	_iNesting
;	.line	172; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00147_DS_
;	.line	174; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00147_DS_:
;	.line	176; brtos/queue.c	if (cqueue->OSQEntries < cqueue->OSQSize)
	MOVF	r0x00, W
	ADDLW	0x11
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
	MOVF	r0x00, W
	ADDLW	0x0f
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
	CALL	__gptrget2
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVF	r0x0a, W
	SUBWF	r0x08, W
	BNZ	_00164_DS_
	MOVF	r0x09, W
	SUBWF	r0x07, W
_00164_DS_:
	BC	_00151_DS_
;	.line	178; brtos/queue.c	cqueue->OSQEntries++;
	INCF	r0x07, F
	BTFSC	STATUS, 0
	INCF	r0x08, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput2
	BRA	_00152_DS_
_00151_DS_:
	BANKSEL	_iNesting
;	.line	184; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00149_DS_
;	.line	186; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00149_DS_:
;	.line	188; brtos/queue.c	return BUFFER_UNDERRUN;
	MOVLW	0x01
	BRA	_00157_DS_
_00152_DS_:
;	.line	191; brtos/queue.c	if (cqueue->OSQIn == cqueue->OSQEnd)
	MOVF	r0x00, W
	ADDLW	0x09
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
	CALL	__gptrget3
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVFF	PRODH, r0x09
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget3
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVF	r0x07, W
	XORWF	r0x0a, W
	BNZ	_00165_DS_
	MOVF	r0x08, W
	XORWF	r0x0b, W
	BNZ	_00165_DS_
	MOVF	r0x09, W
	XORWF	r0x0c, W
	BZ	_00166_DS_
_00165_DS_:
	BRA	_00154_DS_
_00166_DS_:
;	.line	192; brtos/queue.c	cqueue->OSQIn = cqueue->OSQStart;
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput3
_00154_DS_:
;	.line	194; brtos/queue.c	*(cqueue->OSQIn) = newdata;
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	195; brtos/queue.c	cqueue->OSQIn++; 
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput3
	BANKSEL	_iNesting
;	.line	199; brtos/queue.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00156_DS_
;	.line	201; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00156_DS_:
;	.line	203; brtos/queue.c	return WRITE_BUFFER_OK;
	CLRF	WREG
_00157_DS_:
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
S_queue__OSQueueCreate	code
_OSQueueCreate:
;	.line	78; brtos/queue.c	INT8U OSQueueCreate(OS_QUEUE *cqueue, INT16U size, BRTOS_Queue **event)
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
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
	MOVLW	0x09
	MOVFF	PLUSW2, r0x06
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x07
	BANKSEL	_iNesting
;	.line	84; brtos/queue.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00106_DS_
;	.line	85; brtos/queue.c	return(IRQ_PEND_ERR);                           // Can't be create by interrupt
	MOVLW	0x02
	BRA	_00125_DS_
_00106_DS_:
	BANKSEL	_currentTask
;	.line	89; brtos/queue.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00108_DS_
;	.line	90; brtos/queue.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00108_DS_:
;	.line	92; brtos/queue.c	if ((iQueueAddress + size) > QUEUE_HEAP_SIZE)
	MOVF	r0x03, W
	BANKSEL	_iQueueAddress
	ADDWF	_iQueueAddress, W, B
	MOVWF	r0x08
	MOVF	r0x04, W
	BANKSEL	(_iQueueAddress + 1)
	ADDWFC	(_iQueueAddress + 1), W, B
	MOVWF	r0x09
	MOVLW	0x00
	SUBWF	r0x09, W
	BNZ	_00137_DS_
	MOVLW	0x81
	SUBWF	r0x08, W
_00137_DS_:
	BNC	_00135_DS_
	BANKSEL	_currentTask
;	.line	95; brtos/queue.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00110_DS_
;	.line	96; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00110_DS_:
;	.line	98; brtos/queue.c	return NO_MEMORY;
	MOVLW	0x01
	BRA	_00125_DS_
_00135_DS_:
;	.line	102; brtos/queue.c	for(i=0;i<=BRTOS_MAX_QUEUE;i++)
	CLRF	r0x0a
	CLRF	r0x0b
	CLRF	r0x0c
	CLRF	r0x0d
_00119_DS_:
	MOVF	r0x0b, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00138_DS_
	MOVLW	0x04
	SUBWF	r0x0a, W
_00138_DS_:
	BC	_00122_DS_
;	.line	105; brtos/queue.c	if(i >= BRTOS_MAX_QUEUE)
	MOVF	r0x0b, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00139_DS_
	MOVLW	0x03
	SUBWF	r0x0a, W
_00139_DS_:
	BNC	_00116_DS_
	BANKSEL	_currentTask
;	.line	110; brtos/queue.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00114_DS_
;	.line	111; brtos/queue.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00114_DS_:
;	.line	113; brtos/queue.c	return(NO_AVAILABLE_EVENT);
	MOVLW	0x01
	BRA	_00125_DS_
_00116_DS_:
;	.line	117; brtos/queue.c	if(BRTOS_Queue_Table[i].OSEventAllocated != TRUE)
	MOVLW	LOW(_BRTOS_Queue_Table)
	ADDWF	r0x0c, W
	MOVWF	r0x0e
	MOVLW	HIGH(_BRTOS_Queue_Table)
	ADDWFC	r0x0d, W
	MOVWF	r0x0f
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, FSR0H
	MOVFF	INDF0, r0x10
	MOVF	r0x10, W
	XORLW	0x01
	BZ	_00121_DS_
;	.line	119; brtos/queue.c	BRTOS_Queue_Table[i].OSEventAllocated = TRUE;
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	120; brtos/queue.c	pont_event = &BRTOS_Queue_Table[i];
	MOVLW	LOW(_BRTOS_Queue_Table)
	ADDWF	r0x0c, W
	MOVWF	r0x0e
	MOVLW	HIGH(_BRTOS_Queue_Table)
	ADDWFC	r0x0d, W
	MOVWF	r0x0f
	MOVF	r0x0f, W
	MOVWF	r0x0f
	MOVF	r0x0e, W
	MOVWF	r0x0e
	MOVLW	0x80
	MOVWF	r0x10
;	.line	121; brtos/queue.c	break;      
	BRA	_00122_DS_
_00121_DS_:
;	.line	102; brtos/queue.c	for(i=0;i<=BRTOS_MAX_QUEUE;i++)
	MOVLW	0x08
	ADDWF	r0x0c, F
	BTFSC	STATUS, 0
	INCF	r0x0d, F
	INCF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	BRA	_00119_DS_
_00122_DS_:
;	.line	126; brtos/queue.c	cqueue->OSQPtr = (INT8U *)&QUEUE_STACK[iQueueAddress];
	MOVLW	LOW(_QUEUE_STACK)
	BANKSEL	_iQueueAddress
	ADDWF	_iQueueAddress, W, B
	MOVWF	r0x0a
	MOVLW	HIGH(_QUEUE_STACK)
	BANKSEL	(_iQueueAddress + 1)
	ADDWFC	(_iQueueAddress + 1), W, B
	MOVWF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
;	.line	127; brtos/queue.c	iQueueAddress  = iQueueAddress + size;
	MOVFF	r0x08, _iQueueAddress
	MOVFF	r0x09, (_iQueueAddress + 1)
;	.line	128; brtos/queue.c	cqueue->OSQSize =  size;
	MOVF	r0x00, W
	ADDLW	0x0f
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput2
;	.line	129; brtos/queue.c	cqueue->OSQEntries =  0;
	MOVF	r0x00, W
	ADDLW	0x11
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput2
;	.line	130; brtos/queue.c	cqueue->OSQStart = cqueue->OSQPtr;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput3
;	.line	131; brtos/queue.c	cqueue->OSQEnd =   cqueue->OSQPtr + cqueue->OSQSize;
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	CLRF	r0x11
	MOVF	r0x0a, W
	ADDWF	r0x03, F
	MOVF	r0x0b, W
	ADDWFC	r0x04, F
	MOVF	r0x0c, W
	ADDWFC	r0x11, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x11, TBLPTRL
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput3
;	.line	132; brtos/queue.c	cqueue->OSQIn =    cqueue->OSQPtr;
	MOVF	r0x00, W
	ADDLW	0x09
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x08, W
	CALL	__gptrput3
;	.line	133; brtos/queue.c	cqueue->OSQOut =   cqueue->OSQPtr;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x08, W
	CALL	__gptrput3
;	.line	136; brtos/queue.c	pont_event->OSEventPointer = cqueue;
	MOVF	r0x0e, W
	ADDLW	0x03
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x08
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x08, W
	CALL	__gptrput3
;	.line	137; brtos/queue.c	pont_event->OSEventWait = 0;
	MOVF	r0x0e, W
	ADDLW	0x02
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	140; brtos/queue.c	pont_event->OSEventWaitList=0;
	MOVF	r0x0e, W
	ADDLW	0x06
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0f, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x10, W
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	142; brtos/queue.c	*event = pont_event;
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, PRODH
	MOVFF	r0x10, TBLPTRL
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput3
	BANKSEL	_currentTask
;	.line	145; brtos/queue.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00124_DS_
;	.line	146; brtos/queue.c	OSExitCritical();  
	BSF	_INTCONbits, 7
_00124_DS_:
;	.line	148; brtos/queue.c	return(ALLOC_EVENT_OK);
	CLRF	WREG
_00125_DS_:
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



; Statistics:
; code size:	 5750 (0x1676) bytes ( 4.39%)
;           	 2875 (0x0b3b) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   32 (0x0020) bytes


	end
