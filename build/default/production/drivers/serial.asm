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
	global _SerialResource
	global _SerialRXBuffer
	global _QSerialRX
	global _SerialTXBuffer
	global _QSerialTX
	global _SerialTX
	global _Serial_Init
	global _Serial_Envia_Caracter
	global _Serial_Envia_Frase
	global _SerialRxHandler
	global _SerialRx
	global _SerialTxHandler
	global _SerialTx
	global _acquireUART
	global _releaseUART

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern _OSSchedule
	extern _OSSemCreate
	extern _OSSemPend
	extern _OSSemPost
	extern _OSMutexCreate
	extern _OSMutexAcquire
	extern _OSMutexRelease
	extern _OSQueueCreate
	extern _OSWQueue
	extern _OSRQueue
	extern _OSCleanQueue
	extern _OSQueuePost
	extern __divulong
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
PRODH	equ	0xff4


	idata
_WaitingSerialTXBuffer	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1

udata_serial_0	udata
_SerialResource	res	3

udata_serial_1	udata
_SerialTXBuffer	res	19

udata_serial_2	udata
_QSerialTX	res	3

udata_serial_3	udata
_SerialRXBuffer	res	19

udata_serial_4	udata
_QSerialRX	res	3

udata_serial_5	udata
_SerialTX	res	3

