PROCEDURE INF_SEM()
PRIVATE FECO, ADOR, ADSA, ADCI, ADTO, X:=0, LIN, L:=8
SELECT TOROS
DO WHILE .T.

   CLS
   ADOR=0
   ADSA=0
   ADCI=0
   LIN={}

   AADD(LIN,"ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป")
   AADD(LIN,"บ                INFORME SOBRE EL STOCK DE SEMEN AL "+DTOC(DIA)+"                   บ")
   AADD(LIN,"วฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ")
   AADD(LIN,"บ   TORO   ณ   FECHA DE    ณ                      DOSIS                        บ")
   AADD(LIN,"บ          ณ   COMPRA      รฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤถ")
   AADD(LIN,"บ          ณ               ณ COMPRADAS  ณ PROVEEDOR  ณ"+PADC(TAMBO,12)+"ณ   TOTAL    บ")
   AADD(LIN,"วฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤถ")
   GO TOP
   DO WHILE !EOF()
      IF DTOTAL > 0
         AADD(LIN,"บ   "+TORO+"   ณ   "+DTOC(FECCOM)+"    ณ   "+NUMENT(Dorigi,6)+"   ณ   "+;
                   NUMENT(Dciavt,6)+"   ณ   "+NUMENT(Dsaifi,6)+"   ณ   "+NUMENT(Dtotal,6)+"   บ" )
         ADOR = ADOR + DORIGI
         ADCI = ADCI + DCIAVT
         ADSA = ADSA + DSAIFI
         L++
      ENDIF
      SKIP
   ENDDO
   ADTO = ADSA+ ADCI

   AADD(LIN,"วฤฤฤฤฤฤฤฤฤฤมฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤถ" )

   AADD(LIN,"บ         TOTALES          ณ   "+NUMENT(ADOR,6)+"   ณ   "+;
             NUMENT(ADCI,6)+"   ณ   "+NUMENT(ADSA,6)+"   ณ   "+NUMENT(ADTO,6)+"   บ" )

   AADD(LIN,"ศออออออออออออออออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออผ" )



   MOSTRAR( LIN )
   MENSAJE('< I > INGRESAR DATOS    < M > MODIFICAR DATOS    < Enter > CONTINUAR')
   DO WHILE X#13 .AND. UPPER(CHR(X))#'I' .AND. UPPER(CHR(X))#'M'
      X=INKEY()
   ENDDO
   @24, 0 CLEAR
   L=IF(L>22,22,L)
   IF X = 13
      EXIT
   ELSEIF UPPER(CHR(X)) = 'I'
      PRIVATE TO:=SPACE(4), FECO:=CTOD(''), DOC:=0, DOS:=0
      @  L, 0 CLEAR TO 24,79
      @  L, 0 SAY "บ"
      @  L, 4 GET TO  PICTURE'XXXX'  VALID TO#SPACE(4)
      @  L,11 SAY "ณ"
      @  L,15 GET FECO VALID FECO#CTOD('  /  /  ')
      @  L,27 SAY "ณ            ณ"
      @  L,45 GET DOC PICTURE'99999'
      @  L,53 SAY "ณ"
      @  L,58 GET DOS PICTURE'99999' VALID (DOC#0 .OR. DOS#0)
      @  L,66 SAY "ณ"
      @  L,79 SAY "บ"
      @L+1, 0 SAY "ศออออออออออออออออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออผ"
      SET CURSOR ON
      READ
      SET CURSOR OFF
      IF ACEPTA()
         GO TOP
         LOCATE FOR TORO = TO
         IF !FOUND()
            APPEND BLANK
            REPLACE TORO WITH TO
         ENDIF
         REPLACE FECCOM WITH FECO, DCIAVT WITH DCIAVT+DOC, DTOTAL WITH DTOTAL+DOC
         REPLACE DORIGI WITH DORIGI+DOC, DSAIFI WITH DSAIFI+DOS, DCIAVT WITH DCIAVT-DOS
      ENDIF
   ELSEIF UPPER(CHR(X)) = 'M'
      PRIVATE TO:=SPACE(4) , F:=.F.
      @  L, 0 CLEAR TO 24,79
      @  L, 0 SAY "บ"
      @  L,11 SAY "ณ"
      @  L,27 SAY "ณ            ณ"
      @  L,53 SAY "ณ"
      @  L,66 SAY "ณ"
      @  L,79 SAY "บ"
      @L+1, 0 SAY "ศออออออออออออออออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออฯออออออออออออผ"
      DO WHILE !F
         @  L, 4 GET TO  PICTURE'XXXX'  VALID TO#SPACE(4)
         SET CURSOR ON
         READ
         SET CURSOR OFF
         LOCATE FOR TORO = TO
         F=FOUND()
      ENDDO
      PRIVATE  DOS:=DSAIFI , DOC:=DCIAVT
      @  L,15 GET FECCOM VALID FECCOM#CTOD('  /  /  ')
      @  L,45 GET DOC PICTURE'99999'
      @  L,58 GET DOS PICTURE'99999' VALID (DOC#0 .OR. DOS#0)
      SET CURSOR ON
      READ
      SET CURSOR OFF
      REPLACE DCIAVT WITH DOC, DSAIFI WITH DOS, DTOTAL WITH DOC+DOS
   ENDIF

   X=0
ENDDO


IMPRES (LIN, 7 )