/**
* \file lcd.h
* \brief Alphanumeric LCD function prototypes.
*
*
**/

void write_lcd(char *string);
void instr(char comando);
void caractere(char dado);
void write_numero(unsigned int numero);
void init_lcd(void);
void init_lcd_resource(void);
void posiciona(unsigned char linha, unsigned char coluna);
