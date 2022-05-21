PROCEDURE REP_PRO(EN)

PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 1
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=12
      @  0, 0 SAY 'P═gina '+ALLTRIM(STR(PA))
      @  1, 0 SAY DIA
      @  2, 0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "зддддддддбддддддбддддддбддддддбдддддбдддддддбддддддддбдддддддбддддддддддддддд©"
      @ 10, 0 SAY "ЁCODIGO  Ё1ЬTomaЁ2ЬTomaЁ3ЬTomaЁTOTALЁD.Lact.ЁNЬPartosЁ Tacto ЁScore Corporal Ё"
      @ 11, 0 SAY "цддддддддеддддддеддддддеддддддедддддедддддддеддддддддедддддддеддддддддддддддд╢"
   ENDIF
   @ LI, 0 SAY "Ё"
   @ LI, 1 SAY Codvac
   @ LI, 9 SAY "Ё"
   @ LI,11 SAY Toma1 PICTURE "@z 99.9"
   @ LI,16 SAY "Ё"
   @ LI,18 SAY Toma2 PICTURE "@z 99.9"
   @ LI,23 SAY "Ё"
   @ LI,25 SAY Toma3 PICTURE "@z 99.9"
   @ LI,30 SAY "Ё"
   @ LI,32 SAY Total PICTURE "@z 99.9"
   @ LI,36 SAY "Ё"
   @ LI,39 SAY tambo->dialac PICTURE "@z 999"
   @ LI,44 SAY "Ё"
   @ LI,48 SAY tambo->nropar PICTURE "@z 99"
   @ LI,53 SAY "Ё"
   @ LI,57 SAY tambo->result PICTURE "9"
   @ LI,61 SAY "Ё"
   @ LI,67 SAY tambo->scorec PICTURE "@z 9.9"
   @ LI,77 SAY "Ё"

   SKIP
   LI++
   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "юддддддддаддддддаддддддаддддддадддддадддддддаддддддддадддддддаддддддддддддддды"
      EJECT
      PA=PA+1
      LI=12
   ENDIF

ENDDO

@ LI, 0 SAY "юддддддддаддддддаддддддаддддддадддддадддддддаддддддддадддддддаддддддддддддддды"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)



