PROCEDURE INF_SEM()
PRIVATE FECO, ADOR, ADSA, ADCI, ADTO, X:=0, LIN, L:=8
SELECT TOROS
DO WHILE .T.

   CLS
   ADOR=0
   ADSA=0
   ADCI=0
   LIN={}

   AADD(LIN,"浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融")
   AADD(LIN,"�                INFORME SOBRE EL STOCK DE SEMEN AL "+DTOC(DIA)+"                   �")
   AADD(LIN,"把陳陳陳陳賃陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
   AADD(LIN,"�   TORO   �   FECHA DE    �                      DOSIS                        �")
   AADD(LIN,"�          �   COMPRA      団陳陳陳陳陳賃陳陳陳陳陳陳堕陳陳陳陳陳賃陳陳陳陳陳陳�")
   AADD(LIN,"�          �               � COMPRADAS  � PROVEEDOR  �"+PADC(TAMBO,12)+"�   TOTAL    �")
   AADD(LIN,"把陳陳陳陳津陳陳陳陳陳陳陳津陳陳陳陳陳陳田陳陳陳陳陳津陳陳陳陳陳陳田陳陳陳陳陳超")
   GO TOP
   DO WHILE !EOF()
      IF DTOTAL > 0
         AADD(LIN,"�   "+TORO+"   �   "+DTOC(FECCOM)+"    �   "+NUMENT(Dorigi,6)+"   �   "+;
                   NUMENT(Dciavt,6)+"   �   "+NUMENT(Dsaifi,6)+"   �   "+NUMENT(Dtotal,6)+"   �" )
         ADOR = ADOR + DORIGI
         ADCI = ADCI + DCIAVT
         ADSA = ADSA + DSAIFI
         L++
      ENDIF
      SKIP
   ENDDO
   ADTO = ADSA+ ADCI

   AADD(LIN,"把陳陳陳陳珍陳陳陳陳陳陳陳津陳陳陳陳陳陳田陳陳陳陳陳津陳陳陳陳陳陳田陳陳陳陳陳超" )

   AADD(LIN,"�         TOTALES          �   "+NUMENT(ADOR,6)+"   �   "+;
             NUMENT(ADCI,6)+"   �   "+NUMENT(ADSA,6)+"   �   "+NUMENT(ADTO,6)+"   �" )

   AADD(LIN,"藩様様様様様様様様様様様様溶様様様様様様詫様様様様様溶様様様様様様詫様様様様様夕" )



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
      @  L, 0 SAY "�"
      @  L, 4 GET TO  PICTURE'XXXX'  VALID TO#SPACE(4)
      @  L,11 SAY "�"
      @  L,15 GET FECO VALID FECO#CTOD('  /  /  ')
      @  L,27 SAY "�            �"
      @  L,45 GET DOC PICTURE'99999'
      @  L,53 SAY "�"
      @  L,58 GET DOS PICTURE'99999' VALID (DOC#0 .OR. DOS#0)
      @  L,66 SAY "�"
      @  L,79 SAY "�"
      @L+1, 0 SAY "藩様様様様様様様様様様様様溶様様様様様様詫様様様様様溶様様様様様様詫様様様様様夕"
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
      @  L, 0 SAY "�"
      @  L,11 SAY "�"
      @  L,27 SAY "�            �"
      @  L,53 SAY "�"
      @  L,66 SAY "�"
      @  L,79 SAY "�"
      @L+1, 0 SAY "藩様様様様様様様様様様様様溶様様様様様様詫様様様様様溶様様様様様様詫様様様様様夕"
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