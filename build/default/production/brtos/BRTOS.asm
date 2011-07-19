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
	global _QUEUE_STACK
	global _LastOSDuty
	global _SelectedTask
	global _iQueueAddress
	global _BufferText
	global _version
	global _OSSchedule
	global _DelayTask
	global _DelayTaskHMSM
	global _OS_TICK_HANDLER
	global _BRTOSStart
	global _PreInstallTasks
	global _BlockPriority
	global _UnBlockPriority
	global _BlockTask
	global _UnBlockTask
	global _BlockMultipleTask
	global _UnBlockMultipleTask
	global _Idle
	global _InstallTask
	global _InstallIdle
	global _BRTOS_Init
	global _initEvents
	global _SAScheduler
	global _PriorityVector
	global _iStackAddress
	global _StackAddress
	global _NumberOfInstalledTasks
	global _currentTask
	global _OSReadyList
	global _OSBlockedList
	global _counter
	global _OSDuty
	global _OSDutyTmp
	global _DutyCnt
	global _TaskAlloc
	global _iNesting
	global _Tail
	global _Head
	global _BRTOS_Sem_Table
	global _BRTOS_Mutex_Table
	global _BRTOS_Queue_Table
	global _STACK
	global _ContextTask
	global _PriorityMask

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput2
	extern __gptrput3
	extern __gptrget1
	extern __gptrget2
	extern __gptrget3
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
	extern _SPvalue
	extern _Hora
	extern _Data
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
	extern _CreateVirtualStack
	extern _TickTimerSetup
	extern _SwitchContext
	extern __mullong
	extern __divulong
	extern __modulong
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
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_version	db	LOW(__str_0), HIGH(__str_0), UPPER(__str_0)
_iStackAddress	db	0x00, 0x00
_iQueueAddress	db	0x00, 0x00
_StackAddress	db	0x00, 0x00
_OSReadyList	db	0x00, 0x00
_OSBlockedList	db	0xff, 0xff
_OSDuty	db	0x00, 0x00, 0x00, 0x00
_OSDutyTmp	db	0x00, 0x00, 0x00, 0x00
_LastOSDuty	db	0x00, 0x00
_DutyCnt	db	0x00, 0x00
_TaskAlloc	db	0x00, 0x00, 0x00, 0x00
_iNesting	db	0x00


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

udata_BRTOS_0	udata
_BufferText	res	32

udata_BRTOS_1	udata
_SelectedTask	res	1

udata_BRTOS_2	udata
_QUEUE_STACK	res	128

udata_BRTOS_3	udata
_PriorityVector	res	16

udata_BRTOS_4	udata
_Tail	res	3

udata_BRTOS_5	udata
_Head	res	3

udata_BRTOS_6	udata
_ContextTask	res	144

udata_BRTOS_7	udata
_currentTask	res	1

udata_BRTOS_8	udata
_counter	res	2

udata_BRTOS_9	udata
_NumberOfInstalledTasks	res	1

udata_BRTOS_10	udata
_STACK	res	128

udata_BRTOS_11	udata
_BRTOS_Sem_Table	res	10

udata_BRTOS_12	udata
_BRTOS_Mutex_Table	res	16

udata_BRTOS_13	udata
_BRTOS_Queue_Table	res	24

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_BRTOS__SAScheduler	code
_SAScheduler:
;	.line	1199; brtos/BRTOS.c	INT8U SAScheduler(PriorityType ReadyList)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
;	.line	1318; brtos/BRTOS.c	if (ReadyList > 0xFF)
	MOVLW	0x01
	SUBWF	r0x01, W
	BNZ	_00532_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00532_DS_:
	BTFSS	STATUS, 0
	BRA	_00513_DS_
;	.line	1320; brtos/BRTOS.c	if (ReadyList > 0xFFF)
	MOVLW	0x10
	SUBWF	r0x01, W
	BNZ	_00533_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00533_DS_:
	BNC	_00489_DS_
;	.line	1322; brtos/BRTOS.c	if (ReadyList > 0x3FFF)
	MOVLW	0x40
	SUBWF	r0x01, W
	BNZ	_00534_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00534_DS_:
	BNC	_00477_DS_
;	.line	1324; brtos/BRTOS.c	if (ReadyList > 0x7FFF)
	MOVLW	0x80
	SUBWF	r0x01, W
	BNZ	_00535_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00535_DS_:
	BNC	_00471_DS_
;	.line	1326; brtos/BRTOS.c	prio = 15;
	MOVLW	0x0f
	MOVWF	r0x02
	BRA	_00514_DS_
_00471_DS_:
;	.line	1330; brtos/BRTOS.c	prio = 14;
	MOVLW	0x0e
	MOVWF	r0x02
	BRA	_00514_DS_
_00477_DS_:
;	.line	1335; brtos/BRTOS.c	if (ReadyList > 0x1FFF)
	MOVLW	0x20
	SUBWF	r0x01, W
	BNZ	_00536_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00536_DS_:
	BNC	_00474_DS_
;	.line	1337; brtos/BRTOS.c	prio = 13; 
	MOVLW	0x0d
	MOVWF	r0x02
	BRA	_00514_DS_
_00474_DS_:
;	.line	1341; brtos/BRTOS.c	prio = 12;
	MOVLW	0x0c
	MOVWF	r0x02
	BRA	_00514_DS_
_00489_DS_:
;	.line	1347; brtos/BRTOS.c	if (ReadyList > 0x3FF)
	MOVLW	0x04
	SUBWF	r0x01, W
	BNZ	_00537_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00537_DS_:
	BNC	_00486_DS_
;	.line	1349; brtos/BRTOS.c	if (ReadyList > 0x7FF)
	MOVLW	0x08
	SUBWF	r0x01, W
	BNZ	_00538_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00538_DS_:
	BNC	_00480_DS_
;	.line	1351; brtos/BRTOS.c	prio = 11;
	MOVLW	0x0b
	MOVWF	r0x02
	BRA	_00514_DS_
_00480_DS_:
;	.line	1355; brtos/BRTOS.c	prio = 10;
	MOVLW	0x0a
	MOVWF	r0x02
	BRA	_00514_DS_
_00486_DS_:
;	.line	1360; brtos/BRTOS.c	if (ReadyList > 0x1FF)
	MOVLW	0x02
	SUBWF	r0x01, W
	BNZ	_00539_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00539_DS_:
	BNC	_00483_DS_
;	.line	1362; brtos/BRTOS.c	prio = 9;
	MOVLW	0x09
	MOVWF	r0x02
	BRA	_00514_DS_
_00483_DS_:
;	.line	1366; brtos/BRTOS.c	prio = 8;
	MOVLW	0x08
	MOVWF	r0x02
	BRA	_00514_DS_
_00513_DS_:
;	.line	1374; brtos/BRTOS.c	if (ReadyList > 0x0F)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00540_DS_
	MOVLW	0x10
	SUBWF	r0x00, W
_00540_DS_:
	BNC	_00510_DS_
;	.line	1376; brtos/BRTOS.c	if (ReadyList > 0x3F)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00541_DS_
	MOVLW	0x40
	SUBWF	r0x00, W
_00541_DS_:
	BNC	_00498_DS_
;	.line	1378; brtos/BRTOS.c	if (ReadyList > 0x7F)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00542_DS_
	MOVLW	0x80
	SUBWF	r0x00, W
_00542_DS_:
	BNC	_00492_DS_
;	.line	1380; brtos/BRTOS.c	prio = 7;
	MOVLW	0x07
	MOVWF	r0x02
	BRA	_00514_DS_
_00492_DS_:
;	.line	1384; brtos/BRTOS.c	prio = 6;
	MOVLW	0x06
	MOVWF	r0x02
	BRA	_00514_DS_
_00498_DS_:
;	.line	1389; brtos/BRTOS.c	if (ReadyList > 0x1F)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00543_DS_
	MOVLW	0x20
	SUBWF	r0x00, W
_00543_DS_:
	BNC	_00495_DS_
;	.line	1391; brtos/BRTOS.c	prio = 5; 
	MOVLW	0x05
	MOVWF	r0x02
	BRA	_00514_DS_
_00495_DS_:
;	.line	1395; brtos/BRTOS.c	prio = 4;
	MOVLW	0x04
	MOVWF	r0x02
	BRA	_00514_DS_
_00510_DS_:
;	.line	1401; brtos/BRTOS.c	if (ReadyList > 0x03)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00544_DS_
	MOVLW	0x04
	SUBWF	r0x00, W
