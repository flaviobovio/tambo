PROCEDURE PRESEN()
cls
SELECT CONFIG
IF CONFIG->COLOR
   SETCOLOR(COMUN)
   CLEAR
ELSE
   PRIVATE cnt:=0
   do while cnt < 25
      @ cnt,0 say replicate('�',80)
      cnt++
   enddo
ENDIF
 
@ 1, 1 CLEAR TO 3,14
@ 1, 1 TO 3,14
@ 2, 2 SAY PADC(TAMBO,12)
SETCOLOR(COMUN)

PUBLIC FONDO := SAVESCREEN( 0, 0,23,79)

*@  3, 4 TO 18,74 DOUBLE
@ 11, 8 SAY "������������"
@ 12,13 SAY "��"
@ 13,13 SAY "��"
@ 14,13 SAY "��"
@ 15,13 SAY "��"
@ 16,12 SAY "����"
@ 16,20 SAY "���"
@ 15,21 SAY "��"
@ 14,22 SAY "��������"
@ 13,23 SAY "��"
@ 12,24 SAY "����"
@ 11,25 SAY "��"
@ 13,27 SAY "��"
@ 15,29 SAY "��"
@ 16,29 SAY "���"
@ 16,34 SAY "����"
@ 13,35 SAY "��"
@ 15,35 SAY "��"
@ 14,35 SAY "��"
@ 12,35 SAY "���"
@ 13,45 SAY "��"
@ 14,45 SAY "��"
@ 12,44 SAY "���"
@ 15,45 SAY "��"
@ 16,44 SAY "����"
@ 11,45 SAY "��"
@ 11,35 SAY "��"
@ 13,38 SAY "��"
@ 13,42 SAY "��"
@ 14,40 SAY "��"
@ 12,51 SAY "��"
@ 12,57 SAY "��"
@ 13,51 SAY "�������"
@ 11,50 SAY "��������"
@ 16,50 SAY "���������"
@ 15,51 SAY "��"
@ 14,58 SAY "��"
@ 15,58 SAY "��"
@ 14,51 SAY "��"
@ 12,62 SAY "��"
@ 13,62 SAY "��"
@ 14,62 SAY "��"
@ 15,62 SAY "��"
@ 15,69 SAY "��"
@ 12,69 SAY "��"
@ 16,63 SAY "�������"
@ 11,63 SAY "�������"
@ 13,69 SAY "��"
@ 14,69 SAY "��"
@  5,33 SAY "�����"
@  6,33 SAY "�"
@  5,41 SAY "�"
@  6,41 SAY "�"
@  7,41 SAY "�"
@  8,41 SAY "�"
@  9,41 SAY "�����"
@  7,33 SAY "�����"
@  8,37 SAY "�"
@  9,33 SAY "�����"
@  5,45 SAY "�"
@  6,45 SAY "�"
@  7,45 SAY "�"
@  8,45 SAY "�"

@ 21,20 SAY "   Copyright  OMICRON SI - UM 17/06/00  "
@ 20,19 TO 22,60
INKEY(2)
