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
	global _OSUpdateTime
	global _OSUpdateUptime
	global _OSUpdateDate
	global _OSResetTime
	global _OSResetDate
	global _OSUptime
	global _OSUpDate
	global _Hora
	global _Data

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern __gptrget2
	extern __gptrput2
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
	extern _PriorityMask
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
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

udata_OS_RTC_0	udata
_Hora	res	3

udata_OS_RTC_1	udata
_Data	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_OS_RTC__OSUpDate	code
_OSUpDate:
;	.line	296; brtos/OS_RTC.c	OSDate* OSUpDate(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	298; brtos/OS_RTC.c	return &Data;
	MOVLW	HIGH(_Data)
	MOVWF	r0x01
	MOVLW	LOW(_Data)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_OS_RTC__OSUptime	code
_OSUptime:
;	.line	276; brtos/OS_RTC.c	OSTime* OSUptime(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	278; brtos/OS_RTC.c	return &Hora;
	MOVLW	HIGH(_Hora)
	MOVWF	r0x01
	MOVLW	LOW(_Hora)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_OS_RTC__OSResetDate	code
_OSResetDate:
;	.line	241; brtos/OS_RTC.c	void OSResetDate(OSDate *Ptr_Dia)
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
	BANKSEL	_iNesting
;	.line	246; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00196_DS_
;	.line	248; brtos/OS_RTC.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00196_DS_:
;	.line	250; brtos/OS_RTC.c	Ptr_Dia->RTC_Day = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	251; brtos/OS_RTC.c	Ptr_Dia->RTC_Month = 0;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	252; brtos/OS_RTC.c	Ptr_Dia->RTC_Year = 0;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
	BANKSEL	_iNesting
;	.line	255; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00199_DS_
;	.line	257; brtos/OS_RTC.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00199_DS_:
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
S_OS_RTC__OSResetTime	code
_OSResetTime:
;	.line	206; brtos/OS_RTC.c	void OSResetTime(OSTime *Ptr_Hora)
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
	BANKSEL	_iNesting
;	.line	211; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00187_DS_
;	.line	213; brtos/OS_RTC.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00187_DS_:
;	.line	215; brtos/OS_RTC.c	(Ptr_Hora->RTC_Second) = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	216; brtos/OS_RTC.c	(Ptr_Hora->RTC_Minute) = 0;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	217; brtos/OS_RTC.c	(Ptr_Hora->RTC_Hour) = 0;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_iNesting
;	.line	220; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00190_DS_
;	.line	222; brtos/OS_RTC.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00190_DS_:
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
S_OS_RTC__OSUpdateDate	code
_OSUpdateDate:
;	.line	157; brtos/OS_RTC.c	void OSUpdateDate(OSDate *Ptr_Dia)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	BANKSEL	_iNesting
;	.line	162; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00160_DS_
;	.line	164; brtos/OS_RTC.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00160_DS_:
;	.line	166; brtos/OS_RTC.c	Ptr_Dia -> RTC_Day++;    
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	168; brtos/OS_RTC.c	if (Ptr_Dia -> RTC_Day == 30){ 
	MOVF	r0x03, W
	XORLW	0x1e
	BZ	_00177_DS_
	BRA	_00166_DS_
_00177_DS_:
;	.line	171; brtos/OS_RTC.c	Ptr_Dia -> RTC_Day = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	172; brtos/OS_RTC.c	Ptr_Dia -> RTC_Month++;
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
	INCF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	174; brtos/OS_RTC.c	if (Ptr_Dia -> RTC_Month == 12){
	MOVF	r0x06, W
	XORLW	0x0c
	BNZ	_00166_DS_
;	.line	176; brtos/OS_RTC.c	Ptr_Dia -> RTC_Month = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	177; brtos/OS_RTC.c	Ptr_Dia -> RTC_Year++;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	179; brtos/OS_RTC.c	if (Ptr_Dia -> RTC_Year == 9999){    // ano m�ximo 9999    
	MOVF	r0x03, W
	XORLW	0x0f
	BNZ	_00180_DS_
	MOVF	r0x04, W
	XORLW	0x27
	BZ	_00181_DS_
_00180_DS_:
	BRA	_00166_DS_
_00181_DS_:
;	.line	181; brtos/OS_RTC.c	Ptr_Dia -> RTC_Year = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
_00166_DS_:
	BANKSEL	_iNesting
;	.line	185; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00169_DS_
;	.line	187; brtos/OS_RTC.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00169_DS_:
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
S_OS_RTC__OSUpdateUptime	code
_OSUpdateUptime:
;	.line	108; brtos/OS_RTC.c	void OSUpdateUptime(OSTime *Ptr_Hora,OSDate *Ptr_Dia)
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
;	.line	113; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00133_DS_
;	.line	115; brtos/OS_RTC.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00133_DS_:
;	.line	117; brtos/OS_RTC.c	Ptr_Hora -> RTC_Second++;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	119; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Second == 60){
	MOVF	r0x06, W
	XORLW	0x3c
	BZ	_00150_DS_
	BRA	_00139_DS_
_00150_DS_:
;	.line	121; brtos/OS_RTC.c	Ptr_Hora -> RTC_Second = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	122; brtos/OS_RTC.c	Ptr_Hora -> RTC_Minute++;
	MOVF	r0x00, W
	ADDLW	0x01
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
	MOVWF	r0x09
	INCF	r0x09, F
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	124; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Minute == 60){
	MOVF	r0x09, W
	XORLW	0x3c
	BZ	_00152_DS_
	BRA	_00139_DS_
_00152_DS_:
;	.line	126; brtos/OS_RTC.c	Ptr_Hora -> RTC_Minute = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	127; brtos/OS_RTC.c	Ptr_Hora -> RTC_Hour++;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	129; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Hour == 24){
	MOVF	r0x06, W
	XORLW	0x18
	BNZ	_00139_DS_
;	.line	131; brtos/OS_RTC.c	Ptr_Hora -> RTC_Hour = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	132; brtos/OS_RTC.c	Ptr_Dia -> RTC_Day++;
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x00
	INCF	r0x00, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
_00139_DS_:
	BANKSEL	_iNesting
;	.line	137; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00142_DS_
;	.line	139; brtos/OS_RTC.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00142_DS_:
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
S_OS_RTC__OSUpdateTime	code
_OSUpdateTime:
;	.line	59; brtos/OS_RTC.c	void OSUpdateTime(OSTime *Ptr_Hora)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	BANKSEL	_iNesting
;	.line	64; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00106_DS_
;	.line	66; brtos/OS_RTC.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00106_DS_:
;	.line	68; brtos/OS_RTC.c	Ptr_Hora -> RTC_Second++;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	70; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Second == 60){
	MOVF	r0x03, W
	XORLW	0x3c
	BZ	_00123_DS_
	BRA	_00112_DS_
_00123_DS_:
;	.line	72; brtos/OS_RTC.c	Ptr_Hora -> RTC_Second = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	73; brtos/OS_RTC.c	Ptr_Hora -> RTC_Minute++;
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
	INCF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	75; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Minute == 60){
	MOVF	r0x06, W
	XORLW	0x3c
	BNZ	_00112_DS_
;	.line	77; brtos/OS_RTC.c	Ptr_Hora -> RTC_Minute = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	78; brtos/OS_RTC.c	Ptr_Hora -> RTC_Hour++;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	80; brtos/OS_RTC.c	if (Ptr_Hora -> RTC_Hour == 24){
	MOVF	r0x03, W
	XORLW	0x18
	BNZ	_00112_DS_
;	.line	82; brtos/OS_RTC.c	Ptr_Hora -> RTC_Hour = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00112_DS_:
	BANKSEL	_iNesting
;	.line	87; brtos/OS_RTC.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00115_DS_
;	.line	89; brtos/OS_RTC.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00115_DS_:
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
; code size:	 1620 (0x0654) bytes ( 1.24%)
;           	  810 (0x032a) words
; udata size:	    7 (0x0007) bytes ( 0.55%)
; access size:	   10 (0x000a) bytes


	end
