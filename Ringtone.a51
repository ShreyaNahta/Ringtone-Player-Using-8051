ORG 0000h                                    ; Set program start address 
  MOV P1, #0x00                              ; Set P1 port to output 
LOOP: 
    ; For 2kHz 
		MOV TH0, #0xFD                       ; Set timer 0 high byte for 2kHz frequency 
		MOV TL0, #0xFD                       ; Set timer 0 low byte for 2kHz frequency 
		SETB TR0                                   ; Start timer 0 
		SETB P1.0                                   ; Turn on buzzer 
		ACALL DELAY                           ; Delay for tone duration 
		CLR P1.0                                     ; Turn off buzzer 
	    ACALL DELAY                               ; Delay for half the timer period 
	    ACALL DELAY 
  
   ; For 3kHz 
		MOV TH0, #0xFA                         ; Set timer 0 high byte for 3kHz frequency 
		MOV TL0, #0xF4                          ; Set timer 0 low byte for 3kHz frequency 
		SETB TR0                                     ; Start timer 0 
		SETB P1.0                                     ; Turn on buzzer 
		ACALL DELAY                             ; Delay for tone duration 
		CLR P1.0                                       ; Turn off buzzer 
		ACALL DELAY                              ; Delay for half the timer period 
		ACALL DELAY 
	 
  ; For 4kHz 
		MOV TH0, #0xF7                  ; Set timer 0 high byte for 4kHz frequency 
		MOV TL0, #0xE8                  ; Set timer 0 low byte for 4kHz frequency 
		SETB TR0                             ; Start timer 0 
		SETB P1.0                             ; Turn on buzzer 
		ACALL DELAY                    ; Delay for tone duration 
		CLR P1.0                                ; Turn off buzzer 
		ACALL DELAY                    ; Delay for half the timer period 
		ACALL DELAY 
  
  ; For 5kHz 
		MOV TH0, #0xF4                  ; Set timer 0 high byte for 5kHz frequency 
		MOV TL0, #0xDC                 ; Set timer 0 low byte for 5kHz frequency 
		SETB TR0                             ; Start timer 0 
		SETB P1.0                              ; Turn on buzzer 
		ACALL DELAY                    ; Delay for tone duration 
		CLR P1.0                                ; Turn off buzzer 
		ACALL DELAY 
		ACALL DELAY                      ; Delay for half the timer period 
 
SJMP LOOP                            ; Jump back to the main loop 
DELAY: 
      MOV R2, #0xFF  
      MOV R3, #0ffh 
      MOV R4, #0ffh                          ; Initialize delay counter 
DELAY_LOOP: 
         DJNZ R3, DELAY_LOOP 
         DJNZ R4, DELAY_LOOP 
         DJNZ R2, DELAY_LOOP        ; Decrement R2 until zero 
    RET                                             ; Return from delay subroutine 
    END                                            ; End of program 