udata_serial_6	udata
_SerialTxHandler_caracter_1_1	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_serial__releaseUART	code
_releaseUART:
;	.line	216; drivers/serial.c	void releaseUART(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_SerialResource + 2)
;	.line	219; drivers/serial.c	OSMutexRelease(SerialResource);
	MOVF	(_SerialResource + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SerialResource + 1)
	MOVF	(_SerialResource + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SerialResource
	MOVF	_SerialResource, W, B
	MOVWF	POSTDEC1
	CALL	_OSMutexRelease
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_serial__acquireUART	code
_acquireUART:
;	.line	209; drivers/serial.c	void acquireUART(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_SerialResource + 2)
;	.line	212; drivers/serial.c	OSMutexAcquire(SerialResource);
	MOVF	(_SerialResource + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SerialResource + 1)
	MOVF	(_SerialResource + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SerialResource
	MOVF	_SerialResource, W, B
	MOVWF	POSTDEC1
	CALL	_OSMutexAcquire
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_serial__SerialTx	code
_SerialTx:
;	.line	184; drivers/serial.c	void SerialTx(void)
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
;	.line	190; drivers/serial.c	OS_INT_ENTER();
	INCF	_iNesting, F, B
;	.line	193; drivers/serial.c	SerialTxHandler();
	CALL	_SerialTxHandler
	BANKSEL	_iNesting
;	.line	202; drivers/serial.c	OS_INT_EXIT();
	DECF	_iNesting, F, B
	BANKSEL	_iNesting
	MOVF	_iNesting, W, B
	BTFSS	STATUS, 2
	BRA	_00221_DS_
	CALL	_OSSchedule
	BANKSEL	_SelectedTask
	MOVWF	_SelectedTask, B
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	BANKSEL	_SelectedTask
	XORWF	_SelectedTask, W, B
	BNZ	_00231_DS_
	BRA	_00221_DS_
_00230_DS_:
_00231_DS_:
	MOVFF _STKPTR, _FSR0L 
_00212_DS_:
	MOVF	_STKPTR, W
	BZ	_00214_DS_
	MOVFF _TOSL, _PREINC1 
	MOVFF _TOSH, _PREINC1 
	MOVFF _TOSU, _PREINC1 
	POP 
	BRA	_00212_DS_
_00214_DS_:
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
_00215_DS_:
	MOVF	_FSR0L, W
	SUBWF	_STKPTR, W
	BC	_00221_DS_
	PUSH 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSU, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSH, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSL, 0 
	BRA	_00215_DS_
_00221_DS_:
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
S_serial__SerialTxHandler	code
_SerialTxHandler:
;	.line	166; drivers/serial.c	void SerialTxHandler(void)
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
;	.line	171; drivers/serial.c	if (OSRQueue(&SerialTXBuffer, (INT8U*)&caracter) == NO_ENTRY_AVAILABLE)
	MOVLW	HIGH(_SerialTXBuffer)
	MOVWF	r0x01
	MOVLW	LOW(_SerialTXBuffer)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_SerialTxHandler_caracter_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_SerialTxHandler_caracter_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OSRQueue
	MOVWF	r0x00
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	XORLW	0x03
	BNZ	_00198_DS_
;	.line	173; drivers/serial.c	PIE1bits.TXIE = 0;
	BCF	_PIE1bits, 4
	BANKSEL	_WaitingSerialTXBuffer
;	.line	174; drivers/serial.c	if (WaitingSerialTXBuffer == 1)
	MOVF	_WaitingSerialTXBuffer, W, B
	XORLW	0x01
	BNZ	_00200_DS_
_00207_DS_:
	BANKSEL	(_SerialTX + 2)
;	.line	176; drivers/serial.c	(void)OSSemPost(SerialTX);
	MOVF	(_SerialTX + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SerialTX + 1)
	MOVF	(_SerialTX + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SerialTX
	MOVF	_SerialTX, W, B
	MOVWF	POSTDEC1
	CALL	_OSSemPost
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00200_DS_
_00198_DS_:
;	.line	180; drivers/serial.c	TXREG=caracter;
	MOVFF	_SerialTxHandler_caracter_1_1, _TXREG
_00200_DS_:
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
S_serial__SerialRx	code
_SerialRx:
;	.line	143; drivers/serial.c	void SerialRx(void)
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
;	.line	149; drivers/serial.c	OS_INT_ENTER();
	INCF	_iNesting, F, B
;	.line	152; drivers/serial.c	SerialRxHandler();
	CALL	_SerialRxHandler
	BANKSEL	_iNesting
;	.line	161; drivers/serial.c	OS_INT_EXIT();
	DECF	_iNesting, F, B
	BANKSEL	_iNesting
	MOVF	_iNesting, W, B
	BTFSS	STATUS, 2
	BRA	_00179_DS_
	CALL	_OSSchedule
	BANKSEL	_SelectedTask
	MOVWF	_SelectedTask, B
	BANKSEL	_currentTask
	MOVF	_currentTask, W, B
	BANKSEL	_SelectedTask
	XORWF	_SelectedTask, W, B
	BNZ	_00189_DS_
	BRA	_00179_DS_
_00188_DS_:
_00189_DS_:
	MOVFF _STKPTR, _FSR0L 
_00170_DS_:
	MOVF	_STKPTR, W
	BZ	_00172_DS_
	MOVFF _TOSL, _PREINC1 
	MOVFF _TOSH, _PREINC1 
	MOVFF _TOSU, _PREINC1 
	POP 
	BRA	_00170_DS_
_00172_DS_:
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
_00173_DS_:
	MOVF	_FSR0L, W
	SUBWF	_STKPTR, W
	BC	_00179_DS_
	PUSH 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSU, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSH, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSL, 0 
	BRA	_00173_DS_
_00179_DS_:
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
S_serial__SerialRxHandler	code
_SerialRxHandler:
;	.line	122; drivers/serial.c	void SerialRxHandler(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	127; drivers/serial.c	caracter = RCREG;
	MOVFF	_RCREG, r0x00
;	.line	130; drivers/serial.c	if( RCSTAbits.OERR )
	BTFSS	_RCSTAbits, 1
	BRA	_00157_DS_
;	.line	132; drivers/serial.c	RCSTAbits.CREN = 0;
	BCF	_RCSTAbits, 4
;	.line	133; drivers/serial.c	RCSTAbits.CREN = 1;
	BSF	_RCSTAbits, 4
_00157_DS_:
;	.line	136; drivers/serial.c	if (OSQueuePost(QSerialRX,caracter) == BUFFER_UNDERRUN)
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	BANKSEL	(_QSerialRX + 2)
	MOVF	(_QSerialRX + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_QSerialRX + 1)
	MOVF	(_QSerialRX + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_QSerialRX
	MOVF	_QSerialRX, W, B
	MOVWF	POSTDEC1
	CALL	_OSQueuePost
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00160_DS_
_00165_DS_:
	BANKSEL	(_QSerialRX + 2)
;	.line	139; drivers/serial.c	(void)OSCleanQueue(QSerialRX);
	MOVF	(_QSerialRX + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_QSerialRX + 1)
	MOVF	(_QSerialRX + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_QSerialRX
	MOVF	_QSerialRX, W, B
	MOVWF	POSTDEC1
	CALL	_OSCleanQueue
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
_00160_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_serial__Serial_Envia_Frase	code
_Serial_Envia_Frase:
;	.line	112; drivers/serial.c	void Serial_Envia_Frase(char *string)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
_00148_DS_:
;	.line	114; drivers/serial.c	while(*string)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	BZ	_00151_DS_
;	.line	116; drivers/serial.c	Serial_Envia_Caracter(*string);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_Serial_Envia_Caracter
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	117; drivers/serial.c	string++;
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BRA	_00148_DS_
_00151_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_serial__Serial_Envia_Caracter	code
_Serial_Envia_Caracter:
;	.line	90; drivers/serial.c	void Serial_Envia_Caracter(CHAR8 newdata)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
_00130_DS_:
;	.line	92; drivers/serial.c	while (OSWQueue(&SerialTXBuffer, (INT8U)newdata) == BUFFER_UNDERRUN)
	MOVLW	HIGH(_SerialTXBuffer)
	MOVWF	r0x02
	MOVLW	LOW(_SerialTXBuffer)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_OSWQueue
	MOVWF	r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00132_DS_
;	.line	94; drivers/serial.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	95; drivers/serial.c	WaitingSerialTXBuffer = 1;
	MOVLW	0x01
	BANKSEL	_WaitingSerialTXBuffer
	MOVWF	_WaitingSerialTXBuffer, B
;	.line	96; drivers/serial.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	97; drivers/serial.c	(void)OSSemPend(SerialTX,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_SerialTX + 2)
	MOVF	(_SerialTX + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SerialTX + 1)
	MOVF	(_SerialTX + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SerialTX
	MOVF	_SerialTX, W, B
	MOVWF	POSTDEC1
	CALL	_OSSemPend
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00130_DS_
_00132_DS_:
;	.line	100; drivers/serial.c	OSEnterCritical();
	BCF	_INTCONbits, 7
	BANKSEL	_WaitingSerialTXBuffer
;	.line	101; drivers/serial.c	WaitingSerialTXBuffer = 0;
	CLRF	_WaitingSerialTXBuffer, B
;	.line	102; drivers/serial.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	104; drivers/serial.c	if (PIE1bits.TXIE != 1)
	CLRF	r0x00
	BTFSC	_PIE1bits, 4
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00135_DS_
;	.line	106; drivers/serial.c	PIE1bits.TXIE = 1;
	BSF	_PIE1bits, 4
_00135_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_serial__Serial_Init	code
_Serial_Init:
;	.line	22; drivers/serial.c	void Serial_Init(unsigned int baudrate, INT8U priority)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
;	.line	28; drivers/serial.c	ulBaud = configCPU_CLOCK_HZ / baudrate;
	CLRF	r0x03
	CLRF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0x48
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	29; drivers/serial.c	ulBaud /= (INT32U) 16;
	MOVLW	0xf0
	ANDWF	r0x00, F
	SWAPF	r0x00, F
	SWAPF	r0x01, F
	ANDWF	r0x01, W
	XORWF	r0x01, F
	ADDWF	r0x00, F
	MOVF	r0x03, W
	SWAPF	WREG, W
	ANDLW	0xf0
	IORWF	r0x01, F
	MOVLW	0xf0
	ANDWF	r0x03, F
	SWAPF	r0x03, F
	SWAPF	r0x04, F
	ANDWF	r0x04, W
	XORWF	r0x04, F
	ADDWF	r0x03, F
;	.line	30; drivers/serial.c	ulBaud -= (INT32U) 1;
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
;	.line	34; drivers/serial.c	TXSTA = 0;
	CLRF	_TXSTA
;	.line	35; drivers/serial.c	RCSTA = 0;
	CLRF	_RCSTA
;	.line	38; drivers/serial.c	SPBRG = (INT8U) ulBaud;
	MOVF	r0x00, W
	MOVWF	_SPBRG
;	.line	41; drivers/serial.c	TRISCbits.TRISC6 = 0;
	BCF	_TRISCbits, 6
;	.line	42; drivers/serial.c	TRISCbits.TRISC7 = 1;
	BSF	_TRISCbits, 7
;	.line	45; drivers/serial.c	TXSTAbits.BRGH = 1;
	BSF	_TXSTAbits, 2
;	.line	46; drivers/serial.c	TXSTAbits.TXEN=1;
	BSF	_TXSTAbits, 5
;	.line	49; drivers/serial.c	RCSTAbits.SPEN = 1;
	BSF	_RCSTAbits, 7
;	.line	50; drivers/serial.c	RCSTAbits.CREN = 1;
	BSF	_RCSTAbits, 4
;	.line	54; drivers/serial.c	PIE1bits.RCIE = 1;
	BSF	_PIE1bits, 5
;	.line	59; drivers/serial.c	if (OSMutexCreate(&SerialResource,priority) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_SerialResource)
	MOVWF	r0x01
	MOVLW	LOW(_SerialResource)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OSMutexCreate
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00109_DS_
_00106_DS_:
;	.line	63; drivers/serial.c	while(1){};
	BRA	_00106_DS_
_00109_DS_:
;	.line	66; drivers/serial.c	if (OSQueueCreate(&SerialTXBuffer,64,&QSerialTX) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_SerialTXBuffer)
	MOVWF	r0x01
	MOVLW	LOW(_SerialTXBuffer)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_QSerialTX)
	MOVWF	r0x04
	MOVLW	LOW(_QSerialTX)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OSQueueCreate
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00114_DS_
_00111_DS_:
;	.line	70; drivers/serial.c	while(1){};
	BRA	_00111_DS_
_00114_DS_:
;	.line	73; drivers/serial.c	if (OSQueueCreate(&SerialRXBuffer,64,&QSerialRX) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_SerialRXBuffer)
	MOVWF	r0x01
	MOVLW	LOW(_SerialRXBuffer)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_QSerialRX)
	MOVWF	r0x04
	MOVLW	LOW(_QSerialRX)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_OSQueueCreate
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00119_DS_
_00116_DS_:
;	.line	77; drivers/serial.c	while(1){};
	BRA	_00116_DS_
_00119_DS_:
;	.line	80; drivers/serial.c	if (OSSemCreate(0, &SerialTX) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_SerialTX)
	MOVWF	r0x01
	MOVLW	LOW(_SerialTX)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_OSSemCreate
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00125_DS_
_00121_DS_:
;	.line	84; drivers/serial.c	while(1){};
	BRA	_00121_DS_
_00125_DS_:
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
; code size:	 1792 (0x0700) bytes ( 1.37%)
;           	  896 (0x0380) words
; udata size:	   51 (0x0033) bytes ( 3.98%)
; access size:	    6 (0x0006) bytes


	end
