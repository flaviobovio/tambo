PROCEDURE REP_MOT(EN)
PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 23
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=12
      @   0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @   1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "���������������������������������Ŀ"
      @ 10, 0 SAY "� C�digo �      Enfermedad        �"
      @ 11, 0 SAY "���������������������������������Ĵ"
   ENDIF
   @  LI, 0 SAY "�"
   @  LI, 2 SAY Codmot
   @  LI, 9 SAY "�"
   @  LI,11 SAY Conmot
   @  LI,34 SAY "�"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "�����������������������������������"
      EJECT
      PA=PA+1
      LI=12
   ENDIF
ENDDO
@ LI, 0 SAY "�����������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
