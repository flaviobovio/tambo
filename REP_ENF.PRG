PROCEDURE REP_ENF(EN)
PRIVATE LI:=14, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 1
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=14
      @  0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "���������������������������������������������������������������������������Ŀ"
      @ 10, 0 SAY "�C�digo  � Fecha    �  D�as     �   Motivos   �   Tratamientos    � Destino �"
      @ 11, 0 SAY "�        �          ���������������������������������������������Ĵ         �"
      @ 12, 0 SAY "�        �          � Par � Acu � 1ero � 2do  �1ero�2do �3ero�4to �         �"
      @ 13, 0 SAY "���������������������������������������������������������������������������Ĵ"
   ENDIF
   @  LI, 0 SAY "�"
   @  LI, 2 SAY Codvac
   @  LI, 9 SAY "�"
   @  LI,11 SAY Fecha
   @  LI,20 SAY "�"
   @  LI,22 SAY Diapar PICTURE "999"
   @  LI,26 SAY "�"
   @  LI,28 SAY Diaacu PICTURE "999"
   @  LI,32 SAY "�"
   @  LI,34 SAY Motiv1
   @  LI,39 SAY "�"
   @  LI,41 SAY Motiv2
   @  LI,46 SAY "�"
   @  LI,48 SAY Trata1
   @  LI,51 SAY "�"
   @  LI,53 SAY Trata2
   @  LI,56 SAY "�"
   @  LI,58 SAY Trata3
   @  LI,61 SAY "�"
   @  LI,63 SAY Trata4
   @  LI,66 SAY "�"
   @  LI,68 SAY Destin
   @  LI,76 SAY "�"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @  LI, 0 SAY "�����������������������������������������������������������������������������"
      EJECT
      PA=PA+1
      LI=14
   ENDIF
ENDDO
@  LI, 0 SAY "�����������������������������������������������������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
