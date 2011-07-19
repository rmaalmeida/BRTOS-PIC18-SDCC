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
	global _SemTeste
	global _main

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
	extern _InstallTask
	extern _BRTOSStart
	extern _BRTOS_Init
	extern _OSSemCreate
	extern _System_Time
	extern _Task_2
	extern _Task_3
	extern _Task_Serial
	extern _Task_LCD
	extern _Serial_Init
	extern _PriorityMask
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
POSTDEC1	equ	0xfe5


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1

udata_main_0	udata
_SemTeste	res	3

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	13; main.c	OSCCONbits.IDLEN = 1;
	BSF	_OSCCONbits, 7
;	.line	16; main.c	BRTOS_Init(); 
	CALL	_BRTOS_Init
;	.line	18; main.c	Serial_Init(57600,3); 
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe1
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_Serial_Init
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	20; main.c	if (OSSemCreate(0,&SemTeste) != ALLOC_EVENT_OK)
	MOVLW	HIGH(_SemTeste)
	MOVWF	r0x01
	MOVLW	LOW(_SemTeste)
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
	BZ	_00109_DS_
_00106_DS_:
;	.line	24; main.c	while(1){};
	BRA	_00106_DS_
_00109_DS_:
;	.line	28; main.c	if(InstallTask(&System_Time,(const CHAR8 *)"System Time",90,6) != OK)
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x5a
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	UPPER(_System_Time)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_System_Time)
	MOVWF	POSTDEC1
	MOVLW	LOW(_System_Time)
	MOVWF	POSTDEC1
	CALL	_InstallTask
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00114_DS_
_00111_DS_:
;	.line	32; main.c	while(1){};
	BRA	_00111_DS_
_00114_DS_:
;	.line	37; main.c	if(InstallTask(&Task_2,(const CHAR8 *)"Tarefa Teste 1",83,4) != OK)
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x53
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	UPPER(_Task_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Task_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Task_2)
	MOVWF	POSTDEC1
	CALL	_InstallTask
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00119_DS_
_00116_DS_:
;	.line	41; main.c	while(1){};
	BRA	_00116_DS_
_00119_DS_:
;	.line	44; main.c	if(InstallTask(&Task_3,(const CHAR8 *)"Tarefa Teste 2",83,5) != OK)
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x53
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVLW	UPPER(_Task_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Task_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Task_3)
	MOVWF	POSTDEC1
	CALL	_InstallTask
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00124_DS_
_00121_DS_:
;	.line	48; main.c	while(1){};
	BRA	_00121_DS_
_00124_DS_:
;	.line	52; main.c	if(InstallTask(&Task_Serial,(const CHAR8 *)"Tarefa Serial",128,2) != OK)
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVLW	UPPER(_Task_Serial)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Task_Serial)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Task_Serial)
	MOVWF	POSTDEC1
	CALL	_InstallTask
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00129_DS_
_00126_DS_:
;	.line	56; main.c	while(1){};
	BRA	_00126_DS_
_00129_DS_:
;	.line	60; main.c	if(InstallTask(&Task_LCD,(const CHAR8 *)"Tarefa LCD",128,1) != OK)
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	MOVLW	UPPER(_Task_LCD)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Task_LCD)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Task_LCD)
	MOVWF	POSTDEC1
	CALL	_InstallTask
	MOVWF	r0x00
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00134_DS_
_00131_DS_:
;	.line	64; main.c	while(1){};
	BRA	_00131_DS_
_00134_DS_:
;	.line	68; main.c	if(BRTOSStart() != OK)
	CALL	_BRTOSStart
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00141_DS_
_00136_DS_:
;	.line	72; main.c	while(1){};
	BRA	_00136_DS_
_00141_DS_:
	BRA	_00141_DS_
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x53, 0x79, 0x73, 0x74, 0x65, 0x6d, 0x20, 0x54, 0x69, 0x6d, 0x65, 0x00
; ; Starting pCode block
__str_1:
	DB	0x54, 0x61, 0x72, 0x65, 0x66, 0x61, 0x20, 0x54, 0x65, 0x73, 0x74, 0x65
	DB	0x20, 0x31, 0x00
; ; Starting pCode block
__str_2:
	DB	0x54, 0x61, 0x72, 0x65, 0x66, 0x61, 0x20, 0x54, 0x65, 0x73, 0x74, 0x65
	DB	0x20, 0x32, 0x00
; ; Starting pCode block
__str_3:
	DB	0x54, 0x61, 0x72, 0x65, 0x66, 0x61, 0x20, 0x53, 0x65, 0x72, 0x69, 0x61
	DB	0x6c, 0x00
; ; Starting pCode block
__str_4:
	DB	0x54, 0x61, 0x72, 0x65, 0x66, 0x61, 0x20, 0x4c, 0x43, 0x44, 0x00


; Statistics:
; code size:	  390 (0x0186) bytes ( 0.30%)
;           	  195 (0x00c3) words
; udata size:	    3 (0x0003) bytes ( 0.23%)
; access size:	    3 (0x0003) bytes


	end
