PROCEDURE REP_ENG(EN)
PRIVATE LI:=14, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 3
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=14
      @  0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "�������������������������������������������������������������������������Ŀ"
      @ 10, 0 SAY "�Ternero �Fecha   �  D�as     �   Motivos   �   Tratamientos    � Destino �"
      @ 11, 0 SAY "�        �        ���������������������������������������������Ĵ         �"
      @ 12, 0 SAY "�        �        � Par � Acu � 1ero � 2do  �1ero�2do �3ero�4to �         �"
      @ 13, 0 SAY "�������������������������������������������������������������������������Ĵ"
   ENDIF
   @  LI, 0 SAY "�"
   @  LI, 1 SAY Codigo
   @  LI, 9 SAY "�"
   @  LI,10 SAY Fecha
   @  LI,18 SAY "�"
   @  LI,20 SAY Diapar PICTURE "999"
   @  LI,24 SAY "�"
   @  LI,26 SAY Diaacu PICTURE "999"
   @  LI,30 SAY "�"
   @  LI,32 SAY Motiv1
   @  LI,37 SAY "�"
   @  LI,39 SAY Motiv2
   @  LI,44 SAY "�"
   @  LI,46 SAY Trata1
   @  LI,49 SAY "�"
   @  LI,51 SAY Trata2
   @  LI,54 SAY "�"
   @  LI,56 SAY Trata3
   @  LI,59 SAY "�"
   @  LI,61 SAY Trata4
   @  LI,64 SAY "�"
   @  LI,66 SAY Destin
   @  LI,74 SAY "�"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @  LI, 0 SAY "���������������������������������������������������������������������������"
      EJECT
      PA=PA+1
      LI=14
   ENDIF
ENDDO


@  LI, 0 SAY "���������������������������������������������������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
