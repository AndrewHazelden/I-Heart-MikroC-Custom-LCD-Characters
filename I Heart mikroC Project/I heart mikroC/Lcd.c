/*
 * Project name:
     I Heart mikroC
 * Copyright:
     (c) Andrew Hazelden, 2010.
 * Revision History:
     2010 - 02 - 14
 * Description:
     This example shows how to write custom characters to an LCD display.
 * Test configuration:
     MCU:             PIC18F4685
     Dev.Board:       EasyPIC5
                      http://www.mikroe.com/en/tools/easypic5/
     Oscillator:      HS, 08.0000 MHz
     Ext. Modules:    16x2 LCD display
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/en/compilers/mikroc/pro/pic/
 * NOTES:

*/

// LCD module connections
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
// End LCD module connections


void main(){

  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off



  Delay_ms(3000);

}  //  end main
