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
	global _System_Time
	global _Task_2
	global _Task_3
	global _Task_Serial
	global _Task_LCD
	global _BufferLCD

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern _SemTeste
	extern _QSerialRX
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
	extern _OSResetTime
	extern _OSResetDate
	extern _OSUpdateUptime
	extern _DelayTask
	extern _OSSemPend
	extern _OSSemPost
	extern _write_lcd
	extern _write_numero
	extern _init_lcd
	extern _posiciona
	extern _InicializaAD
	extern _LeValorAD
	extern _PriorityMask
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1

udata_tasks_0	udata
_Task_Serial_pedido_1_1	res	1

udata_tasks_1	udata
_BufferLCD	res	17

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_tasks__Task_LCD	code
_Task_LCD:
;	.line	180; tasks.c	void Task_LCD(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	184; tasks.c	init_lcd();
	CALL	_init_lcd
;	.line	187; tasks.c	BufferLCD[0] = 0xE4;
	MOVLW	0xe4
	BANKSEL	_BufferLCD
	MOVWF	_BufferLCD, B
;	.line	189; tasks.c	write_lcd(BufferLCD);
	MOVLW	HIGH(_BufferLCD)
	MOVWF	r0x01
	MOVLW	LOW(_BufferLCD)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_write_lcd
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	191; tasks.c	posiciona(2, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_posiciona
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	193; tasks.c	write_lcd(BufferLCD);
	MOVLW	HIGH(_BufferLCD)
	MOVWF	r0x01
	MOVLW	LOW(_BufferLCD)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_write_lcd
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	196; tasks.c	TRISA = 0xFF;   
	MOVLW	0xff
	MOVWF	_TRISA
;	.line	198; tasks.c	InicializaAD();
	CALL	_InicializaAD
;	.line	201; tasks.c	LATCbits.LATC5 = 1;
	BSF	_LATCbits, 5
;	.line	202; tasks.c	TRISCbits.TRISC5 = 0;
	BCF	_TRISCbits, 5
;	.line	205; tasks.c	LATCbits.LATC2 = 0;
	BCF	_LATCbits, 2
;	.line	206; tasks.c	TRISCbits.TRISC2 = 0;
	BCF	_TRISCbits, 2
;	.line	208; tasks.c	uiValorAD = LeValorAD();
	CALL	_LeValorAD
_00163_DS_:
;	.line	215; tasks.c	uiValorAD = LeValorAD();
	CALL	_LeValorAD
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
;	.line	217; tasks.c	if (uiValorAD >= 30)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00169_DS_
	MOVLW	0x1e
	SUBWF	r0x00, W
_00169_DS_:
	BNC	_00160_DS_
;	.line	220; tasks.c	LATCbits.LATC2 = 1;    
	BSF	_LATCbits, 2
;	.line	222; tasks.c	LATCbits.LATC5 = 0;
	BCF	_LATCbits, 5
	BRA	_00161_DS_
_00160_DS_:
;	.line	226; tasks.c	LATCbits.LATC2 = 0;    
	BCF	_LATCbits, 2
;	.line	228; tasks.c	LATCbits.LATC5 = 1;
	BSF	_LATCbits, 5
_00161_DS_:
;	.line	231; tasks.c	posiciona(2, 7);
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_posiciona
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	232; tasks.c	write_numero(uiValorAD);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_write_numero
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	234; tasks.c	BufferLCD[0]=0xDF;
	MOVLW	0xdf
	BANKSEL	_BufferLCD
	MOVWF	_BufferLCD, B
;	.line	235; tasks.c	BufferLCD[1]='C';
	MOVLW	0x43
	BANKSEL	(_BufferLCD + 1)
	MOVWF	(_BufferLCD + 1), B
	BANKSEL	(_BufferLCD + 2)
;	.line	236; tasks.c	BufferLCD[2]=0;
	CLRF	(_BufferLCD + 2), B
;	.line	237; tasks.c	write_lcd(BufferLCD);
	MOVLW	HIGH(_BufferLCD)
	MOVWF	r0x01
	MOVLW	LOW(_BufferLCD)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_write_lcd
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	239; tasks.c	DelayTask(1000);
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00163_DS_
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_tasks__Task_Serial	code
_Task_Serial:
;	.line	105; tasks.c	void Task_Serial(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	BANKSEL	_Task_Serial_pedido_1_1
;	.line	108; tasks.c	volatile INT8U pedido = 0;
	CLRF	_Task_Serial_pedido_1_1, B
_00152_DS_:
	BRA	_00152_DS_
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_tasks__Task_3	code
_Task_3:
;	.line	69; tasks.c	void Task_3(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	72; tasks.c	INT8U seq1 = 0x08;
	MOVLW	0x08
	MOVWF	r0x00
;	.line	73; tasks.c	INT8U sent1 = 0;
	CLRF	r0x01
;	.line	75; tasks.c	LATB = 0;    
	CLRF	_LATB
;	.line	76; tasks.c	TRISB = 0;
	CLRF	_TRISB
_00135_DS_:
;	.line	81; tasks.c	LATB=seq1;
	MOVFF	r0x00, _LATB
;	.line	84; tasks.c	if(sent1==0){ seq1<<=1;
	MOVF	r0x01, W
	BNZ	_00132_DS_
	BCF	STATUS, 0
	RLCF	r0x00, F
;	.line	87; tasks.c	if(seq1==0x80) sent1=1;
	MOVF	r0x00, W
	XORLW	0x80
	BNZ	_00133_DS_
	MOVLW	0x01
	MOVWF	r0x01
	BRA	_00133_DS_
_00132_DS_:
;	.line	90; tasks.c	else{ seq1>>=1;
	BCF	STATUS, 0
	RRCF	r0x00, F
;	.line	93; tasks.c	if(seq1==0x01) sent1=0;
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00133_DS_
	CLRF	r0x01
_00133_DS_:
;	.line	96; tasks.c	(void)OSSemPend(SemTeste,0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_SemTeste + 2)
	MOVF	(_SemTeste + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SemTeste + 1)
	MOVF	(_SemTeste + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SemTeste
	MOVF	_SemTeste, W, B
	MOVWF	POSTDEC1
	CALL	_OSSemPend
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00135_DS_
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_tasks__Task_2	code
_Task_2:
;	.line	49; tasks.c	void Task_2(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
; ;;!!! pic16_aopOp:1071 called for a spillLocation -- assigning WREG instead --- CHECK
;	.line	52; tasks.c	INT8U cont = 0;   
	CLRF	WREG
_00120_DS_:
;	.line	58; tasks.c	(void)DelayTask(35);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x23
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BANKSEL	(_SemTeste + 2)
;	.line	61; tasks.c	(void)OSSemPost(SemTeste);
	MOVF	(_SemTeste + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_SemTeste + 1)
	MOVF	(_SemTeste + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_SemTeste
	MOVF	_SemTeste, W, B
	MOVWF	POSTDEC1
	CALL	_OSSemPost
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00120_DS_
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_tasks__System_Time	code
_System_Time:
;	.line	22; tasks.c	void System_Time(void)
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
;	.line	25; tasks.c	INT8U i = 0;
	CLRF	r0x00
;	.line	26; tasks.c	OSResetTime(&Hora); 
	MOVLW	HIGH(_Hora)
	MOVWF	r0x02
	MOVLW	LOW(_Hora)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_OSResetTime
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	27; tasks.c	OSResetDate(&Data);  
	MOVLW	HIGH(_Data)
	MOVWF	r0x02
	MOVLW	LOW(_Data)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_OSResetDate
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
_00108_DS_:
	CLRWDT
	
;	.line	37; tasks.c	(void)DelayTask(10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	38; tasks.c	i++;
	INCF	r0x00, F
;	.line	39; tasks.c	if (i >= 100)
	MOVLW	0x64
	SUBWF	r0x00, W
	BNC	_00108_DS_
;	.line	41; tasks.c	OSUpdateUptime(&Hora,&Data);
	MOVLW	HIGH(_Hora)
	MOVWF	r0x02
	MOVLW	LOW(_Hora)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	HIGH(_Data)
	MOVWF	r0x05
	MOVLW	LOW(_Data)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
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
	CALL	_OSUpdateUptime
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	42; tasks.c	i = 0;
	CLRF	r0x00
	BRA	_00108_DS_
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
; code size:	  810 (0x032a) bytes ( 0.62%)
;           	  405 (0x0195) words
; udata size:	   18 (0x0012) bytes ( 1.41%)
; access size:	    7 (0x0007) bytes


	end
