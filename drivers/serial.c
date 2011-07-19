#include "../brtos/includes/BRTOS.h"

BRTOS_Mutex *SerialResource;

// Declara uma estrutura de fila
OS_QUEUE SerialRXBuffer;
// Declara um ponteiro para o bloco de controle da Porta Serial
BRTOS_Queue  *QSerialRX;


// Declara uma estrutura de fila
OS_QUEUE SerialTXBuffer;
// Declara um ponteiro para o bloco de controle da Porta Serial
BRTOS_Queue  *QSerialTX;

// Declara um ponteiro para o bloco de controle da porta serial
BRTOS_Sem   *SerialTX;


static INT8U WaitingSerialTXBuffer = 0;

void Serial_Init(unsigned int baudrate, INT8U priority)
{
    INT32U ulBaud;

    /* Calculate the baud rate generator constant.
    SPBRG = ( (FOSC / Desired Baud Rate) / 16 ) - 1 */
    ulBaud = configCPU_CLOCK_HZ / baudrate;
    ulBaud /= (INT32U) 16;
    ulBaud -= (INT32U) 1;

    /* Start with config registers cleared, so we can just set the wanted
    bits. */
    TXSTA = 0;
    RCSTA = 0;

    /* Set the baud rate generator using the above calculated constant. */
    SPBRG = (INT8U) ulBaud;

    /* Setup the IO pins to enable the USART IO. */
    TRISCbits.TRISC6 = 0;
    TRISCbits.TRISC7 = 1;

    /* Setup Tx configuration. */
    TXSTAbits.BRGH = 1;
    TXSTAbits.TXEN=1;

    /* Setup Rx configuration. */
    RCSTAbits.SPEN = 1;
    RCSTAbits.CREN = 1;

    /* Enable the Rx interrupt now, the Tx interrupt will get enabled when
    we have data to send. */
    PIE1bits.RCIE = 1;

  // Cria um mutex com contador = 1, informando que o recurso está disponível
  // após a inicialização
  // Prioridade máxima a acessar o recurso = priority
  if (OSMutexCreate(&SerialResource,priority) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // Não deveria entrar aqui !!!
    while(1){};
  };

  if (OSQueueCreate(&SerialTXBuffer,64,&QSerialTX) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // Não deveria entrar aqui !!!
    while(1){};
  };

  if (OSQueueCreate(&SerialRXBuffer,64,&QSerialRX) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // Não deveria entrar aqui !!!
    while(1){};
  };

  if (OSSemCreate(0, &SerialTX) != ALLOC_EVENT_OK)
  {
    // Oh Oh
    // Não deveria entrar aqui !!!
    while(1){};
  };

}


void Serial_Envia_Caracter(CHAR8 newdata)
{
    while (OSWQueue(&SerialTXBuffer, (INT8U)newdata) == BUFFER_UNDERRUN)
    {
        OSEnterCritical();
        WaitingSerialTXBuffer = 1;
        OSExitCritical();
        (void)OSSemPend(SerialTX,0);
    }

    OSEnterCritical();
    WaitingSerialTXBuffer = 0;
    OSExitCritical();

    if (PIE1bits.TXIE != 1)
    {
        PIE1bits.TXIE = 1;
    }
}



void Serial_Envia_Frase(char *string)
{
  while(*string)
  {
    Serial_Envia_Caracter(*string);
    string++;
  }
}


void SerialRxHandler(void)
{
    CHAR8 caracter;

    // Get the received character
    caracter = RCREG;

    // Clear any overrun errors
    if( RCSTAbits.OERR )
    {
        RCSTAbits.CREN = 0;
        RCSTAbits.CREN = 1;
    }

    if (OSQueuePost(QSerialRX,caracter) == BUFFER_UNDERRUN)
    {
      // Problema: Estouro de buffer
      (void)OSCleanQueue(QSerialRX);
    }
}

void SerialRx(void)
{
      // ************************
      // Entrada de interrupção
      // ************************
      OS_SAVE_ISR();
      OS_INT_ENTER();

      // Interrupt handling
      SerialRxHandler();

      #if (NESTING_INT == 1)
      OS_ENABLE_NESTING();
      #endif

      // ************************
      // Interrupt Exit
      // ************************
      OS_INT_EXIT();
      OS_RESTORE_ISR();
      // ************************
}

void SerialTxHandler(void)
{
    INT8U caracter;

    // Transmit new data
    if (OSRQueue(&SerialTXBuffer, (INT8U*)&caracter) == NO_ENTRY_AVAILABLE)
    {
        PIE1bits.TXIE = 0;
        if (WaitingSerialTXBuffer == 1)
        {
            (void)OSSemPost(SerialTX);
        }
    }else
    {
        TXREG=caracter;
    }
}

void SerialTx(void)
{
      // ************************
      // Entrada de interrupção
      // ************************
      OS_SAVE_ISR();
      OS_INT_ENTER();

      // Interrupt handling
      SerialTxHandler();

      #if (NESTING_INT == 1)
      OS_ENABLE_NESTING();
      #endif

      // ************************
      // Interrupt Exit
      // ************************
      OS_INT_EXIT();
      OS_RESTORE_ISR();
      // ************************
}

//Função para adquirir direito exclusivo a porta serial
// Assim que possível colocar recurso de timeout
void acquireUART(void)
{
  // Aloca o recurso da porta serial
  OSMutexAcquire(SerialResource);
}

//Função para liberar a porta serial
void releaseUART(void)
{
  // Libera o recurso da porta serial
  OSMutexRelease(SerialResource);
}