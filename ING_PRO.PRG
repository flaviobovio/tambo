PROCEDURE ING_PRO()
CLS
SELECT CONFIG
PRIVATE NU:=5, ULTTOM:=PRODUC, CO
SELECT TAMBO
PRIVATE ORDEN := INDEXORD()

@  0, 0 TO 23,79 DOUBLE
@  0, 2 SAY " INGRESO DE DATOS DE PRODUCCION "
IF ULTTOM > CTOD("")
   SETCOLOR(INVER)
   @4,1 SAY PADC("EL ULTIMO DATO DE PRODUCCION FUE INGRESADO EL "+DATES(ULTTOM,4),78)
   SETCOLOR(COMUN)
ENDIF
@  6,15 TO 14,62 DOUBLE
@  8,18 PROMPT "1 - CONTINUAR CON EL MISMO CONTROL LECHERO"
@ 10,18 PROMPT "2 - COMENZAR UN NUEVO CONTROL LECHERO     "
@ 12,18 PROMPT "3 - VOLVER AL MENU PRINCIPAL              "
MENU TO CO


do case
case co = 1
   wcontro = config->produc
case co = 2
   MARCO(16, 9,20,69 )
   @18,13  SAY 'BORRANDO DATOS DEL CONTROL ANTERIOR. ESPERE UN MOMENTO'
   SET ORDER TO 0
   R=RECNO()
   REPLACE ULTPRO WITH 0 ALL
   GO R
   SET ORDER TO ORDEN
   SELECT CONFIG
   REPLACE PRODUC WITH DIA
   SELECT PRODUC
   wcontro = dia
other
   retu
endc


@  4, 1 CLEAR TO 20,78


@  2,17 SAY "ÉÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍ¸"
@  3,17 SAY "º  Vaca  ³ 1øToma ³ 2øToma ³ 3øToma ³ Total  ³Score Corp.³"
@  4,17 SAY "ÇÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄ´"

SET CURSOR ON
PRIVATE wCODVAC, wTOMA1, wTOMA2, wTOMA3, wSCOREC
SELECT PRODUC
SET FILTER TO contro = wcontro
DO WHILE .T.
   wCODVAC=SPACE(8)
   wTOMA1=0
   wTOMA2=0
   wTOMA3=0
   @  NU,17 CLEAR TO NU,75
   @  NU  ,17 SAY "º        ³        ³        ³        ³        ³           ³"
   @  NU+1,17 SAY "ÈÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍ¾"
   @  NU,18 GET wCODVAC PICTURE '@!' VALID EXI_PRO (wCODVAC)
   READ
   wSCOREC=TAMBO->SCOREC
   SEEK wCODVAC
   IF !FOUND()
      @ NU,29 GET wTOMA1 PICTURE '99.9'
      @ NU,67 GET wSCOREC PICTURE '9.9' VALID wSCOREC <=5 .AND. ;
                                        Int (wSCOREC*2)=wSCOREC*2
      READ
      IF ACEPTA()
         APPEND BLANK
         REPLACE CODVAC WITH wCODVAC, TOMA1 WITH wTOMA1, TOTAL WITH wTOMA1
         repl contro with wcontro
         T = wTOMA1
         SELECT TAMBO
         SEEK wCODVAC
         SET ORDER TO 2
         REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)+(T*30),;
                 ULTPRO WITH T
         REPLACE SCOREC WITH wSCOREC
         SET ORDER TO 1
         SELECT PRODUC
      ELSE
         LOOP
      ENDIF
   ELSE
      SETCOLOR(GETS)
      @ NU,67 SAY wSCOREC PICTURE '9.9'
      SETCOLOR(COMUN)
      ***   TOMA 1   ***
      IF TOMA1>0
         SETCOLOR(GETS)
         @ NU,29 SAY TOMA1 PICTURE '99.9'
         SETCOLOR(COMUN)
         ***   TOMA 2   ***
         IF TOMA2>0
            SETCOLOR(GETS)
            @ NU,38 SAY TOMA2 PICTURE '99.9'
            SETCOLOR(COMUN)

            ***   TOMA 3   ***
            IF TOMA3>0
               SETCOLOR(GETS)
               @ NU,47 SAY TOMA3 PICTURE '99.9'
               SETCOLOR(COMUN)
            ELSE
               @ NU,47 GET wTOMA3 PICTURE '99.9'
               READ
               IF ACEPTA()
                  REPLACE TOMA3 WITH wTOMA3, TOTAL WITH TOMA1+TOMA2+wTOMA3
                  T = TOMA1+TOMA2+wTOMA3
                  SELECT TAMBO
                  SEEK wCODVAC
                  SET ORDER TO 2
                  REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)+(T*30),;
                          ULTPRO WITH T
                  SET ORDER TO 1
                  SELECT PRODUC
               ELSE
                  LOOP
               ENDIF
            ENDIF
         ELSE
            @ NU,38 GET wTOMA2 PICTURE '99.9'
            READ
            IF ACEPTA()
               REPLACE TOMA2 WITH wTOMA2, TOTAL WITH TOMA1+wTOMA2
               T = TOMA1+wTOMA2
               SELECT TAMBO
               SEEK wCODVAC
               SET ORDER TO 2
               REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)+(T*30),;
                       ULTPRO WITH T
               SET ORDER TO 1
               SELECT PRODUC
            ELSE
               LOOP
            ENDIF
         ENDIF
      ELSE
         @ NU,29 GET wTOMA1 PICTURE '99.9'
         READ
         IF ACEPTA()
            REPLACE TOMA1 WITH wTOMA1, TOTAL WITH wTOMA1
            T = wTOMA1
            SELECT TAMBO
            SEEK wCODVAC
            SET ORDER TO 2
            REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)+(T*30),;
                    ULTPRO WITH T
            SET ORDER TO 1
            SELECT PRODUC
         ELSE
            LOOP
         ENDIF
      ENDIF


   ENDIF

   SETCOLOR(GETS)
   @ NU,56 SAY TOTAL PICTURE '99.9'
   SETCOLOR(COMUN)


   COMMIT
   MENSAJE('<Enter> CONTINUAR INGRESANDO      <F> FINALIZAR')

   Z=0
   DO WHILE Z#13 .AND. UPPER(CHR(Z))#'F'
      Z=INKEY()
   ENDDO

   @ 24, 0 CLEAR

   IF Z # 13
      EXIT
   ENDIF
   IF NU<=17
      NU=NU+1
   ELSE
     SCROLL( 5,17,22,75, 1)
   ENDIF

ENDDO

SET FILTER TO
SET CURSOR OFF
SELECT CONFIG
REPLACE PRODUC WITH DIA
SELECT TAMBO
SET ORDER TO ORDEN
