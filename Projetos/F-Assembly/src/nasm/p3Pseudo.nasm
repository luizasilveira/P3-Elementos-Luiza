;---------------------------------------------------------
; Transcreva o pseudocódigo a seguir para assembly do Z01.1:
;
; WHILE(True):
;    if ( RAM[1] == 1 && RAM[2] == 2 ):
;        RAM[5] = 1
;    else
;        RAM5[5] = !RAM[1]
;
;---------------------------------------------------------

WHILE:

    IF:

        leaw $1, %A 
        movw %A,%S        ;S = 1
        subw (%A),%S,%D   ;D = RAM[1] - 1

        leaw $ELSE,%A     
        jne %D            ; Se D != 0, vai para o ELSE
        nop

        leaw $2, %A       
        movw %A,%D       ;D = 2
        subw (%A),%D,%D  ;D = RAM[2] - 2

        leaw $ELSE,%A
        jne %D           ; Se D != 0, vai para o ELSE
        nop

        leaw $5,%A       ; Se o IF for verdadeiro, salva 1 na RAM[5]
        movw %S, (%A)

        leaw $LOOP,%A    ; Volta para o WHILE
        jmp
        nop


    ELSE:

        leaw $1,%A
        movw (%A),%S
        notw %S
        leaw %5,%A
        movw %S,(%A)

    LOOP:    

        leaw $WHILE, %A 
        jmp
        nop



