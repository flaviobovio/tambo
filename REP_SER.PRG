PROCEDURE REP_SER(EN)
PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 1
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=12
      @  0,  0 SAY 'P═gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "зддддддддбддддддддддбдддддддддддбддддддддддбддддддбддддддбддддддддбддддддддддд©"
      @ 10, 0 SAY "ЁC╒digo  Ё Parto    Ё Serv.Ant. Ё Servicio Ё Toro Ё Ins. Ё Nr.Ser Ё Resultado Ё"
      @ 11, 0 SAY "цддддддддеддддддддддедддддддддддеддддддддддеддддддеддддддеддддддддеддддддддддд╢"
   ENDIF
   @  LI , 0 SAY "Ё"
   @  LI , 2 SAY Codvac
   @  LI , 9 SAY "Ё"
   @  LI ,11 SAY Fecpar
   @  LI ,20 SAY "Ё"
   @  LI ,22 SAY Antser
   @  LI ,32 SAY "Ё"
   @  LI ,34 SAY Fecser
   @  LI ,43 SAY "Ё"
   @  LI ,45 SAY Toro
   @  LI ,50 SAY "Ё"
   @  LI ,52 SAY Insemi
   @  LI ,57 SAY "Ё"
   @  LI ,59 SAY Nroser PICTURE "99"
   @  LI ,66 SAY "Ё"
   @  LI ,68 SAY Result
   @  LI ,78 SAY "Ё"
   SKIP
   LI=LI+1
   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "юддддддддаддддддддддадддддддддддаддддддддддаддддддаддддддаддддддддаддддддддддды"
      EJECT
      PA=PA+1
      LI=12
   ENDIF
ENDDO
@ LI, 0 SAY "юддддддддаддддддддддадддддддддддаддддддддддаддддддаддддддаддддддддаддддддддддды"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
