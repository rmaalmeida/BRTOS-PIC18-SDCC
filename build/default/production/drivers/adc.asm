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
	global _InicializaAD
	global _LeValorAD
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_adc__LeValorAD	code
_LeValorAD:
;	.line	32; drivers/adc.c	int LeValorAD(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	35; drivers/adc.c	ADCON0 |= 0b00000010;     //inicia conversao
	MOVLW	0xc2
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVLW	0xc2
	MOVWF	r0x02
	MOVLW	0x0f
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
_00110_DS_:
;	.line	37; drivers/adc.c	while(BitTst(ADCON0,1)); // espera terminar a convers�o;
	MOVLW	0xc2
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	BTFSC	r0x00, 1
	BRA	_00110_DS_
;	.line	39; drivers/adc.c	ADvalor = ADRESH ; // le o resultado
	MOVLW	0xc4
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	CLRF	r0x01
;	.line	40; drivers/adc.c	ADvalor <<= 8;
	MOVF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x00
;	.line	41; drivers/adc.c	ADvalor += ADRESL;
	MOVLW	0xc3
	MOVWF	r0x02
	MOVLW	0x0f
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
;	.line	42; drivers/adc.c	return ADvalor;
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_adc__InicializaAD	code
_InicializaAD:
;	.line	23; drivers/adc.c	void InicializaAD(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	25; drivers/adc.c	BitSet(TRISA,0); //seta o bit 0 como entrada
	MOVLW	0x92
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVLW	0x92
	MOVWF	r0x02
	MOVLW	0x0f
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 0
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
;	.line	27; drivers/adc.c	ADCON0 = 0b00000001; //seleciona o canal 0 e liga o ad
	MOVLW	0xc2
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
;	.line	28; drivers/adc.c	ADCON1 = 0b00001110; //apenas AN0 � analogico, a referencia � baseada na fonte
	MOVLW	0xc1
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x0e
	MOVWF	INDF0
;	.line	29; drivers/adc.c	ADCON2 = 0b10101010; //FOSC /32, Alinhamento � direita e tempo de conv = 12 TAD
	MOVLW	0xc0
	MOVWF	r0x00
	MOVLW	0x0f
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0xaa
	MOVWF	INDF0
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	



; Statistics:
; code size:	  348 (0x015c) bytes ( 0.27%)
;           	  174 (0x00ae) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    4 (0x0004) bytes


	end