_00544_DS_:
	BNC	_00507_DS_
;	.line	1403; brtos/BRTOS.c	if (ReadyList > 0x07)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00545_DS_
	MOVLW	0x08
	SUBWF	r0x00, W
_00545_DS_:
	BNC	_00501_DS_
;	.line	1405; brtos/BRTOS.c	prio = 3;
	MOVLW	0x03
	MOVWF	r0x02
	BRA	_00514_DS_
_00501_DS_:
;	.line	1409; brtos/BRTOS.c	prio = 2;
	MOVLW	0x02
	MOVWF	r0x02
	BRA	_00514_DS_
_00507_DS_:
;	.line	1414; brtos/BRTOS.c	if (ReadyList > 0x1)
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00546_DS_
	MOVLW	0x02
	SUBWF	r0x00, W
_00546_DS_:
	BNC	_00504_DS_
;	.line	1416; brtos/BRTOS.c	prio = 1;
	MOVLW	0x01
	MOVWF	r0x02
	BRA	_00514_DS_
_00504_DS_:
;	.line	1420; brtos/BRTOS.c	prio = 0;
	CLRF	r0x02
_00514_DS_:
;	.line	1430; brtos/BRTOS.c	return prio;
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__initEvents	code
_initEvents:
;	.line	1161; brtos/BRTOS.c	void initEvents(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	1166; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_SEM;i++)
	MOVLW	0x02
	MOVWF	r0x00
_00458_DS_:
;	.line	1167; brtos/BRTOS.c	BRTOS_Sem_Table[i].OSEventAllocated = 0;
	DECF	r0x00, W
	MOVWF	r0x01
; ;multiply lit val:0x05 by variable r0x01 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x01, W
	MULLW	0x05
	MOVFF	PRODL, r0x02
	CLRF	r0x03
	MOVLW	LOW(_BRTOS_Sem_Table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_BRTOS_Sem_Table)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
	MOVFF	r0x01, r0x00
;	.line	1166; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_SEM;i++)
	MOVF	r0x00, W
	BNZ	_00458_DS_
;	.line	1171; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_MUTEX;i++)
	MOVLW	0x02
	MOVWF	r0x00
_00461_DS_:
;	.line	1172; brtos/BRTOS.c	BRTOS_Mutex_Table[i].OSEventAllocated = 0;
	DECF	r0x00, W
	MOVWF	r0x01
; ;multiply lit val:0x08 by variable r0x01 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x01, W
	MULLW	0x08
	MOVFF	PRODL, r0x02
	CLRF	r0x03
	MOVLW	LOW(_BRTOS_Mutex_Table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_BRTOS_Mutex_Table)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
	MOVFF	r0x01, r0x00
;	.line	1171; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_MUTEX;i++)
	MOVF	r0x00, W
	BNZ	_00461_DS_
;	.line	1181; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_QUEUE;i++)
	MOVLW	0x03
	MOVWF	r0x00
_00464_DS_:
;	.line	1182; brtos/BRTOS.c	BRTOS_Queue_Table[i].OSEventAllocated = 0;    
	DECF	r0x00, W
	MOVWF	r0x01
; ;multiply lit val:0x08 by variable r0x01 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x01, W
	MULLW	0x08
	MOVFF	PRODL, r0x02
	CLRF	r0x03
	MOVLW	LOW(_BRTOS_Queue_Table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_BRTOS_Queue_Table)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
	MOVFF	r0x01, r0x00
