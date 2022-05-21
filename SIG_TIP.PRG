FUNCTION SIG_TIP( C )
AADD(Con,SPACE(2))
DO CASE
   ***   CODVAC, MADRE, SEXO   ***
   CASE C=1 .OR. C=5 .OR. C=9
      Pic='@! XXXXXXXX'
      AADD(Val,SPACE(8))

   ***  RC  ***
   CASE C = 2
      Pic='@! XXXXXXX'
      AADD(Val,SPACE(7))

   ***   PADRE, CODRFL, TORO, INSEMI   ***
   CASE C=4 .OR. C=7 .OR. C=13 .OR. C=14
      Pic='@! XXXX'
      AADD(Val,SPACE(4))

   ***   FECNAC, FECPAR, FECSER, FECTAC, FPAPRO, FINLAC   ***
   CASE C=3 .OR. C=8 .OR. C=12 .OR. C=16 .OR. C=18 .OR. C=19
      Pic='  /  /  '
      AADD(Val,CTOD(""))
   ***   REFILA, TIPPAR, RESULT   ***
   CASE C=6 .OR. C=10 .OR. C=17
      Pic='@! A'
      AADD(Val,SPACE(1))
   ***   NROPAR, NROSER, parpar, PARSER, PARPRE, DIALAC, ANTLAC, DIASEC,
   ***   ANTSEC, DIAGES
   CASE C=11 .OR. C=15 .OR. C=20 .OR. C=21 .OR. C=22 .OR. C=23 .OR.;
        C=24 .OR. C=25 .OR. C=26 .OR. C=27
      Pic='99999999'
      AADD(Val,0)

   ***  ULTPRO  ***
   CASE C=28
      Pic='99.9'
      AADD(Val,0)

   ***  ACUPRO  ***
   CASE C=29
      Pic='99999'
      AADD(Val,0)

   ***  SCOREC  ***
   CASE C=30
      Pic='9.9'
      AADD(Val,0)

ENDCASE
