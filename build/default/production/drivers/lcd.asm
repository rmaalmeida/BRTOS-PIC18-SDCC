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
	global _task_LCD
	global _testa_bit
	global _LCD
	global _acquireLCD
	global _releaseLCD
	global _write_lcd
	global _write_numero
	global _instr
	global _caractere
	global _init_lcd
	global _init_lcd_resource
	global _posiciona
	global _limpa_lcd

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
	extern _DelayTask
	extern _OSMutexCreate
	extern _OSMutexAcquire
	extern _OSMutexRelease
	extern __divuint
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


	idata
_task_LCD	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1

udata_lcd_0	udata
_LCD	res	3

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_lcd__testa_bit	code
_testa_bit:
;	.line	313; drivers/lcd.c	void testa_bit(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	315; drivers/lcd.c	DelayTask(2);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__limpa_lcd	code
_limpa_lcd:
;	.line	282; drivers/lcd.c	void limpa_lcd(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	285; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	286; drivers/lcd.c	RS = 0;
	BCF	_LATEbits, 2
;	.line	288; drivers/lcd.c	dados = 0x01;
	MOVLW	0x01
	MOVWF	_LATD
;	.line	289; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	307; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__posiciona	code
_posiciona:
;	.line	241; drivers/lcd.c	void posiciona(INT8U linha, INT8U coluna)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
;	.line	243; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	244; drivers/lcd.c	RS = 0;
	BCF	_LATEbits, 2
;	.line	246; drivers/lcd.c	switch(linha){
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00153_DS_
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00154_DS_
	BRA	_00155_DS_
_00153_DS_:
;	.line	248; drivers/lcd.c	coluna--;
	DECF	r0x01, F
;	.line	249; drivers/lcd.c	dados = 0x80 + coluna;
	MOVLW	0x80
	ADDWF	r0x01, W
	MOVWF	_LATD
;	.line	250; drivers/lcd.c	break;
	BRA	_00156_DS_
_00154_DS_:
;	.line	252; drivers/lcd.c	coluna--;
	DECF	r0x01, F
;	.line	253; drivers/lcd.c	dados = 0xC0 + coluna;
	MOVLW	0xc0
	ADDWF	r0x01, W
	MOVWF	_LATD
;	.line	254; drivers/lcd.c	break;
	BRA	_00156_DS_
_00155_DS_:
;	.line	256; drivers/lcd.c	return;
	BRA	_00157_DS_
_00156_DS_:
;	.line	258; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	276; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
_00157_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__init_lcd_resource	code
_init_lcd_resource:
;	.line	226; drivers/lcd.c	void init_lcd_resource(INT8U priority)
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
;	.line	231; drivers/lcd.c	if (OSMutexCreate(&LCD,priority) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_LCD)
	MOVWF	r0x02
	MOVLW	LOW(_LCD)
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
	CALL	_OSMutexCreate
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00148_DS_
_00144_DS_:
;	.line	235; drivers/lcd.c	while(1){};
	BRA	_00144_DS_
_00148_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__init_lcd	code
_init_lcd:
;	.line	206; drivers/lcd.c	void init_lcd(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	207; drivers/lcd.c	dados = 0;
	CLRF	_LATD
;	.line	208; drivers/lcd.c	direcao = 0;
	CLRF	_TRISD
;	.line	209; drivers/lcd.c	controle = 0;
	CLRF	_LATE
;	.line	210; drivers/lcd.c	controle_dir = ~0x06;
	MOVLW	0xf9
	MOVWF	_TRISE
;	.line	211; drivers/lcd.c	instr(0x38);
	MOVLW	0x38
	MOVWF	POSTDEC1
	CALL	_instr
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	212; drivers/lcd.c	DelayTask(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	213; drivers/lcd.c	instr(0x38);
	MOVLW	0x38
	MOVWF	POSTDEC1
	CALL	_instr
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	214; drivers/lcd.c	DelayTask(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	215; drivers/lcd.c	instr(0x06);
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_instr
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	216; drivers/lcd.c	DelayTask(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	217; drivers/lcd.c	instr(0x0c);
	MOVLW	0x0c
	MOVWF	POSTDEC1
	CALL	_instr
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	218; drivers/lcd.c	DelayTask(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	219; drivers/lcd.c	instr(0x01);  
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_instr
	INCF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	220; drivers/lcd.c	DelayTask(20);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x14
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__caractere	code
_caractere:
;	.line	174; drivers/lcd.c	void caractere(char dado)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
;	.line	177; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	178; drivers/lcd.c	RS = 1;
	BSF	_LATEbits, 2
;	.line	180; drivers/lcd.c	dados = dado;
	MOVFF	r0x00, _LATD
;	.line	181; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	199; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__instr	code
_instr:
;	.line	146; drivers/lcd.c	void instr(char comando){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
;	.line	147; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	148; drivers/lcd.c	RS = 0;
	BCF	_LATEbits, 2
;	.line	150; drivers/lcd.c	dados = comando;
	MOVFF	r0x00, _LATD
;	.line	151; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	169; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__write_numero	code
_write_numero:
;	.line	90; drivers/lcd.c	void write_numero(unsigned int numero)
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
;	.line	94; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	95; drivers/lcd.c	RS = 1;
	BSF	_LATEbits, 2
;	.line	97; drivers/lcd.c	i = (numero / 10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divuint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	98; drivers/lcd.c	dados = 48 + (unsigned char)i;
	MOVLW	0x30
	ADDWF	r0x02, W
	MOVWF	_LATD
;	.line	99; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	117; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
;	.line	119; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	120; drivers/lcd.c	RS = 1;
	BSF	_LATEbits, 2
; ;multiply lit val:0x0a by variable r0x02 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	122; drivers/lcd.c	dados = 48 + (unsigned char)(numero - (unsigned int)(i * 10));
	MOVF	r0x02, W
	MULLW	0x0a
	MOVFF	PRODL, r0x02
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVLW	0x30
	ADDWF	r0x00, W
	MOVWF	_LATD
;	.line	123; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	141; drivers/lcd.c	E = 0;   
	BCF	_LATEbits, 1
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__write_lcd	code
_write_lcd:
;	.line	54; drivers/lcd.c	void write_lcd(char *string){
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
_00115_DS_:
;	.line	56; drivers/lcd.c	while(*string)
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	BZ	_00118_DS_
;	.line	58; drivers/lcd.c	testa_bit();
	CALL	_testa_bit
;	.line	59; drivers/lcd.c	RS = 1;
	BSF	_LATEbits, 2
;	.line	61; drivers/lcd.c	dados = *string;
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	_LATD
;	.line	62; drivers/lcd.c	E = 1;
	BSF	_LATEbits, 1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
;	.line	82; drivers/lcd.c	E = 0;
	BCF	_LATEbits, 1
;	.line	83; drivers/lcd.c	string++;
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BRA	_00115_DS_
_00118_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__releaseLCD	code
_releaseLCD:
;	.line	47; drivers/lcd.c	INT8U releaseLCD(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_LCD + 2)
;	.line	50; drivers/lcd.c	return OSMutexRelease (LCD);
	MOVF	(_LCD + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_LCD + 1)
	MOVF	(_LCD + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_LCD
	MOVF	_LCD, W, B
	MOVWF	POSTDEC1
	CALL	_OSMutexRelease
	MOVWF	r0x00
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_lcd__acquireLCD	code
_acquireLCD:
;	.line	40; drivers/lcd.c	void acquireLCD(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_LCD + 2)
;	.line	43; drivers/lcd.c	OSMutexAcquire(LCD);
	MOVF	(_LCD + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_LCD + 1)
	MOVF	(_LCD + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_LCD
	MOVF	_LCD, W, B
	MOVWF	POSTDEC1
	CALL	_OSMutexAcquire
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	



; Statistics:
; code size:	 1242 (0x04da) bytes ( 0.95%)
;           	  621 (0x026d) words
; udata size:	    3 (0x0003) bytes ( 0.23%)
; access size:	    4 (0x0004) bytes


	end
