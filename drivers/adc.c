// -----------------------------------------------------------------------
//   Copyright (C) Rodrigo Almeida 2010
// -----------------------------------------------------------------------
//   Arquivo: adc.c
//            Biblioteca do conversor AD para o PIC18F4550
//   Autor:   Rodrigo Maximiano Antunes de Almeida
//            rodrigomax at unifei.edu.br
//   Licensa: GNU GPL 2
// -----------------------------------------------------------------------
//   This program is free software; you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation; version 2 of the License.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
// -----------------------------------------------------------------------

#include "adc.h"
#include "basico.h"

 void InicializaAD(void)
{
    BitSet(TRISA,0); //seta o bit 0 como entrada
    
    ADCON0 = 0b00000001; //seleciona o canal 0 e liga o ad
    ADCON1 = 0b00001110; //apenas AN0 � analogico, a referencia � baseada na fonte
    ADCON2 = 0b10101010; //FOSC /32, Alinhamento � direita e tempo de conv = 12 TAD
}

int LeValorAD(void)
{
    unsigned int ADvalor;
    ADCON0 |= 0b00000010;     //inicia conversao

    while(BitTst(ADCON0,1)); // espera terminar a convers�o;

    ADvalor = ADRESH ; // le o resultado
    ADvalor <<= 8;
    ADvalor += ADRESL;
    return ADvalor;
}