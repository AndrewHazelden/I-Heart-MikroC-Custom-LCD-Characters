
_CustomChar:

;Lcd.c,40 :: 		void CustomChar(char pos_row, char pos_char) {
;Lcd.c,42 :: 		LCD_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,43 :: 		for (i = 0; i<=7; i++) LCD_Chr_Cp(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;Lcd.c,44 :: 		LCD_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,45 :: 		LCD_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lcd.c,46 :: 		}
	RETURN      0
; end of _CustomChar

_main:

;Lcd.c,48 :: 		void main(){
;Lcd.c,50 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Lcd.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,56 :: 		LCD_Chr(2,4,'I');                  //Write the letter I on the LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       73
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lcd.c,57 :: 		CustomChar(2,6);                   //Draw the heart shape on the LCD
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       6
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;Lcd.c,58 :: 		Lcd_Out(2,8,"mikroC");             //Write the word mikroC on the LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lcd.c,60 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 0
	BRA         L_main3
	DECFSZ      R12, 1, 0
	BRA         L_main3
	DECFSZ      R11, 1, 0
	BRA         L_main3
	NOP
;Lcd.c,62 :: 		}  //  end main
	GOTO        $+0
; end of _main
