PROCEDURE REP_ENF(EN)
PRIVATE LI:=14, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 1
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=14
      @  0,  0 SAY 'P═gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "зддддддддбддддддддддбдддддддддддбдддддддддддддбдддддддддддддддддддбддддддддд©"
      @ 10, 0 SAY "ЁC╒digo  Ё Fecha    Ё  D║as     Ё   Motivos   Ё   Tratamientos    Ё Destino Ё"
      @ 11, 0 SAY "Ё        Ё          цдддддбдддддеддддддбддддддеддддбддддбддддбдддд╢         Ё"
      @ 12, 0 SAY "Ё        Ё          Ё Par Ё Acu Ё 1ero Ё 2do  Ё1eroЁ2do Ё3eroЁ4to Ё         Ё"
      @ 13, 0 SAY "цддддддддеддддддддддедддддедддддеддддддеддддддеддддеддддеддддеддддеддддддддд╢"
   ENDIF
   @  LI, 0 SAY "Ё"
   @  LI, 2 SAY Codvac
   @  LI, 9 SAY "Ё"
   @  LI,11 SAY Fecha
   @  LI,20 SAY "Ё"
   @  LI,22 SAY Diapar PICTURE "999"
   @  LI,26 SAY "Ё"
   @  LI,28 SAY Diaacu PICTURE "999"
   @  LI,32 SAY "Ё"
   @  LI,34 SAY Motiv1
   @  LI,39 SAY "Ё"
   @  LI,41 SAY Motiv2
   @  LI,46 SAY "Ё"
   @  LI,48 SAY Trata1
   @  LI,51 SAY "Ё"
   @  LI,53 SAY Trata2
   @  LI,56 SAY "Ё"
   @  LI,58 SAY Trata3
   @  LI,61 SAY "Ё"
   @  LI,63 SAY Trata4
   @  LI,66 SAY "Ё"
   @  LI,68 SAY Destin
   @  LI,76 SAY "Ё"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @  LI, 0 SAY "юддддддддаддддддддддадддддадддддаддддддаддддддаддддаддддаддддаддддаддддддддды"
      EJECT
      PA=PA+1
      LI=14
   ENDIF
ENDDO
@  LI, 0 SAY "юддддддддаддддддддддадддддадддддаддддддаддддддаддддаддддаддддаддддаддддддддды"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
