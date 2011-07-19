#include "../brtos/includes/OS_types.h"

void Serial_Init(unsigned int baudrate, INT8U priority);
void Serial_Envia_Caracter(unsigned char data);
void Serial_Envia_Frase(char *string);
void SerialRx(void);
void acquireUART(void);
void releaseUART(void);
