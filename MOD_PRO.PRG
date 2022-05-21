PROCEDURE mod_PRO()
CLS
SELECT CONFIG
PRIVATE NU:=5, ULTTOM:=PRODUC, CO
SELECT TAMBO
PRIVATE ORDEN := INDEXORD()

@  0, 0 TO 23,79 DOUBLE
@  0, 2 SAY " MODIFICACION DE DATOS DE PRODUCCION "

@  2,17 SAY "ÉÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÑÍÍÍÍÍ»"
@  3,17 SAY "º  Vaca  ³ 1øToma ³ 2øToma ³ 3øToma ³ Total  ³Acum.³Scoreº"
@  4,17 SAY "ÇÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄ¶"

SET CURSOR ON
PRIVATE wCODVAC

SELECT PRODUC
SET FILTER TO contro=wcontro
DO WHILE .T.
   wCODVAC=SPACE(8)

   @  NU,17 CLEAR TO NU,78
   @  NU  ,17 SAY "º        ³        ³        ³        ³        ³     ³     º"
   @  NU+1,17 SAY "ÈÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÏÍÍÍÍÍ¼"
   @  NU,18 GET wCODVAC PICTURE '@!' VALID wCODVAC=SPACE(8) ;
   .OR. EXI_PRO(wCODVAC)
   READ
   IF wCODVAC = SPACE(8)
      EXIT
   ENDIF

   SEEK wCODVAC
   @ NU,29 GET TOMA1 PICTURE '99.9' WHEN TOMA1 > 0
   @ NU,38 GET TOMA2 PICTURE '99.9' WHEN TOMA2 > 0
   @ NU,47 GET TOMA3 PICTURE '99.9' WHEN TOMA3 > 0
   READ

   T = TOMA1+TOMA2+TOMA3
   SETCOLOR(GETS)
   @ NU,56 SAY T PICTURE '99.9'
   SETCOLOR(COMUN)

   REPLACE TOTAL WITH T

   SELECT TAMBO
   SEEK wCODVAC
   SET ORDER TO 2
   REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)+(T*30),;
           ULTPRO WITH T
   @ nu,63  get acupro picture "99999"
   @ nu,70  get scorec picture "9.9"  VALID SCOREC <=5 .AND. ;
                                      Int (SCOREC*2)=SCOREC*2
   READ
   SET ORDER TO 1
   SELECT PRODUC


   COMMIT

   @ 24, 0 CLEAR

   IF NU<=17
      NU=NU+1
   ELSE
     SCROLL( 5,17,22,63, 1)
   ENDIF

ENDDO
SET FILTER TO
SET CURSOR OFF
SELECT CONFIG
REPLACE PRODUC WITH DIA
SELECT TAMBO
SET ORDER TO ORDEN


 
