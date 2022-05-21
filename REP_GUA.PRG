PROCEDURE REP_GUA(EN)

PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 0
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27

   INKEY()

   IF LI=12
      @  0,  0 SAY 'P gina '+ALLTRIM(STR(PA))
      @  1,  0 SAY DIA
      @  2,  0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "ÚÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿"
      @ 10, 0 SAY "³Ternero ³ F.Entrada ³ Padre ³ Madre  ³ F.Salida ³ D¡as ³ Lts.Lecha ³ Kgs.Alim ³"
      @ 11, 0 SAY "ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄ´"
   ENDIF


   @  LI, 0 SAY "³"
   @  LI, 1 SAY Codigo
   @  LI, 9 SAY "³"
   @  LI,11 SAY Fecent
   @  LI,21 SAY "³"
   @  LI,23 SAY Padre
   @  LI,29 SAY "³"
   @  LI,30 SAY Madre
   @  LI,38 SAY "³"
   @  LI,40 SAY Fecsal
   @  LI,49 SAY "³"
   @  LI,52 SAY Candia PICTURE "999"
   @  LI,56 SAY "³"
   @  LI,60 SAY L_leche PICTURE "9999"
   @  LI,68 SAY "³"
   @  LI,71 SAY K_alime PICTURE "9999"
   @  LI,79 SAY "³"


   SKIP
   LI=LI+1

   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ"
      EJECT
      PA=PA+1
      LI=12
   ENDIF
ENDDO
@ LI, 0 SAY "ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
