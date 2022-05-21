FUNCTION VAL_VAL( C, V )
PRIVATE R:=.F.
D=ALLTRIM(D)
***   CODVAC, PADRE, MADRE, CODRFL, SEXO, TORO, INSEMI, REFILA,
***   TIPPAR, RESULT, MARENF   ***
*IF C=1 .OR. C=3 .OR. C=4 .OR. C=6 .OR. C=8 .OR. C=12 .OR. C=13 .OR.;
*   C=5 .OR.  C=9 .OR. C=16 .OR. C=27
*   IF D='#' .OR. D='='
*      R=.T.
*   ENDIF
***   FECNAC, FECPAR, FECSER, FECTAC, FINLAC, NROPAR, NROSER, PARSER,   ***
***   PARPRE, DIALAC, ANTLAC, DIASEC, ANTSEC, DIAGES, ULTPRO, ACUPRO   ***
*ELSEIF C=2 .OR. C=7 .OR. C=11 .OR. C=15 .OR. C=17 .OR. C=10 .OR. C=14 .OR.;
*       C=18 .OR. C=19 .OR.  C=20 .OR. C=21 .OR. C=22 .OR. C=23 .OR.;
*       C=24 .OR.  C=25 .OR. C=26
*   IF D='#'.OR.D='='.OR.D='<'.OR.D='<='.OR.D='>'.OR.D='>='
*      R=.T.
*   ENDIF
*ENDIF
IF C=27 .AND. V=

RETURN R