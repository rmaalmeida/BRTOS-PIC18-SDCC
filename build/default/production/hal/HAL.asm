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
	global _TickTimerSetup
	global _SwitchContext
	global _CreateVirtualStack
	global _TickTimerHandler
	global _SPvalue
	global _HighInterrupt

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
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
	extern _OS_TICK_HANDLER
	extern _OSSchedule
	extern _PriorityMask
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3


	idata
_SPvalue	db	0x00, 0x00


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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_HAL__TickTimerHandler	code
_TickTimerHandler:
;	.line	228; hal/HAL.c	void TickTimerHandler(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF _STATUS, PREINC1 
	MOVFF _WREG, PREINC1 
	MOVFF _BSR, PREINC1 
	MOVFF _FSR2H, PREINC1 
	MOVFF _FSR1H, _FSR2H 
	MOVFF _FSR2L, PREINC1 
	MOVFF _FSR0L, PREINC1 
	MOVFF _FSR0H, PREINC1 
	MOVFF _TABLAT, PREINC1 
	MOVFF _TBLPTRL, PREINC1 
	MOVFF _TBLPTRH, PREINC1 
	MOVFF _TBLPTRU, PREINC1 
	MOVFF _PRODL, PREINC1 
	MOVFF _PRODH, PREINC1 
	MOVFF _PCLATH, PREINC1 
	MOVFF _PCLATU, PREINC1 
	BANKSEL	_iNesting
;	.line	235; hal/HAL.c	OS_INT_ENTER();
	INCF	_iNesting, F, B
;	.line	238; hal/HAL.c	TICKTIMER_INT_HANDLER;
	BCF	_PIR1bits, 2
	BANKSEL	_counter
;	.line	240; hal/HAL.c	counter++;
	INCF	_counter, F, B
	BNC	_10147_DS_
	BANKSEL	(_counter + 1)
	INCF	(_counter + 1), F, B
_10147_DS_:
	BANKSEL	_counter
;	.line	241; hal/HAL.c	if (counter == TickCountOverFlow) counter = 0;
	MOVF	_counter, W, B
	BNZ	_00168_DS_
	BANKSEL	(_counter + 1)
	MOVF	(_counter + 1), W, B
	XORLW	0xfa
	BZ	_00169_DS_
_00168_DS_:
	BRA	_00148_DS_
_00169_DS_:
	BANKSEL	_counter
	CLRF	_counter, B
	BANKSEL	(_counter + 1)
	CLRF	(_counter + 1), B
_00148_DS_:
;	.line	261; hal/HAL.c	OS_TICK_HANDLER();
	CALL	_OS_TICK_HANDLER
	BANKSEL	_iNesting
;	.line	266; hal/HAL.c	OS_INT_EXIT();  
	DECF	_iNesting, F, B
	BANKSEL	_iNesting
	MOVF	_iNesting, W, B
	BTFSS	STATUS, 2
	BRA	_00158_DS_
	CALL	_OSSchedule
	BANKSEL	_SelectedTask
	MOVWF	_SelectedTask, B
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	BANKSEL	_SelectedTask
	XORWF	_SelectedTask, W, B
	BNZ	_00171_DS_
	BRA	_00158_DS_
_00170_DS_:
_00171_DS_:
	MOVFF _STKPTR, _FSR0L 
_00149_DS_:
	MOVF	_STKPTR, W
	BZ	_00151_DS_
	MOVFF _TOSL, _PREINC1 
	MOVFF _TOSH, _PREINC1 
	MOVFF _TOSU, _PREINC1 
	POP 
	BRA	_00149_DS_
_00151_DS_:
	MOVFF _FSR0L, _PREINC1 
	MOVF _PREINC1, 1, 0 
	MOVFF _FSR1L, _SPvalue 
	MOVFF _FSR1H, _SPvalue+1 
; ;multiply lit val:0x10 by variable _currentTask and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x01, F
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_SPvalue, POSTINC0
	MOVFF	(_SPvalue + 1), INDF0
	MOVFF	_SelectedTask, _currentTask
; ;multiply lit val:0x10 by variable _currentTask and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x01, F
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, _SPvalue
	MOVFF	INDF0, (_SPvalue + 1)
	MOVFF _SPvalue, _FSR1L 
	MOVFF _SPvalue+1, _FSR1H 
	MOVFF _POSTDEC1, _FSR0L 
	MOVFF _POSTDEC1, _FSR0L 
	CLRF	_STKPTR
_00152_DS_:
	MOVF	_FSR0L, W
	SUBWF	_STKPTR, W
	BC	_00158_DS_
	PUSH 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSU, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSH, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSL, 0 
	BRA	_00152_DS_
_00158_DS_:
	MOVFF POSTDEC1, _PCLATU 
	MOVFF POSTDEC1, _PCLATH 
	MOVFF POSTDEC1, _PRODH 
	MOVFF POSTDEC1, _PRODL 
	MOVFF POSTDEC1, _TBLPTRU 
	MOVFF POSTDEC1, _TBLPTRH 
	MOVFF POSTDEC1, _TBLPTRL 
	MOVFF POSTDEC1, _TABLAT 
	MOVFF POSTDEC1, _FSR0H 
	MOVFF POSTDEC1, _FSR0L 
	MOVFF POSTDEC1, _FSR2L 
	MOVFF POSTDEC1, _FSR2H 
	MOVFF _FSR2H, _FSR1H 
	MOVFF POSTDEC1, _BSR 
	MOVFF POSTDEC1, _WREG 
	MOVFF POSTDEC1, _STATUS 
	RETFIE 0 
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_HAL__HighInterrupt	code
_HighInterrupt:
;	.line	204; hal/HAL.c	void HighInterrupt( void )
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	207; hal/HAL.c	if( PIR1bits.CCP1IF )
	BTFSS	_PIR1bits, 2
	BRA	_00141_DS_
	goto _TickTimerHandler 
; ;;!!! pic16_aopOp:1071 called for a spillLocation -- assigning WREG instead --- CHECK
_00141_DS_:
;	.line	213; hal/HAL.c	if( PIR1bits.RCIF )
	CLRF	WREG
	BTFSC	_PIR1bits, 5
	INCF	WREG, F
; ;;!!! pic16_aopOp:1071 called for a spillLocation -- assigning WREG instead --- CHECK
;	.line	219; hal/HAL.c	if( PIR1bits.TXIF )
	CLRF	WREG
	BTFSC	_PIR1bits, 4
	INCF	WREG, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_HAL__CreateVirtualStack	code
_CreateVirtualStack:
;	.line	119; hal/HAL.c	void CreateVirtualStack(FctPtr function, INT16U NUMBER_OF_STACKED_BYTES)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
;	.line	122; hal/HAL.c	INT8U *stk = &STACK[iStackAddress];
	MOVLW	LOW(_STACK)
	BANKSEL	_iStackAddress
	ADDWF	_iStackAddress, W, B
	MOVWF	r0x03
	MOVLW	HIGH(_STACK)
	BANKSEL	(_iStackAddress + 1)
	ADDWFC	(_iStackAddress + 1), W, B
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	r0x06
	MOVF	r0x03, W
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
;	.line	125; hal/HAL.c	address = address >> 8;
	MOVF	r0x04, W
	MOVWF	r0x03
	CLRF	r0x04
;	.line	126; hal/HAL.c	*stk++  = 0xF1;                     // <-- FSR1 Pointer position on function call.
	MOVLW	0xf1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	127; hal/HAL.c	*stk++  = 0xA5;                     // STATUS register
	MOVLW	0xa5
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	128; hal/HAL.c	*stk++  = 0x00;                     // W register 
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	129; hal/HAL.c	*stk++  = 0xB0;                     // BSR register
	MOVLW	0xb0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	130; hal/HAL.c	*stk++  = (INT8U)address;           // FSR2H register
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	131; hal/HAL.c	*stk++  = 0xF2;                     // FSR2L register
	MOVLW	0xf2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	132; hal/HAL.c	*stk++  = 0xF0;                     // FSR0L register
	MOVLW	0xf0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	133; hal/HAL.c	*stk++  = 0xF0;                     // FSR0H register
	MOVLW	0xf0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	134; hal/HAL.c	*stk++  = 0xB2;                     // TABLAT
	MOVLW	0xb2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	135; hal/HAL.c	*stk++  = 0xB3;                     // TBLPTRL Prog Mem Table Pointer Low
	MOVLW	0xb3
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	136; hal/HAL.c	*stk++  = 0xB4;                     // TBLPTRH Prog Mem Table Pointer High
	MOVLW	0xb4
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	137; hal/HAL.c	*stk++  = 0xB5;                     // TBLPTRU Prog Mem Table Pointer Upper
	MOVLW	0xb5
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	138; hal/HAL.c	*stk++  = 0xD0;                     // PRODL Product Reg low
	MOVLW	0xd0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	139; hal/HAL.c	*stk++  = 0xD1;                     // PRODH Product Reg high
	MOVLW	0xd1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	140; hal/HAL.c	*stk++  = 0xA3;                        // AARGB3
	MOVLW	0xa3
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	141; hal/HAL.c	*stk++  = 0xA2;                        // AARGB2
	MOVLW	0xa2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	142; hal/HAL.c	*stk++  = 0xA1;                        // AARGB1
	MOVLW	0xa1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	143; hal/HAL.c	*stk++  = 0xA0;                        // AARGB0
	MOVLW	0xa0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	144; hal/HAL.c	*stk++  = 0xB3;                        // BARGB3
	MOVLW	0xb3
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	145; hal/HAL.c	*stk++  = 0xB2;                        // BARGB2 
	MOVLW	0xb2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	146; hal/HAL.c	*stk++  = 0xB1;                        // BARGB1
	MOVLW	0xb1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	147; hal/HAL.c	*stk++  = 0xB0;                        // BARGB0
	MOVLW	0xb0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	148; hal/HAL.c	*stk++  = 0xE3;                        // REMB3
	MOVLW	0xe3
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	149; hal/HAL.c	*stk++  = 0xE2;                        // REMB2 
	MOVLW	0xe2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	150; hal/HAL.c	*stk++  = 0xE1;                        // REMB1
	MOVLW	0xe1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	151; hal/HAL.c	*stk++  = 0xE0;                        // REMB0 
	MOVLW	0xe0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	152; hal/HAL.c	*stk++  = 0xFB;                        // __FPFLAGS
	MOVLW	0xfb
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	153; hal/HAL.c	*stk++  = 0xFF;                        // SIGN
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	154; hal/HAL.c	*stk++  = 0xAE;                        // __AEXP
	MOVLW	0xae
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	155; hal/HAL.c	*stk++  = 0xBE;                        // __BEXP
	MOVLW	0xbe
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	156; hal/HAL.c	*stk++  = 0xD3;                        // __TEMPB3
	MOVLW	0xd3
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	157; hal/HAL.c	*stk++  = 0xD2;                        // __TEMPB2
	MOVLW	0xd2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	158; hal/HAL.c	*stk++  = 0xD1;                        // __TEMPB1
	MOVLW	0xd1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	159; hal/HAL.c	*stk++  = 0xD0;                        // __TEMPB0
	MOVLW	0xd0
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	160; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	161; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	162; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	163; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	164; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	165; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	166; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	167; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	168; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	169; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	170; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	171; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	172; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	173; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	174; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	175; hal/HAL.c	*stk++  = 0x10;                        // __tmp_0
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	176; hal/HAL.c	*stk++  = 0xC1;                        // PCLATH
	MOVLW	0xc1
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	177; hal/HAL.c	*stk++  = 0xC2;                        // PCLATU
	MOVLW	0xc2
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	180; hal/HAL.c	*stk++  = (INT8U)((INT16U)(function)) & 0x00FF;     // TOSL
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	181; hal/HAL.c	*stk++  = (INT8U)((INT16U)(function) >> 8);         // TOSH
	MOVF	r0x01, W
	MOVWF	r0x00
	CLRF	r0x01
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	182; hal/HAL.c	*stk++  = (INT8U)0;                                // TOSU
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
;	.line	184; hal/HAL.c	*stk++  = 0x01;                     // size of return stack - one level deep only
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
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
S_HAL__SwitchContext	code
_SwitchContext:
;	.line	82; hal/HAL.c	void SwitchContext(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF _STATUS, PREINC1 
	MOVFF _WREG, PREINC1 
	MOVFF _BSR, PREINC1 
	MOVFF _FSR2H, PREINC1 
	MOVFF _FSR1H, _FSR2H 
	MOVFF _FSR2L, PREINC1 
	MOVFF _FSR0L, PREINC1 
	MOVFF _FSR0H, PREINC1 
	MOVFF _TABLAT, PREINC1 
	MOVFF _TBLPTRL, PREINC1 
	MOVFF _TBLPTRH, PREINC1 
	MOVFF _TBLPTRU, PREINC1 
	MOVFF _PRODL, PREINC1 
	MOVFF _PRODH, PREINC1 
	MOVFF _PCLATH, PREINC1 
	MOVFF _PCLATU, PREINC1 
	BANKSEL	_iNesting
;	.line	88; hal/HAL.c	OS_INT_ENTER();
	INCF	_iNesting, F, B
	BANKSEL	_iNesting
;	.line	95; hal/HAL.c	OS_INT_EXIT();
	DECF	_iNesting, F, B
	BANKSEL	_iNesting
	MOVF	_iNesting, W, B
	BTFSS	STATUS, 2
	BRA	_00119_DS_
	CALL	_OSSchedule
	BANKSEL	_SelectedTask
	MOVWF	_SelectedTask, B
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	BANKSEL	_SelectedTask
	XORWF	_SelectedTask, W, B
	BNZ	_00129_DS_
	BRA	_00119_DS_
_00128_DS_:
_00129_DS_:
	MOVFF _STKPTR, _FSR0L 
_00110_DS_:
	MOVF	_STKPTR, W
	BZ	_00112_DS_
	MOVFF _TOSL, _PREINC1 
	MOVFF _TOSH, _PREINC1 
	MOVFF _TOSU, _PREINC1 
	POP 
	BRA	_00110_DS_
_00112_DS_:
	MOVFF _FSR0L, _PREINC1 
	MOVF _PREINC1, 1, 0 
	MOVFF _FSR1L, _SPvalue 
	MOVFF _FSR1H, _SPvalue+1 
; ;multiply lit val:0x10 by variable _currentTask and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x01, F
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_SPvalue, POSTINC0
	MOVFF	(_SPvalue + 1), INDF0
	MOVFF	_SelectedTask, _currentTask
; ;multiply lit val:0x10 by variable _currentTask and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x01, F
	MOVLW	0x03
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, _SPvalue
	MOVFF	INDF0, (_SPvalue + 1)
	MOVFF _SPvalue, _FSR1L 
	MOVFF _SPvalue+1, _FSR1H 
	MOVFF _POSTDEC1, _FSR0L 
	MOVFF _POSTDEC1, _FSR0L 
	CLRF	_STKPTR
_00113_DS_:
	MOVF	_FSR0L, W
	SUBWF	_STKPTR, W
	BC	_00119_DS_
	PUSH 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSU, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSH, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSL, 0 
	BRA	_00113_DS_
_00119_DS_:
	MOVFF POSTDEC1, _PCLATU 
	MOVFF POSTDEC1, _PCLATH 
	MOVFF POSTDEC1, _PRODH 
	MOVFF POSTDEC1, _PRODL 
	MOVFF POSTDEC1, _TBLPTRU 
	MOVFF POSTDEC1, _TBLPTRH 
	MOVFF POSTDEC1, _TBLPTRL 
	MOVFF POSTDEC1, _TABLAT 
	MOVFF POSTDEC1, _FSR0H 
	MOVFF POSTDEC1, _FSR0L 
	MOVFF POSTDEC1, _FSR2L 
	MOVFF POSTDEC1, _FSR2H 
	MOVFF _FSR2H, _FSR1H 
	MOVFF POSTDEC1, _BSR 
	MOVFF POSTDEC1, _WREG 
	MOVFF POSTDEC1, _STATUS 
	RETFIE 0 
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_HAL__TickTimerSetup	code
_TickTimerSetup:
;	.line	20; hal/HAL.c	void TickTimerSetup(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	23; hal/HAL.c	CCPR1 = ( configCPU_INT_CLOCK_HZ / configTICK_RATE_HZ );
	MOVLW	0x40
	MOVWF	_CCPR1
;	.line	25; hal/HAL.c	TMR1H = ( unsigned char ) 0x00;
	CLRF	_TMR1H
;	.line	26; hal/HAL.c	TMR1L = ( unsigned char ) 0x00;    
	CLRF	_TMR1L
;	.line	29; hal/HAL.c	CCP1CONbits.CCP1M0 = 1;        /*< Compare match mode. */
	BSF	_CCP1CONbits, 0
;	.line	30; hal/HAL.c	CCP1CONbits.CCP1M1 = 1;        /*< Compare match mode. */
	BSF	_CCP1CONbits, 1
;	.line	31; hal/HAL.c	CCP1CONbits.CCP1M2 = 0;        /*< Compare match mode. */
	BCF	_CCP1CONbits, 2
;	.line	32; hal/HAL.c	CCP1CONbits.CCP1M3 = 1;        /*< Compare match mode. */
	BSF	_CCP1CONbits, 3
;	.line	33; hal/HAL.c	PIE1bits.CCP1IE = 1;        /*< Interrupt enable. */
	BSF	_PIE1bits, 2
;	.line	34; hal/HAL.c	INTCONbits.PEIE = 1;        /*< Enable interrupts */
	BSF	_INTCONbits, 6
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	



; Statistics:
; code size:	 2424 (0x0978) bytes ( 1.85%)
;           	 1212 (0x04bc) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    8 (0x0008) bytes


	end
