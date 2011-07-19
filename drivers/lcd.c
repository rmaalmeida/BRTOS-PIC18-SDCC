/**
* \file lcd.c
* \brief Alphanumeric LCD main functions
*
* This file contain the main functions of the alphanumeric lcd, such as:
* initialize the lcd, write a character, write a sentence, clear the lcd,etc.
*
**/

#include "../includes/hardware.h"
#include "../brtos/includes/BRTOS.h"

//#include "hardware.h"
//#include "BRTOS.h"

// Defini��es para escolha dos pinos da porta do microcontrolador
#define RS LATEbits.LATE2
#define RW
#define E LATEbits.LATE1
#define controle LATE
#define controle_dir TRISE
#define dados LATD
#define direcao TRISD
#define busy_flag LATDbits.LATD7


// Declara um ponteiro para o bloco de controle do Display LCD
BRTOS_Mutex *LCD;

INT8U task_LCD = 0;



// Declara��o do prot�tipo da fun��o de teste da busy flag
void testa_bit(void);


//Fun��o para adquirir direito exclusivo ao LCD
// Assim que poss�vel colocar recurso de timeout
void acquireLCD(void)
{
  // Aloca o recurso do display LCD
  OSMutexAcquire(LCD);
}

//Fun��o para liberar o display LCD
INT8U releaseLCD(void)
{
  // Libera o recurso do display LCD
  return OSMutexRelease (LCD);
}

// Fun��o para escrita de uma frase no display
void write_lcd(char *string){

  while(*string)
  { 
    testa_bit();
    RS = 1;
//    RW = 0;
    dados = *string;
    E = 1;

    _asm
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
    _endasm;

    E = 0;
    string++;
  }
  
}


// Fun��o para escrita de um n�mero de 2 digitos no display
void write_numero(unsigned int numero)
{
  unsigned int i = 0;
 
  testa_bit();
  RS = 1;
  //RW = 0;
  i = (numero / 10);
  dados = 48 + (unsigned char)i;
  E = 1;
    _asm
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
    _endasm;
  E = 0;
  
  testa_bit();
  RS = 1;
  //RW = 0;
  dados = 48 + (unsigned char)(numero - (unsigned int)(i * 10));
  E = 1;
    _asm
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
    _endasm;
  E = 0;   
}


// Envia um comando para o m�dulo do display
void instr(char comando){
  testa_bit();
  RS = 0;
  //RW = 0;
  dados = comando;
  E = 1;
    _asm
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
    _endasm;
  E = 0;
}


// Envia um caractere para o m�dulo do display
void caractere(char dado)
{
  
  testa_bit();
  RS = 1;
  //RW = 0;
  dados = dado;
  E = 1;
    _asm
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
    _endasm;
  E = 0;
   
}


// Inicializa��o do display para 2 linhas com caracteres de 5x7
// Deslocamento do cursor a direita com cursor apagado
void init_lcd(void){
  dados = 0;
  direcao = 0;
  controle = 0;
  controle_dir = ~0x06;
  instr(0x38);
  DelayTask(20);
  instr(0x38);
  DelayTask(20);
  instr(0x06);
  DelayTask(20);
  instr(0x0c);
  DelayTask(20);
  instr(0x01);  
  DelayTask(20);
}


  // Cria um semaforo com contador = 1, informando que o recurso est� dispon�vel
  // ap�s a inicializa��o
void init_lcd_resource(INT8U priority)
{  
  // Cria um mutex com contador = 1, informando que o recurso est� dispon�vel
  // ap�s a inicializa��o
  // Prioridade m�xima a acessar o recurso = priority
  if (OSMutexCreate(&LCD,priority) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // N�o deveria entrar aqui !!!
    while(1){};
  };
}


// Fun��o de posicionamento do cursor do display
void posiciona(INT8U linha, INT8U coluna)
{
  testa_bit();
  RS = 0;
  //RW = 0;
  switch(linha){
    case 1:
      coluna--;
      dados = 0x80 + coluna;
      break;
    case 2:
      coluna--;
      dados = 0xC0 + coluna;
      break;
    default:
      return;
  }
  E = 1;
    _asm
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
    _endasm;
  E = 0;
  
}


// Fun��o para limpar o display e retornar a primeira posi��o da primeira linha
void limpa_lcd(void)
{
  
  testa_bit();
  RS = 0;
  //RW = 0;
  dados = 0x01;
  E = 1;
    _asm
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
    _endasm;
  E = 0;
  
}


// Fun��o de teste da busy flag
void testa_bit(void)
{
    DelayTask(2);
}