
_main:

;Lcd.c,39 :: 		void main(){
;Lcd.c,41 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Lcd.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,48 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 0
	BRA         L_main0
	DECFSZ      R12, 1, 0
	BRA         L_main0
	DECFSZ      R11, 1, 0
	BRA         L_main0
	NOP
;Lcd.c,50 :: 		}  //  end main
	GOTO        $+0
; end of _main
