PROCEDURE PRESEN()
cls
SELECT CONFIG
IF CONFIG->COLOR
   SETCOLOR(COMUN)
   CLEAR
ELSE
   PRIVATE cnt:=0
   do while cnt < 25
      @ cnt,0 say replicate('°',80)
      cnt++
   enddo
ENDIF
 
@ 1, 1 CLEAR TO 3,14
@ 1, 1 TO 3,14
@ 2, 2 SAY PADC(TAMBO,12)
SETCOLOR(COMUN)

PUBLIC FONDO := SAVESCREEN( 0, 0,23,79)

*@  3, 4 TO 18,74 DOUBLE
@ 11, 8 SAY "ßßßßßßßßßßßß"
@ 12,13 SAY "ßß"
@ 13,13 SAY "ßß"
@ 14,13 SAY "ßß"
@ 15,13 SAY "ßß"
@ 16,12 SAY "ßßßß"
@ 16,20 SAY "ßßß"
@ 15,21 SAY "ßß"
@ 14,22 SAY "ßßßßßßßß"
@ 13,23 SAY "ßß"
@ 12,24 SAY "ßßßß"
@ 11,25 SAY "ßß"
@ 13,27 SAY "ßß"
@ 15,29 SAY "ßß"
@ 16,29 SAY "ßßß"
@ 16,34 SAY "ßßßß"
@ 13,35 SAY "ßß"
@ 15,35 SAY "ßß"
@ 14,35 SAY "ßß"
@ 12,35 SAY "ßßß"
@ 13,45 SAY "ßß"
@ 14,45 SAY "ßß"
@ 12,44 SAY "ßßß"
@ 15,45 SAY "ßß"
@ 16,44 SAY "ßßßß"
@ 11,45 SAY "ßß"
@ 11,35 SAY "ßß"
@ 13,38 SAY "ßß"
@ 13,42 SAY "ßß"
@ 14,40 SAY "ßß"
@ 12,51 SAY "ßß"
@ 12,57 SAY "ßß"
@ 13,51 SAY "ßßßßßßß"
@ 11,50 SAY "ßßßßßßßß"
@ 16,50 SAY "ßßßßßßßßß"
@ 15,51 SAY "ßß"
@ 14,58 SAY "ßß"
@ 15,58 SAY "ßß"
@ 14,51 SAY "ßß"
@ 12,62 SAY "ßß"
@ 13,62 SAY "ßß"
@ 14,62 SAY "ßß"
@ 15,62 SAY "ßß"
@ 15,69 SAY "ßß"
@ 12,69 SAY "ßß"
@ 16,63 SAY "ßßßßßßß"
@ 11,63 SAY "ßßßßßßß"
@ 13,69 SAY "ßß"
@ 14,69 SAY "ßß"
@  5,33 SAY "ßßßßß"
@  6,33 SAY "ß"
@  5,41 SAY "ß"
@  6,41 SAY "ß"
@  7,41 SAY "ß"
@  8,41 SAY "ß"
@  9,41 SAY "ßßßßß"
@  7,33 SAY "ßßßßß"
@  8,37 SAY "ß"
@  9,33 SAY "ßßßßß"
@  5,45 SAY "ß"
@  6,45 SAY "ß"
@  7,45 SAY "ß"
@  8,45 SAY "ß"

@ 21,20 SAY "   Copyright  OMICRON SI - UM 17/06/00  "
@ 20,19 TO 22,60
INKEY(2)
