PROCEDURE REP_TRA(EN)
PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 24
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=12
      @  0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "�������������������������������Ŀ"
      @ 10, 0 SAY "� C�digo �     Tratamiento      �"
      @ 11, 0 SAY "�������������������������������Ĵ"
   ENDIF
   @  LI, 0 SAY "�"
   @  LI, 4 SAY Codtra
   @  LI, 9 SAY "�"
   @  LI,11 SAY Contra
   @  LI,32 SAY "�"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "���������������������������������"
      EJECT
      PA=PA+1
      LI=12
   ENDIF
ENDDO
@ LI, 0 SAY "���������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
