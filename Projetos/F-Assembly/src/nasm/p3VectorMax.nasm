;
; Buscar pelo valor máximo de um vetor e atualizar a RAM 2 com ele
;
; Assuma que:
;    - O endereço 0 da RAM indica a posição inicial de um vetor
;    - O endereço 1 da RAM indica o tamanho do vetor
;    - O vetor é uma região contínua da RAM
;
; Exemplo:
;
;      ----x  RAM[ 0] : 4
;      |      RAM[ 1] : 5   x----
;  comeco     RAM[ 2] : MAX     |
;      |      RAM[ 3] : 1       |
;      -----> RAM[ 4] : 15   ---|---
;             RAM[ 5] : 11      |
;             RAM[ 6] : 15      | Tamanho do vetor = 5
;             RAM[ 7] : 20      |
;             RAM[ 8] : 12   ---|---
;             RAM[ 9] : 0
;             RAM[10] : 11
;             RAM[11] : 2
;===============================================


leaw $1, %A
movw %A, $S     ; S = 1

LOOP:

leaw $4, %A     ; A = 4
movw (%A), %D   ; D = RAM[4]

addw %A, %S, %A ; A = 4 + 1  ; (%A) = RAM[5]

subw (%A),%D, %D ; D = RAM[5] - RAM[4] 
jl %D            ; Se for menor que 0, RAM[4] > RAM[5]
nop

leaw $2, %A
movw %D, (%A)

incw %S

leaw $LOOP, %A
jmp
nop