;	.line	1181; brtos/BRTOS.c	for(i=0;i<BRTOS_MAX_QUEUE;i++)
	MOVF	r0x00, W
	BNZ	_00464_DS_
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__BRTOS_Init	code
_BRTOS_Init:
;	.line	1130; brtos/BRTOS.c	void BRTOS_Init(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	1134; brtos/BRTOS.c	StackAddress = (INT16U)&STACK;
	MOVLW	LOW(_STACK)
	BANKSEL	_StackAddress
	MOVWF	_StackAddress, B
	MOVLW	HIGH(_STACK)
	BANKSEL	(_StackAddress + 1)
	MOVWF	(_StackAddress + 1), B
;	.line	1138; brtos/BRTOS.c	initEvents();
	CALL	_initEvents
;	.line	1143; brtos/BRTOS.c	PreInstallTasks();  
	CALL	_PreInstallTasks
;	.line	1148; brtos/BRTOS.c	TickTimerSetup(); 
	CALL	_TickTimerSetup
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__InstallIdle	code
_InstallIdle:
;	.line	1056; brtos/BRTOS.c	INT8U InstallIdle(void(*FctPtr)(void), INT16U USER_STACKED_BYTES)
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
	BANKSEL	_currentTask
;	.line	1060; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00426_DS_
;	.line	1062; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00426_DS_:
;	.line	1064; brtos/BRTOS.c	if (USER_STACKED_BYTES < NUMBER_MIN_OF_STACKED_BYTES)
	MOVLW	0x00
	SUBWF	r0x04, W
	BNZ	_00445_DS_
	MOVLW	0x38
	SUBWF	r0x03, W
_00445_DS_:
	BC	_00430_DS_
	BANKSEL	_currentTask
;	.line	1066; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00428_DS_
;	.line	1068; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00428_DS_:
;	.line	1069; brtos/BRTOS.c	return STACK_SIZE_TOO_SMALL;
	MOVLW	0x02
	BRA	_00437_DS_
_00430_DS_:
;	.line	1072; brtos/BRTOS.c	if ((iStackAddress + USER_STACKED_BYTES) > HEAP_SIZE)
	MOVF	r0x03, W
	BANKSEL	_iStackAddress
	ADDWF	_iStackAddress, W, B
	MOVWF	r0x05
	MOVF	r0x04, W
	BANKSEL	(_iStackAddress + 1)
	ADDWFC	(_iStackAddress + 1), W, B
	MOVWF	r0x06
	MOVLW	0x00
	SUBWF	r0x06, W
	BNZ	_00446_DS_
	MOVLW	0x81
	SUBWF	r0x05, W
_00446_DS_:
	BNC	_00434_DS_
	BANKSEL	_currentTask
;	.line	1074; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00432_DS_
;	.line	1076; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00432_DS_:
;	.line	1077; brtos/BRTOS.c	return NO_MEMORY;
	MOVLW	0x01
	BRA	_00437_DS_
_00434_DS_:
	BANKSEL	_StackAddress
;	.line	1084; brtos/BRTOS.c	ContextTask[NUMBER_OF_TASKS+1].StackPoint = StackAddress + NUMBER_MIN_OF_STACKED_BYTES;
	MOVF	_StackAddress, W, B
	ADDLW	0x38
	MOVWF	r0x05
	MOVLW	0x00
	BANKSEL	(_StackAddress + 1)
	ADDWFC	(_StackAddress + 1), W, B
	MOVWF	r0x06
	MOVF	r0x05, W
	BANKSEL	(_ContextTask + 131)
	MOVWF	(_ContextTask + 131), B
	MOVF	r0x06, W
	BANKSEL	(_ContextTask + 132)
	MOVWF	(_ContextTask + 132), B
	BANKSEL	_StackAddress
;	.line	1091; brtos/BRTOS.c	ContextTask[NUMBER_OF_TASKS+1].StackInit = StackAddress;
	MOVF	_StackAddress, W, B
	BANKSEL	(_ContextTask + 133)
	MOVWF	(_ContextTask + 133), B
	BANKSEL	(_StackAddress + 1)
	MOVF	(_StackAddress + 1), W, B
	BANKSEL	(_ContextTask + 134)
	MOVWF	(_ContextTask + 134), B
	BANKSEL	(_ContextTask + 137)
;	.line	1097; brtos/BRTOS.c	ContextTask[NUMBER_OF_TASKS+1].Priority = 0;
	CLRF	(_ContextTask + 137), B
;	.line	1099; brtos/BRTOS.c	PriorityVector[0] = NUMBER_OF_TASKS+1;
	MOVLW	0x08
	BANKSEL	_PriorityVector
	MOVWF	_PriorityVector, B
;	.line	1102; brtos/BRTOS.c	CreateVirtualStack(FctPtr, USER_STACKED_BYTES);    
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
	CALL	_CreateVirtualStack
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	1105; brtos/BRTOS.c	iStackAddress = iStackAddress + USER_STACKED_BYTES;
	MOVF	r0x03, W
	BANKSEL	_iStackAddress
	ADDWF	_iStackAddress, F, B
	MOVF	r0x04, W
	BANKSEL	(_iStackAddress + 1)
	ADDWFC	(_iStackAddress + 1), F, B
;	.line	1108; brtos/BRTOS.c	StackAddress = StackAddress + USER_STACKED_BYTES;   
	MOVF	r0x03, W
	BANKSEL	_StackAddress
	ADDWF	_StackAddress, F, B
	MOVF	r0x04, W
	BANKSEL	(_StackAddress + 1)
	ADDWFC	(_StackAddress + 1), F, B
;	.line	1110; brtos/BRTOS.c	ContextTask[NUMBER_OF_TASKS+1].TimeToWait = NO_TIMEOUT;
	MOVLW	0xe8
	BANKSEL	(_ContextTask + 135)
	MOVWF	(_ContextTask + 135), B
	MOVLW	0xfd
	BANKSEL	(_ContextTask + 136)
	MOVWF	(_ContextTask + 136), B
	BANKSEL	_OSReadyList
;	.line	1117; brtos/BRTOS.c	OSReadyList = OSReadyList | (PriorityType)1;
	BSF	_OSReadyList, 0, B
	BANKSEL	_currentTask
;	.line	1119; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00436_DS_
;	.line	1121; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00436_DS_:
;	.line	1123; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00437_DS_:
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
S_BRTOS__InstallTask	code
_InstallTask:
;	.line	916; brtos/BRTOS.c	INT8U InstallTask(void(*FctPtr)(void),const CHAR8 *TaskName, INT16U USER_STACKED_BYTES,INT8U iPriority)
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
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x08
;	.line	920; brtos/BRTOS.c	INT8U TaskNumber = 0;
	CLRF	r0x09
	BANKSEL	_currentTask
;	.line	923; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00366_DS_
;	.line	925; brtos/BRTOS.c	OSEnterCritical();  
	BCF	_INTCONbits, 7
_00366_DS_:
;	.line	927; brtos/BRTOS.c	if (USER_STACKED_BYTES < NUMBER_MIN_OF_STACKED_BYTES)
	MOVLW	0x00
	SUBWF	r0x07, W
	BNZ	_00413_DS_
	MOVLW	0x38
	SUBWF	r0x06, W
_00413_DS_:
	BC	_00370_DS_
	BANKSEL	_currentTask
;	.line	929; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00368_DS_
;	.line	931; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00368_DS_:
;	.line	932; brtos/BRTOS.c	return STACK_SIZE_TOO_SMALL;
	MOVLW	0x02
	BRA	_00396_DS_
_00370_DS_:
;	.line	935; brtos/BRTOS.c	if ((iStackAddress + USER_STACKED_BYTES) > HEAP_SIZE)
	MOVF	r0x06, W
	BANKSEL	_iStackAddress
	ADDWF	_iStackAddress, W, B
	MOVWF	r0x0a
	MOVF	r0x07, W
	BANKSEL	(_iStackAddress + 1)
	ADDWFC	(_iStackAddress + 1), W, B
	MOVWF	r0x0b
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00414_DS_
	MOVLW	0x81
	SUBWF	r0x0a, W
_00414_DS_:
	BNC	_00374_DS_
	BANKSEL	_currentTask
;	.line	937; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00372_DS_
;	.line	939; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00372_DS_:
;	.line	940; brtos/BRTOS.c	return NO_MEMORY;
	MOVLW	0x01
	BRA	_00396_DS_
_00374_DS_:
;	.line	943; brtos/BRTOS.c	if (iPriority)
	MOVF	r0x08, W
	BZ	_00386_DS_
;	.line	945; brtos/BRTOS.c	if (iPriority > configMAX_TASK_PRIORITY)
	MOVLW	0x10
	SUBWF	r0x08, W
	BNC	_00378_DS_
	BANKSEL	_currentTask
;	.line	947; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00376_DS_
;	.line	949; brtos/BRTOS.c	OSExitCritical();        
	BSF	_INTCONbits, 7
_00376_DS_:
;	.line	950; brtos/BRTOS.c	return END_OF_AVAILABLE_PRIORITIES;
	MOVLW	0x03
	BRA	_00396_DS_
_00378_DS_:
;	.line	953; brtos/BRTOS.c	if (PriorityVector[iPriority] != EMPTY_PRIO)
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x08, W
	MOVWF	r0x0a
	CLRF	r0x0b
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x0b, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	INDF0, r0x0c
	MOVF	r0x0c, W
	XORLW	0xff
	BZ	_00387_DS_
_00417_DS_:
	BANKSEL	_currentTask
;	.line	955; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00380_DS_
;	.line	957; brtos/BRTOS.c	OSExitCritical();        
	BSF	_INTCONbits, 7
_00380_DS_:
;	.line	958; brtos/BRTOS.c	return BUSY_PRIORITY;
	MOVLW	0x04
	BRA	_00396_DS_
_00386_DS_:
	BANKSEL	_currentTask
;	.line	963; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00384_DS_
;	.line	965; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00384_DS_:
;	.line	966; brtos/BRTOS.c	return CANNOT_ASSIGN_IDLE_TASK_PRIO;
	MOVLW	0x07
	BRA	_00396_DS_
_00387_DS_:
	BANKSEL	_NumberOfInstalledTasks
;	.line	969; brtos/BRTOS.c	NumberOfInstalledTasks++;
	INCF	_NumberOfInstalledTasks, F, B
;	.line	972; brtos/BRTOS.c	for(i=0;i<NUMBER_OF_TASKS;i++)
	CLRF	r0x0c
	CLRF	r0x0d
_00390_DS_:
	MOVLW	0x07
	SUBWF	r0x0d, W
	BTFSC	STATUS, 0
	BRA	_00393_DS_
;	.line	975; brtos/BRTOS.c	teste = teste<<i;
	MOVLW	0x01
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	r0x0f
	MOVLW	0x00
	MOVWF	r0x10
	MOVLW	0x00
	MOVWF	r0x11
	MOVF	r0x0d, W
	BZ	_00419_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00420_DS_:
	RLCF	r0x0e, F
	RLCF	r0x0f, F
	RLCF	r0x10, F
	RLCF	r0x11, F
	ADDLW	0x01
	BNC	_00420_DS_
_00419_DS_:
	BANKSEL	_TaskAlloc
;	.line	977; brtos/BRTOS.c	if (!(teste & TaskAlloc))
	MOVF	_TaskAlloc, W, B
	ANDWF	r0x0e, W
	MOVWF	r0x12
	BANKSEL	(_TaskAlloc + 1)
	MOVF	(_TaskAlloc + 1), W, B
	ANDWF	r0x0f, W
	MOVWF	r0x13
	BANKSEL	(_TaskAlloc + 2)
	MOVF	(_TaskAlloc + 2), W, B
	ANDWF	r0x10, W
	MOVWF	r0x14
	BANKSEL	(_TaskAlloc + 3)
	MOVF	(_TaskAlloc + 3), W, B
	ANDWF	r0x11, W
	MOVWF	r0x15
	MOVF	r0x12, W
	IORWF	r0x13, W
	IORWF	r0x14, W
	IORWF	r0x15, W
	BNZ	_00392_DS_
;	.line	979; brtos/BRTOS.c	TaskNumber = i+1;
	INCF	r0x0c, W
	MOVWF	r0x09
;	.line	980; brtos/BRTOS.c	TaskAlloc = TaskAlloc | teste;
	MOVF	r0x0e, W
	BANKSEL	_TaskAlloc
	IORWF	_TaskAlloc, F, B
	MOVF	r0x0f, W
	BANKSEL	(_TaskAlloc + 1)
	IORWF	(_TaskAlloc + 1), F, B
	MOVF	r0x10, W
	BANKSEL	(_TaskAlloc + 2)
	IORWF	(_TaskAlloc + 2), F, B
	MOVF	r0x11, W
	BANKSEL	(_TaskAlloc + 3)
	IORWF	(_TaskAlloc + 3), F, B
;	.line	981; brtos/BRTOS.c	break;
	BRA	_00393_DS_
_00392_DS_:
;	.line	972; brtos/BRTOS.c	for(i=0;i<NUMBER_OF_TASKS;i++)
	INCF	r0x0d, F
	MOVFF	r0x0d, r0x0c
	BRA	_00390_DS_
; ;multiply lit val:0x10 by variable r0x09 and store in r0x0c
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00393_DS_:
;	.line	985; brtos/BRTOS.c	Task = &ContextTask[TaskNumber];   
	MOVF	r0x09, W
	MULLW	0x10
	MOVFF	PRODL, r0x0c
	CLRF	r0x0d
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x0c, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x0d, F
	MOVF	r0x0d, W
	MOVWF	r0x0d
	MOVF	r0x0c, W
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
;	.line	987; brtos/BRTOS.c	Task->TaskName = TaskName;
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput3
;	.line	992; brtos/BRTOS.c	Task->StackPoint = StackAddress + NUMBER_MIN_OF_STACKED_BYTES;
	MOVF	r0x0c, W
	ADDLW	0x03
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0d, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x0e, W
	MOVWF	r0x05
	BANKSEL	_StackAddress
	MOVF	_StackAddress, W, B
	ADDLW	0x38
	MOVWF	r0x0f
	MOVLW	0x00
	BANKSEL	(_StackAddress + 1)
	ADDWFC	(_StackAddress + 1), W, B
	MOVWF	r0x10
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	999; brtos/BRTOS.c	Task->StackInit = StackAddress;
	MOVF	r0x0c, W
	ADDLW	0x05
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0d, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x0e, W
	MOVWF	r0x05
	MOVFF	_StackAddress, POSTDEC1
	MOVFF	(_StackAddress + 1), PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	1006; brtos/BRTOS.c	Task->Priority = iPriority;
	MOVF	r0x0c, W
	ADDLW	0x09
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x0d, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x0e, W
	MOVWF	r0x05
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	1009; brtos/BRTOS.c	PriorityVector[iPriority] = TaskNumber;
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	r0x09, INDF0
;	.line	1013; brtos/BRTOS.c	CreateVirtualStack(FctPtr, USER_STACKED_BYTES);   
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_CreateVirtualStack
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	1016; brtos/BRTOS.c	iStackAddress = iStackAddress + USER_STACKED_BYTES;
	MOVF	r0x06, W
	BANKSEL	_iStackAddress
	ADDWF	_iStackAddress, F, B
	MOVF	r0x07, W
	BANKSEL	(_iStackAddress + 1)
	ADDWFC	(_iStackAddress + 1), F, B
;	.line	1019; brtos/BRTOS.c	StackAddress = StackAddress + USER_STACKED_BYTES;
	MOVF	r0x06, W
	BANKSEL	_StackAddress
	ADDWF	_StackAddress, F, B
	MOVF	r0x07, W
	BANKSEL	(_StackAddress + 1)
	ADDWFC	(_StackAddress + 1), F, B
;	.line	1022; brtos/BRTOS.c	Task->TimeToWait = NO_TIMEOUT;
	MOVF	r0x0c, W
	ADDLW	0x07
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0d, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x0e, W
	MOVWF	r0x02
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
;	.line	1023; brtos/BRTOS.c	Task->Next     =  NULL;
	MOVF	r0x0c, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x0d, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x0e, W
	MOVWF	r0x02
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
;	.line	1024; brtos/BRTOS.c	Task->Previous =  NULL;
	MOVLW	0x0d
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
; ;multiply lit val:0x02 by variable r0x08 and store in r0x08
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	1031; brtos/BRTOS.c	OSReadyList = OSReadyList | (PriorityMask[iPriority]);
	BCF	STATUS, 0
	RLCF	r0x08, F
	CLRF	r0x00
	CLRF	r0x01
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x08, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x00, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x01, F
	MOVFF	r0x08, TBLPTRL
	MOVFF	r0x00, TBLPTRH
	MOVFF	r0x01, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x08
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	MOVF	r0x08, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x00, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
	BANKSEL	_currentTask
;	.line	1033; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00395_DS_
;	.line	1035; brtos/BRTOS.c	OSExitCritical();   
	BSF	_INTCONbits, 7
_00395_DS_:
;	.line	1037; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00396_DS_:
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
S_BRTOS__Idle	code
_Idle:
;	.line	873; brtos/BRTOS.c	void Idle(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
_00358_DS_:
;	.line	882; brtos/BRTOS.c	OSDutyTmp = TIMER_COUNTER;
	MOVFF	_TMR1H, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVFF	_TMR1L, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
	MOVFF	r0x02, _OSDutyTmp
	MOVFF	r0x03, (_OSDutyTmp + 1)
	CLRF	WREG
	BTFSC	r0x03, 7
	MOVLW	0xff
	BANKSEL	(_OSDutyTmp + 2)
	MOVWF	(_OSDutyTmp + 2), B
	BANKSEL	(_OSDutyTmp + 3)
	MOVWF	(_OSDutyTmp + 3), B
	SLEEP 
	BRA	_00358_DS_
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__UnBlockMultipleTask	code
_UnBlockMultipleTask:
;	.line	817; brtos/BRTOS.c	INT8U UnBlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
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
	BANKSEL	_iNesting
;	.line	824; brtos/BRTOS.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00330_DS_
;	.line	825; brtos/BRTOS.c	return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
	MOVLW	0x02
	BRA	_00341_DS_
_00330_DS_:
	BANKSEL	_currentTask
;	.line	829; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00332_DS_
;	.line	830; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00332_DS_:
;	.line	832; brtos/BRTOS.c	TaskFinish = (INT8U)(TaskStart + TaskNumber);
	MOVF	r0x00, W
	ADDWF	r0x01, F
;	.line	834; brtos/BRTOS.c	for (iTask = TaskStart; iTask <TaskFinish; iTask++)
	MOVFF	r0x00, r0x02
; ;multiply lit val:0x10 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x10
	MOVFF	PRODL, r0x00
_00337_DS_:
	MOVF	r0x01, W
	SUBWF	r0x02, W
	BC	_00340_DS_
;	.line	837; brtos/BRTOS.c	if (iTask != currentTask)
	MOVF	r0x02, W
	BANKSEL	_currentTask
	XORWF	_currentTask, W, B
	BZ	_00339_DS_
;	.line	839; brtos/BRTOS.c	iPriority = ContextTask[iTask].Priority;
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x04, F
	MOVLW	0x09
	ADDWF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	845; brtos/BRTOS.c	OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
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
	MOVF	r0x03, W
	BANKSEL	_OSBlockedList
	IORWF	_OSBlockedList, F, B
	MOVF	r0x04, W
	BANKSEL	(_OSBlockedList + 1)
	IORWF	(_OSBlockedList + 1), F, B
_00339_DS_:
;	.line	834; brtos/BRTOS.c	for (iTask = TaskStart; iTask <TaskFinish; iTask++)
	MOVLW	0x10
	ADDWF	r0x00, F
	INCF	r0x02, F
	BRA	_00337_DS_
_00340_DS_:
	BANKSEL	_currentTask
;	.line	850; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00336_DS_
;	.line	851; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00336_DS_:
;	.line	853; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00341_DS_:
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
S_BRTOS__BlockMultipleTask	code
_BlockMultipleTask:
;	.line	765; brtos/BRTOS.c	INT8U BlockMultipleTask(INT8U TaskStart, INT8U TaskNumber)
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
	BANKSEL	_iNesting
;	.line	772; brtos/BRTOS.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00302_DS_
;	.line	773; brtos/BRTOS.c	return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
	MOVLW	0x02
	BRA	_00313_DS_
_00302_DS_:
	BANKSEL	_currentTask
;	.line	777; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00304_DS_
;	.line	778; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00304_DS_:
;	.line	780; brtos/BRTOS.c	TaskFinish = (INT8U)(TaskStart + TaskNumber);
	MOVF	r0x00, W
	ADDWF	r0x01, F
;	.line	782; brtos/BRTOS.c	for (iTask = TaskStart; iTask <TaskFinish; iTask++)
	MOVFF	r0x00, r0x02
; ;multiply lit val:0x10 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x10
	MOVFF	PRODL, r0x00
_00309_DS_:
	MOVF	r0x01, W
	SUBWF	r0x02, W
	BC	_00312_DS_
;	.line	784; brtos/BRTOS.c	if (iTask != currentTask)
	MOVF	r0x02, W
	BANKSEL	_currentTask
	XORWF	_currentTask, W, B
	BZ	_00311_DS_
;	.line	790; brtos/BRTOS.c	iPriority = ContextTask[iTask].Priority;   
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x04, F
	MOVLW	0x09
	ADDWF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	792; brtos/BRTOS.c	OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
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
	BANKSEL	_OSBlockedList
	ANDWF	_OSBlockedList, F, B
	MOVF	r0x04, W
	BANKSEL	(_OSBlockedList + 1)
	ANDWF	(_OSBlockedList + 1), F, B
_00311_DS_:
;	.line	782; brtos/BRTOS.c	for (iTask = TaskStart; iTask <TaskFinish; iTask++)
	MOVLW	0x10
	ADDWF	r0x00, F
	INCF	r0x02, F
	BRA	_00309_DS_
_00312_DS_:
	BANKSEL	_currentTask
;	.line	797; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00308_DS_
;	.line	798; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00308_DS_:
;	.line	800; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00313_DS_:
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
S_BRTOS__UnBlockTask	code
_UnBlockTask:
;	.line	712; brtos/BRTOS.c	INT8U UnBlockTask(INT8U iTaskNumber)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	BANKSEL	_iNesting
;	.line	719; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00289_DS_
;	.line	721; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
; ;multiply lit val:0x10 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00289_DS_:
;	.line	728; brtos/BRTOS.c	iPriority = ContextTask[iTaskNumber].Priority;
	MOVF	r0x00, W
	MULLW	0x10
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x01, F
	MOVLW	0x09
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	730; brtos/BRTOS.c	OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
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
	BANKSEL	_OSBlockedList
	IORWF	_OSBlockedList, F, B
	MOVF	r0x01, W
	BANKSEL	(_OSBlockedList + 1)
	IORWF	(_OSBlockedList + 1), F, B
	BANKSEL	_currentTask
;	.line	733; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00293_DS_
	BANKSEL	_iNesting
;	.line	735; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00293_DS_
;	.line	737; brtos/BRTOS.c	ChangeContext();
	CALL	_SwitchContext
_00293_DS_:
	BANKSEL	_iNesting
;	.line	743; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00295_DS_
;	.line	745; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00295_DS_:
;	.line	747; brtos/BRTOS.c	return OK;  
	CLRF	WREG
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__BlockTask	code
_BlockTask:
;	.line	665; brtos/BRTOS.c	INT8U BlockTask(INT8U iTaskNumber)
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
	BANKSEL	_iNesting
;	.line	670; brtos/BRTOS.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00268_DS_
;	.line	671; brtos/BRTOS.c	return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
	MOVLW	0x02
	BRA	_00275_DS_
_00268_DS_:
	BANKSEL	_currentTask
;	.line	675; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00270_DS_
;	.line	676; brtos/BRTOS.c	OSEnterCritical();    
	BCF	_INTCONbits, 7
; ;multiply lit val:0x10 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00270_DS_:
;	.line	682; brtos/BRTOS.c	iPriority = ContextTask[iTaskNumber].Priority;
	MOVF	r0x00, W
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
	MOVFF	INDF0, r0x01
; ;multiply lit val:0x02 by variable r0x01 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	684; brtos/BRTOS.c	OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
	BCF	STATUS, 0
	RLCF	r0x01, F
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x01, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x03, F
	MOVFF	r0x01, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	COMF	r0x01, F
	COMF	r0x02, F
	MOVF	r0x01, W
	BANKSEL	_OSBlockedList
	ANDWF	_OSBlockedList, F, B
	MOVF	r0x02, W
	BANKSEL	(_OSBlockedList + 1)
	ANDWF	(_OSBlockedList + 1), F, B
	BANKSEL	_currentTask
;	.line	686; brtos/BRTOS.c	if (currentTask == iTaskNumber)
	MOVF	_currentTask, W, B
	XORWF	r0x00, W
	BNZ	_00272_DS_
;	.line	688; brtos/BRTOS.c	ChangeContext();     
	CALL	_SwitchContext
_00272_DS_:
	BANKSEL	_currentTask
;	.line	692; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00274_DS_
;	.line	693; brtos/BRTOS.c	OSExitCritical();  
	BSF	_INTCONbits, 7
_00274_DS_:
;	.line	695; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00275_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__UnBlockPriority	code
_UnBlockPriority:
;	.line	611; brtos/BRTOS.c	INT8U UnBlockPriority(INT8U iPriority)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	BANKSEL	_iNesting
;	.line	621; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00255_DS_
;	.line	623; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00255_DS_:
;	.line	631; brtos/BRTOS.c	OSBlockedList = OSBlockedList | (PriorityMask[iPriority]);
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
	BANKSEL	_OSBlockedList
	IORWF	_OSBlockedList, F, B
	MOVF	r0x01, W
	BANKSEL	(_OSBlockedList + 1)
	IORWF	(_OSBlockedList + 1), F, B
	BANKSEL	_currentTask
;	.line	634; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00259_DS_
	BANKSEL	_iNesting
;	.line	636; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00259_DS_
;	.line	638; brtos/BRTOS.c	ChangeContext();
	CALL	_SwitchContext
_00259_DS_:
	BANKSEL	_iNesting
;	.line	644; brtos/BRTOS.c	if (!iNesting)
	MOVF	_iNesting, W, B
	BNZ	_00261_DS_
;	.line	646; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00261_DS_:
;	.line	648; brtos/BRTOS.c	return OK;
	CLRF	WREG
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__BlockPriority	code
_BlockPriority:
;	.line	561; brtos/BRTOS.c	INT8U BlockPriority(INT8U iPriority)
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
	BANKSEL	_iNesting
;	.line	566; brtos/BRTOS.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00234_DS_
;	.line	567; brtos/BRTOS.c	return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
	MOVLW	0x02
	BRA	_00241_DS_
_00234_DS_:
	BANKSEL	_currentTask
;	.line	571; brtos/BRTOS.c	if (currentTask)  
	MOVF	_currentTask, W, B
	BZ	_00236_DS_
;	.line	572; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
_00236_DS_:
;	.line	576; brtos/BRTOS.c	BlockedTask = PriorityVector[iPriority];  
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	582; brtos/BRTOS.c	OSBlockedList = OSBlockedList & ~(PriorityMask[iPriority]);
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x00, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x02, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x03, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x02, TBLPTRH
	MOVFF	r0x03, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	COMF	r0x00, F
	COMF	r0x02, F
	MOVF	r0x00, W
	BANKSEL	_OSBlockedList
	ANDWF	_OSBlockedList, F, B
	MOVF	r0x02, W
	BANKSEL	(_OSBlockedList + 1)
	ANDWF	(_OSBlockedList + 1), F, B
	BANKSEL	_currentTask
;	.line	585; brtos/BRTOS.c	if (currentTask == BlockedTask)
	MOVF	_currentTask, W, B
	XORWF	r0x01, W
	BNZ	_00238_DS_
;	.line	587; brtos/BRTOS.c	ChangeContext();
	CALL	_SwitchContext
_00238_DS_:
	BANKSEL	_currentTask
;	.line	591; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BZ	_00240_DS_
;	.line	592; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
_00240_DS_:
;	.line	594; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00241_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__PreInstallTasks	code
_PreInstallTasks:
;	.line	524; brtos/BRTOS.c	void PreInstallTasks(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_counter
;	.line	527; brtos/BRTOS.c	counter = 0;
	CLRF	_counter, B
	BANKSEL	(_counter + 1)
	CLRF	(_counter + 1), B
	BANKSEL	_currentTask
;	.line	528; brtos/BRTOS.c	currentTask = 0;
	CLRF	_currentTask, B
	BANKSEL	_NumberOfInstalledTasks
;	.line	529; brtos/BRTOS.c	NumberOfInstalledTasks = 0;
	CLRF	_NumberOfInstalledTasks, B
	BANKSEL	_TaskAlloc
;	.line	530; brtos/BRTOS.c	TaskAlloc = 0;
	CLRF	_TaskAlloc, B
	BANKSEL	(_TaskAlloc + 1)
	CLRF	(_TaskAlloc + 1), B
	BANKSEL	(_TaskAlloc + 2)
	CLRF	(_TaskAlloc + 2), B
	BANKSEL	(_TaskAlloc + 3)
	CLRF	(_TaskAlloc + 3), B
	BANKSEL	_iStackAddress
;	.line	531; brtos/BRTOS.c	iStackAddress = 0;
	CLRF	_iStackAddress, B
	BANKSEL	(_iStackAddress + 1)
	CLRF	(_iStackAddress + 1), B
;	.line	533; brtos/BRTOS.c	for(i=0;i<configMAX_TASK_INSTALL;i++)
	CLRF	r0x00
_00219_DS_:
	MOVLW	0x10
	SUBWF	r0x00, W
	BC	_00222_DS_
;	.line	535; brtos/BRTOS.c	PriorityVector[i]=EMPTY_PRIO;
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0xff
	MOVWF	INDF0
;	.line	533; brtos/BRTOS.c	for(i=0;i<configMAX_TASK_INSTALL;i++)
	INCF	r0x00, F
	BRA	_00219_DS_
_00222_DS_:
	BANKSEL	_Tail
;	.line	538; brtos/BRTOS.c	Tail = NULL;
	CLRF	_Tail, B
	BANKSEL	(_Tail + 1)
	CLRF	(_Tail + 1), B
	BANKSEL	(_Tail + 2)
	CLRF	(_Tail + 2), B
	BANKSEL	_Head
;	.line	539; brtos/BRTOS.c	Head = NULL;
	CLRF	_Head, B
	BANKSEL	(_Head + 1)
	CLRF	(_Head + 1), B
	BANKSEL	(_Head + 2)
	CLRF	(_Head + 2), B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__BRTOSStart	code
_BRTOSStart:
;	.line	495; brtos/BRTOS.c	INT8U BRTOSStart(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	497; brtos/BRTOS.c	if (InstallIdle(&Idle,IDLE_STACK_SIZE) != OK)
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	UPPER(_Idle)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Idle)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Idle)
	MOVWF	POSTDEC1
	CALL	_InstallIdle
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00205_DS_
;	.line	499; brtos/BRTOS.c	return NO_MEMORY;
	MOVLW	0x01
	BRA	_00209_DS_
_00205_DS_:
;	.line	502; brtos/BRTOS.c	currentTask = OSSchedule();
	CALL	_OSSchedule
	BANKSEL	_currentTask
	MOVWF	_currentTask, B
; ;multiply lit val:0x10 by variable _currentTask and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
;	.line	503; brtos/BRTOS.c	SPvalue = ContextTask[currentTask].StackPoint;
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
;	.line	505; brtos/BRTOS.c	OS_RESTORE_CONTEXT();
	CLRF	_STKPTR
_00206_DS_:
	MOVF	_FSR0L, W
	SUBWF	_STKPTR, W
	BC	_00208_DS_
	PUSH 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSU, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSH, 0 
	MOVF _POSTDEC1, 0, 0 
	MOVWF _TOSL, 0 
	BRA	_00206_DS_
_00208_DS_:
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
;	.line	507; brtos/BRTOS.c	return OK;
	CLRF	WREG
_00209_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_BRTOS__OS_TICK_HANDLER	code
_OS_TICK_HANDLER:
;	.line	402; brtos/BRTOS.c	void OS_TICK_HANDLER(void)
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
;	.line	406; brtos/BRTOS.c	ContextType *Task = Head;  
	MOVFF	_Head, r0x00
	MOVFF	(_Head + 1), r0x01
	MOVFF	(_Head + 2), r0x02
_00175_DS_:
;	.line	411; brtos/BRTOS.c	while(Task != NULL)
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BTFSC	STATUS, 2
	BRA	_00177_DS_
;	.line	413; brtos/BRTOS.c	if (Task->TimeToWait == counter)
	MOVF	r0x00, W
	ADDLW	0x07
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
	CALL	__gptrget2
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVF	r0x06, W
	BANKSEL	_counter
	XORWF	_counter, W, B
	BNZ	_00190_DS_
	MOVF	r0x07, W
	BANKSEL	(_counter + 1)
	XORWF	(_counter + 1), W, B
	BZ	_00191_DS_
_00190_DS_:
	BRA	_00174_DS_
_00191_DS_:
;	.line	416; brtos/BRTOS.c	iPrio = Task->Priority;
	MOVF	r0x00, W
	ADDLW	0x09
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
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	423; brtos/BRTOS.c	OSReadyList = OSReadyList | (PriorityMask[iPrio]);
	BCF	STATUS, 0
	RLCF	r0x06, F
	CLRF	r0x07
	CLRF	r0x08
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x06, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x07, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x08, F
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x07, TBLPTRH
	MOVFF	r0x08, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x06
	TBLRD*+	
	MOVFF	TABLAT, r0x07
	MOVF	r0x06, W
	BANKSEL	_OSReadyList
	IORWF	_OSReadyList, F, B
	MOVF	r0x07, W
	BANKSEL	(_OSReadyList + 1)
	IORWF	(_OSReadyList + 1), F, B
;	.line	429; brtos/BRTOS.c	Task->TimeToWait = EXIT_BY_TIMEOUT;
	MOVLW	0xe9
	MOVWF	POSTDEC1
	MOVLW	0xfd
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	436; brtos/BRTOS.c	RemoveFromDelayList();
	MOVF	r0x00, W
	BANKSEL	_Head
	XORWF	_Head, W, B
	BNZ	_00193_DS_
	MOVF	r0x01, W
	BANKSEL	(_Head + 1)
	XORWF	(_Head + 1), W, B
	BNZ	_00193_DS_
	MOVF	r0x02, W
	BANKSEL	(_Head + 2)
	XORWF	(_Head + 2), W, B
	BZ	_00194_DS_
_00193_DS_:
	BRA	_00171_DS_
_00194_DS_:
	MOVF	r0x00, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00195_DS_
	MOVF	r0x01, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00195_DS_
	MOVF	r0x02, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00196_DS_
_00195_DS_:
	BRA	_00165_DS_
_00196_DS_:
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
	BRA	_00174_DS_
_00165_DS_:
	MOVF	r0x00, W
	ADDLW	0x0a
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
	CALL	__gptrget3
	BANKSEL	_Head
	MOVWF	_Head, B
	MOVFF	PRODL, (_Head + 1)
	MOVFF	PRODH, (_Head + 2)
	MOVFF	_Head, r0x03
	MOVFF	(_Head + 1), r0x04
	MOVFF	(_Head + 2), r0x05
	MOVLW	0x0d
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	BRA	_00174_DS_
_00171_DS_:
	MOVF	r0x00, W
	BANKSEL	_Tail
	XORWF	_Tail, W, B
	BNZ	_00197_DS_
	MOVF	r0x01, W
	BANKSEL	(_Tail + 1)
	XORWF	(_Tail + 1), W, B
	BNZ	_00197_DS_
	MOVF	r0x02, W
	BANKSEL	(_Tail + 2)
	XORWF	(_Tail + 2), W, B
	BZ	_00198_DS_
_00197_DS_:
	BRA	_00168_DS_
_00198_DS_:
	MOVF	r0x00, W
	ADDLW	0x0d
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
	CALL	__gptrget3
	BANKSEL	_Tail
	MOVWF	_Tail, B
	MOVFF	PRODL, (_Tail + 1)
	MOVFF	PRODH, (_Tail + 2)
	MOVFF	_Tail, r0x03
	MOVFF	(_Tail + 1), r0x04
	MOVFF	(_Tail + 2), r0x05
	MOVLW	0x0a
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	BRA	_00174_DS_
_00168_DS_:
	MOVF	r0x00, W
	ADDLW	0x0a
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
	CALL	__gptrget3
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVF	r0x03, W
	ADDLW	0x0d
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVF	r0x00, W
	ADDLW	0x0d
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
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, PRODH
	MOVFF	r0x0b, TBLPTRL
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput3
	MOVLW	0x0a
	ADDWF	r0x09, F
	MOVLW	0x00
	ADDWFC	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput3
_00174_DS_:
;	.line	439; brtos/BRTOS.c	Task = Task->Next;
	MOVF	r0x00, W
	ADDLW	0x0a
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
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	BRA	_00175_DS_
_00177_DS_:
;	.line	448; brtos/BRTOS.c	if (DutyCnt >= 1024)
	MOVLW	0x04
	BANKSEL	(_DutyCnt + 1)
	SUBWF	(_DutyCnt + 1), W, B
	BNZ	_00199_DS_
	MOVLW	0x00
	BANKSEL	_DutyCnt
	SUBWF	_DutyCnt, W, B
_00199_DS_:
	BTFSS	STATUS, 0
	BRA	_00179_DS_
	BANKSEL	_DutyCnt
;	.line	450; brtos/BRTOS.c	DutyCnt = 0;
	CLRF	_DutyCnt, B
	BANKSEL	(_DutyCnt + 1)
	CLRF	(_DutyCnt + 1), B
	BANKSEL	_OSDutyTmp
;	.line	451; brtos/BRTOS.c	OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);
	MOVF	_OSDutyTmp, W, B
	BANKSEL	_OSDuty
	ADDWF	_OSDuty, F, B
	BANKSEL	(_OSDutyTmp + 1)
	MOVF	(_OSDutyTmp + 1), W, B
	BANKSEL	(_OSDuty + 1)
	ADDWFC	(_OSDuty + 1), F, B
	BANKSEL	(_OSDutyTmp + 2)
	MOVF	(_OSDutyTmp + 2), W, B
	BANKSEL	(_OSDuty + 2)
	ADDWFC	(_OSDuty + 2), F, B
	BANKSEL	(_OSDutyTmp + 3)
	MOVF	(_OSDutyTmp + 3), W, B
	BANKSEL	(_OSDuty + 3)
	ADDWFC	(_OSDuty + 3), F, B
;	.line	452; brtos/BRTOS.c	LastOSDuty = (INT16U)(OSDuty >> 10);
	BCF	STATUS, 0
	BANKSEL	(_OSDuty + 2)
	RRCF	(_OSDuty + 2), W, B
	MOVWF	r0x01
	BANKSEL	(_OSDuty + 1)
	RRCF	(_OSDuty + 1), W, B
	MOVWF	r0x00
	BCF	STATUS, 0
	RRCF	r0x01, F
	RRCF	r0x00, F
	BANKSEL	(_OSDuty + 3)
	MOVF	(_OSDuty + 3), W, B
	RRNCF	WREG, W
	RRNCF	WREG, W
	ANDLW	0xc0
	IORWF	r0x01, F
	BANKSEL	(_OSDuty + 3)
	RRNCF	(_OSDuty + 3), W, B
	RRNCF	WREG, W
	ANDLW	0x3f
	MOVWF	r0x02
	CLRF	r0x03
	MOVF	r0x00, W
	BANKSEL	_LastOSDuty
	MOVWF	_LastOSDuty, B
	MOVF	r0x01, W
	BANKSEL	(_LastOSDuty + 1)
	MOVWF	(_LastOSDuty + 1), B
	BANKSEL	_OSDuty
;	.line	453; brtos/BRTOS.c	OSDuty = 0;
	CLRF	_OSDuty, B
	BANKSEL	(_OSDuty + 1)
	CLRF	(_OSDuty + 1), B
	BANKSEL	(_OSDuty + 2)
	CLRF	(_OSDuty + 2), B
	BANKSEL	(_OSDuty + 3)
	CLRF	(_OSDuty + 3), B
	BRA	_00180_DS_
_00179_DS_:
	BANKSEL	_OSDutyTmp
;	.line	456; brtos/BRTOS.c	OSDuty = (INT32U)((INT32U)OSDuty + (INT32U)OSDutyTmp);
	MOVF	_OSDutyTmp, W, B
	BANKSEL	_OSDuty
	ADDWF	_OSDuty, F, B
	BANKSEL	(_OSDutyTmp + 1)
	MOVF	(_OSDutyTmp + 1), W, B
	BANKSEL	(_OSDuty + 1)
	ADDWFC	(_OSDuty + 1), F, B
	BANKSEL	(_OSDutyTmp + 2)
	MOVF	(_OSDutyTmp + 2), W, B
	BANKSEL	(_OSDuty + 2)
	ADDWFC	(_OSDuty + 2), F, B
	BANKSEL	(_OSDutyTmp + 3)
	MOVF	(_OSDutyTmp + 3), W, B
	BANKSEL	(_OSDuty + 3)
	ADDWFC	(_OSDuty + 3), F, B
	BANKSEL	_DutyCnt
;	.line	457; brtos/BRTOS.c	DutyCnt++;
	INCF	_DutyCnt, F, B
	BNC	_10470_DS_
	BANKSEL	(_DutyCnt + 1)
	INCF	(_DutyCnt + 1), F, B
_10470_DS_:
_00180_DS_:
;	.line	459; brtos/BRTOS.c	OSDutyTmp = TIMER_MODULE;
	MOVFF	_CCPR1, _OSDutyTmp
	BANKSEL	(_OSDutyTmp + 1)
	CLRF	(_OSDutyTmp + 1), B
	BANKSEL	(_OSDutyTmp + 2)
	CLRF	(_OSDutyTmp + 2), B
	BANKSEL	(_OSDutyTmp + 3)
	CLRF	(_OSDutyTmp + 3), B
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
S_BRTOS__DelayTaskHMSM	code
_DelayTaskHMSM:
;	.line	348; brtos/BRTOS.c	INT8U DelayTaskHMSM(INT8U hours, INT8U minutes, INT8U seconds, INT16U miliseconds)
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
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
;	.line	353; brtos/BRTOS.c	if (minutes > 59)
	MOVLW	0x3c
	SUBWF	r0x01, W
	BNC	_00137_DS_
;	.line	354; brtos/BRTOS.c	return INVALID_TIME;
	MOVLW	0x05
	BRA	_00148_DS_
_00137_DS_:
;	.line	356; brtos/BRTOS.c	if (seconds > 59)
	MOVLW	0x3c
	SUBWF	r0x02, W
	BNC	_00139_DS_
;	.line	357; brtos/BRTOS.c	return INVALID_TIME;
	MOVLW	0x05
	BRA	_00148_DS_
_00139_DS_:
;	.line	359; brtos/BRTOS.c	if (miliseconds > 999)
	MOVLW	0x03
	SUBWF	r0x04, W
	BNZ	_00159_DS_
	MOVLW	0xe8
	SUBWF	r0x03, W
_00159_DS_:
	BNC	_00141_DS_
;	.line	360; brtos/BRTOS.c	return INVALID_TIME;  
	MOVLW	0x05
	BRA	_00148_DS_
_00141_DS_:
;	.line	362; brtos/BRTOS.c	ticks = (INT32U)hours   * 3600L * configTICK_RATE_HZ
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
;	.line	363; brtos/BRTOS.c	+ (INT32U)minutes * 60L   * configTICK_RATE_HZ
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x36
	MOVWF	POSTDEC1
	MOVLW	0xee
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x00
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	CLRF	r0x08
	CLRF	r0x09
	CLRF	r0x0a
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x01
	MOVFF	PRODL, r0x08
	MOVFF	PRODH, r0x09
	MOVFF	FSR0L, r0x0a
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x01, W
	ADDWF	r0x00, F
	MOVF	r0x08, W
	ADDWFC	r0x05, F
	MOVF	r0x09, W
	ADDWFC	r0x06, F
	MOVF	r0x0a, W
	ADDWFC	r0x07, F
;	.line	364; brtos/BRTOS.c	+ (INT32U)seconds *         configTICK_RATE_HZ
	CLRF	r0x01
	CLRF	r0x08
	CLRF	r0x09
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x01, W
	ADDWF	r0x00, F
	MOVF	r0x02, W
	ADDWFC	r0x05, F
	MOVF	r0x08, W
	ADDWFC	r0x06, F
	MOVF	r0x09, W
	ADDWFC	r0x07, F
;	.line	365; brtos/BRTOS.c	+ ((INT32U)miliseconds    * configTICK_RATE_HZ)/1000L;
	CLRF	r0x01
	CLRF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0xe8
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x01, W
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVF	r0x02, W
	ADDWFC	r0x05, W
	MOVWF	r0x02
	MOVF	r0x03, W
	ADDWFC	r0x06, W
	MOVWF	r0x03
	MOVF	r0x04, W
	ADDWFC	r0x07, W
	MOVWF	r0x00
;	.line	368; brtos/BRTOS.c	if (ticks > 0)
	MOVF	r0x01, W
	IORWF	r0x02, W
	IORWF	r0x03, W
	IORWF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00146_DS_
;	.line	370; brtos/BRTOS.c	loops = ticks / 60000L;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	371; brtos/BRTOS.c	ticks = ticks % 60000L;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	373; brtos/BRTOS.c	(void)DelayTask(ticks);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	375; brtos/BRTOS.c	while(loops > 0)
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	MOVFF	r0x06, r0x02
	MOVFF	r0x07, r0x03
_00142_DS_:
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	IORWF	r0x03, W
	BZ	_00144_DS_
;	.line	377; brtos/BRTOS.c	(void)DelayTask(60000);
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	CALL	_DelayTask
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	378; brtos/BRTOS.c	loops--;
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	BRA	_00142_DS_
_00144_DS_:
;	.line	380; brtos/BRTOS.c	return OK;
	CLRF	WREG
	BRA	_00148_DS_
_00146_DS_:
;	.line	384; brtos/BRTOS.c	return NO_TASK_DELAY;
	MOVLW	0x09
_00148_DS_:
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
S_BRTOS__DelayTask	code
_DelayTask:
;	.line	267; brtos/BRTOS.c	INT8U DelayTask(INT16U time_wait)
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
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
; ;multiply lit val:0x10 by variable _currentTask and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_currentTask
;	.line	271; brtos/BRTOS.c	ContextType *Task = &ContextTask[currentTask];
	MOVF	_currentTask, W, B
	MULLW	0x10
	MOVFF	PRODL, r0x02
	CLRF	r0x03
	MOVLW	LOW(_ContextTask)
	ADDWF	r0x02, F
	MOVLW	HIGH(_ContextTask)
	ADDWFC	r0x03, F
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	BANKSEL	_iNesting
;	.line	273; brtos/BRTOS.c	if (iNesting > 0) {                                // See if caller is an interrupt
	MOVF	_iNesting, W, B
	BZ	_00111_DS_
;	.line	274; brtos/BRTOS.c	return(IRQ_PEND_ERR);                           // Can't be blocked by interrupt
	MOVLW	0x02
	BRA	_00124_DS_
_00111_DS_:
	BANKSEL	_currentTask
;	.line	277; brtos/BRTOS.c	if (currentTask)
	MOVF	_currentTask, W, B
	BTFSC	STATUS, 2
	BRA	_00122_DS_
;	.line	280; brtos/BRTOS.c	if (time_wait > 0)
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSC	STATUS, 2
	BRA	_00119_DS_
;	.line	282; brtos/BRTOS.c	OSEnterCritical();
	BCF	_INTCONbits, 7
;	.line	293; brtos/BRTOS.c	timeout = (INT32U)((INT32U)counter + (INT32U)time_wait);
	MOVFF	_counter, r0x05
	MOVFF	(_counter + 1), r0x06
	CLRF	r0x07
	CLRF	r0x08
	CLRF	r0x09
	CLRF	r0x0a
	MOVF	r0x00, W
	ADDWF	r0x05, W
	MOVWF	r0x00
	MOVF	r0x01, W
	ADDWFC	r0x06, W
	MOVWF	r0x01
	MOVF	r0x09, W
	ADDWFC	r0x07, W
	MOVWF	r0x05
	MOVF	r0x0a, W
	ADDWFC	r0x08, W
	MOVWF	r0x06
;	.line	295; brtos/BRTOS.c	if (timeout >= TickCountOverFlow)
	MOVLW	0x00
	SUBWF	r0x06, W
	BNZ	_00131_DS_
	MOVLW	0x00
	SUBWF	r0x05, W
	BNZ	_00131_DS_
	MOVLW	0xfa
	SUBWF	r0x01, W
	BNZ	_00131_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00131_DS_:
	BNC	_00113_DS_
;	.line	297; brtos/BRTOS.c	Task->TimeToWait = (INT16U)(timeout - TickCountOverFlow);
	MOVF	r0x02, W
	ADDLW	0x07
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x09
	MOVF	r0x00, W
	MOVWF	r0x0a
	MOVLW	0x06
	ADDWF	r0x01, W
	MOVWF	r0x0b
	MOVLW	0xff
	ADDWFC	r0x05, W
	MOVWF	r0x0c
	MOVLW	0xff
	ADDWFC	r0x06, W
	MOVWF	r0x0d
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
	BRA	_00114_DS_
_00113_DS_:
;	.line	301; brtos/BRTOS.c	Task->TimeToWait = (INT16U)timeout;
	MOVF	r0x02, W
	ADDLW	0x07
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x09
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
_00114_DS_:
	BANKSEL	_Tail
;	.line	305; brtos/BRTOS.c	IncludeTaskIntoDelayList();
	MOVF	_Tail, W, B
	BANKSEL	(_Tail + 1)
	IORWF	(_Tail + 1), W, B
	BANKSEL	(_Tail + 2)
	IORWF	(_Tail + 2), W, B
	BTFSC	STATUS, 2
	BRA	_00116_DS_
	MOVFF	_Tail, r0x00
	MOVFF	(_Tail + 1), r0x01
	MOVFF	(_Tail + 2), r0x05
	MOVLW	0x0a
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, PRODH
	MOVFF	r0x04, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	MOVF	r0x02, W
	ADDLW	0x0d
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x05
	MOVFF	_Tail, POSTDEC1
	MOVFF	(_Tail + 1), PRODH
	MOVFF	(_Tail + 2), TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	MOVFF	r0x02, _Tail
	MOVFF	r0x03, (_Tail + 1)
	MOVFF	r0x04, (_Tail + 2)
	MOVFF	_Tail, r0x00
	MOVFF	(_Tail + 1), r0x01
	MOVFF	(_Tail + 2), r0x05
	MOVLW	0x0a
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	BRA	_00117_DS_
_00116_DS_:
	MOVFF	r0x02, _Tail
	MOVFF	r0x03, (_Tail + 1)
	MOVFF	r0x04, (_Tail + 2)
	MOVFF	r0x02, _Head
	MOVFF	r0x03, (_Head + 1)
	MOVFF	r0x04, (_Head + 2)
	MOVF	r0x02, W
	ADDLW	0x0a
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
	MOVF	r0x02, W
	ADDLW	0x0d
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
_00117_DS_:
;	.line	312; brtos/BRTOS.c	OSReadyList = OSReadyList & ~(PriorityMask[Task->Priority]);
	MOVLW	0x09
	ADDWF	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x02
; ;multiply lit val:0x02 by variable r0x02 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x02, F
	CLRF	r0x00
	CLRF	r0x01
	MOVLW	LOW(_PriorityMask)
	ADDWF	r0x02, F
	MOVLW	HIGH(_PriorityMask)
	ADDWFC	r0x00, F
	MOVLW	UPPER(_PriorityMask)
	ADDWFC	r0x01, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x00, TBLPTRH
	MOVFF	r0x01, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	COMF	r0x02, F
	COMF	r0x00, F
	MOVF	r0x02, W
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, F, B
	MOVF	r0x00, W
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), F, B
;	.line	316; brtos/BRTOS.c	ChangeContext();
	CALL	_SwitchContext
;	.line	318; brtos/BRTOS.c	OSExitCritical();
	BSF	_INTCONbits, 7
;	.line	320; brtos/BRTOS.c	return OK;
	CLRF	WREG
	BRA	_00124_DS_
_00119_DS_:
;	.line	324; brtos/BRTOS.c	return NO_TASK_DELAY;
	MOVLW	0x09
	BRA	_00124_DS_
_00122_DS_:
;	.line	329; brtos/BRTOS.c	return NOT_VALID_TASK;
	MOVLW	0x08
_00124_DS_:
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
S_BRTOS__OSSchedule	code
_OSSchedule:
;	.line	241; brtos/BRTOS.c	INT8U OSSchedule(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_OSBlockedList
;	.line	246; brtos/BRTOS.c	Priority = SAScheduler(OSReadyList & OSBlockedList);
	MOVF	_OSBlockedList, W, B
	BANKSEL	_OSReadyList
	ANDWF	_OSReadyList, W, B
	MOVWF	r0x00
	BANKSEL	(_OSBlockedList + 1)
	MOVF	(_OSBlockedList + 1), W, B
	BANKSEL	(_OSReadyList + 1)
	ANDWF	(_OSReadyList + 1), W, B
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_SAScheduler
	MOVWF	r0x00
	MOVLW	0x02
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	247; brtos/BRTOS.c	TaskSelect = PriorityVector[Priority];
	CLRF	r0x01
	MOVLW	LOW(_PriorityVector)
	ADDWF	r0x00, F
	MOVLW	HIGH(_PriorityVector)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
;	.line	249; brtos/BRTOS.c	return TaskSelect;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block for Ival
	code
_PriorityMask:
	DB	0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00
	DB	0x40, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x08
	DB	0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00, 0x80
; ; Starting pCode block
__str_0:
	DB	0x42, 0x52, 0x54, 0x4f, 0x53, 0x20, 0x56, 0x65, 0x72, 0x2e, 0x20, 0x31
	DB	0x2e, 0x36, 0x34, 0x00


; Statistics:
; code size:	 6216 (0x1848) bytes ( 4.74%)
;           	 3108 (0x0c24) words
; udata size:	  509 (0x01fd) bytes (39.77%)
; access size:	   22 (0x0016) bytes


	end
