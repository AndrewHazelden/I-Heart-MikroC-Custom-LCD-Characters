#line 1 "C:/Documents and Settings/Owner/Desktop/I heart mikroC/Lcd.c"
#line 23 "C:/Documents and Settings/Owner/Desktop/I heart mikroC/Lcd.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


const char character[] = {0,10,31,31,14,4,0,0};

void CustomChar(char pos_row, char pos_char) {
 char i;
 LCD_Cmd(64);
 for (i = 0; i<=7; i++) LCD_Chr_Cp(character[i]);
 LCD_Cmd(_LCD_RETURN_HOME);
 LCD_Chr(pos_row, pos_char, 0);
}

void main(){

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 LCD_Chr(2,4,'I');
 CustomChar(2,6);
 Lcd_Out(2,8,"mikroC");

 Delay_ms(3000);

}
