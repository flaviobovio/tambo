PROCEDURE REP_GUA(EN)

PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 0
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27

   INKEY()

   IF LI=12
      @  0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "������������������������������������������������������������������������������Ŀ"
      @ 10, 0 SAY "�Ternero � F.Entrada � Padre � Madre  � F.Salida � D�as � Lts.Lecha � Kgs.Alim �"
      @ 11, 0 SAY "������������������������������������������������������������������������������Ĵ"
   ENDIF


   @  LI, 0 SAY "�"
   @  LI, 1 SAY Codigo
   @  LI, 9 SAY "�"
   @  LI,11 SAY Fecent
   @  LI,21 SAY "�"
   @  LI,23 SAY Padre
   @  LI,29 SAY "�"
   @  LI,30 SAY Madre
   @  LI,38 SAY "�"
   @  LI,40 SAY Fecsal
   @  LI,49 SAY "�"
   @  LI,52 SAY Candia PICTURE "999"
   @  LI,56 SAY "�"
   @  LI,60 SAY L_leche PICTURE "9999"
   @  LI,68 SAY "�"
   @  LI,71 SAY K_alime PICTURE "9999"
   @  LI,79 SAY "�"


   SKIP
   LI=LI+1

   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "��������������������������������������������������������������������������������"
      EJECT
      PA=PA+1
      LI=12
   ENDIF
ENDDO
@ LI, 0 SAY "��������������������������������������������������������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
