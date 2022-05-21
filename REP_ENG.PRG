PROCEDURE REP_ENG(EN)
PRIVATE LI:=14, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 3
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=14
      @  0,  0 SAY 'P═gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "зддддддддбддддддддбдддддддддддбдддддддддддддбдддддддддддддддддддбддддддддд©"
      @ 10, 0 SAY "ЁTernero ЁFecha   Ё  D║as     Ё   Motivos   Ё   Tratamientos    Ё Destino Ё"
      @ 11, 0 SAY "Ё        Ё        цдддддбдддддеддддддбддддддеддддбддддбддддбдддд╢         Ё"
      @ 12, 0 SAY "Ё        Ё        Ё Par Ё Acu Ё 1ero Ё 2do  Ё1eroЁ2do Ё3eroЁ4to Ё         Ё"
      @ 13, 0 SAY "цддддддддеддддддддедддддедддддеддддддеддддддеддддеддддеддддеддддеддддддддд╢"
   ENDIF
   @  LI, 0 SAY "Ё"
   @  LI, 1 SAY Codigo
   @  LI, 9 SAY "Ё"
   @  LI,10 SAY Fecha
   @  LI,18 SAY "Ё"
   @  LI,20 SAY Diapar PICTURE "999"
   @  LI,24 SAY "Ё"
   @  LI,26 SAY Diaacu PICTURE "999"
   @  LI,30 SAY "Ё"
   @  LI,32 SAY Motiv1
   @  LI,37 SAY "Ё"
   @  LI,39 SAY Motiv2
   @  LI,44 SAY "Ё"
   @  LI,46 SAY Trata1
   @  LI,49 SAY "Ё"
   @  LI,51 SAY Trata2
   @  LI,54 SAY "Ё"
   @  LI,56 SAY Trata3
   @  LI,59 SAY "Ё"
   @  LI,61 SAY Trata4
   @  LI,64 SAY "Ё"
   @  LI,66 SAY Destin
   @  LI,74 SAY "Ё"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @  LI, 0 SAY "юддддддддаддддддддадддддадддддаддддддаддддддаддддаддддаддддаддддаддддддддды"
      EJECT
      PA=PA+1
      LI=14
   ENDIF
ENDDO


@  LI, 0 SAY "юддддддддаддддддддадддддадддддаддддддаддддддаддддаддддаддддаддддаддддддддды"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
