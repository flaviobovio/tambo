PROCEDURE IMP_BAJ()
AADD(LIN, PADC("DATOS ESTADISTICOS DE BAJAS",80) )
AADD(LIN, "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป")
AADD(LIN, "บ"+PADC('AฅO: '+STR(AN,4)+' '+LTRIM(STR(VAT))+' VACAS TOTAL',78)+"บ")

AADD(LIN, "วฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤยฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ")
AADD(LIN, "บ   Causas   ณ   Total   Porc.     ณ   Ventas   Porc.     ณ   Muerta   Porc.   บ")
AADD(LIN, "วฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ")

SELECT TIPOS
GO TOP
PRIVATE CAV, CAM, APCV:=0, APCM:=0, ACAV:=0, ACAM:=0, NU:= 5, T
DO WHILE !EOF()
   T=TIPO
   @NU , 0 SAY "บ"
   @NU , 1 SAY CONTIP
   @NU ,13 SAY "ณ"
   SELECT BACENF
   COUNT TO CAV FOR (LEFT(MOTIV1,2)=T .OR. LEFT(MOTIV2,2)=T) .AND.  YEAR(FECHA)=AN .AND. DESTIN='V'
   COUNT TO CAM FOR (LEFT(MOTIV1,2)=T .OR. LEFT(MOTIV2,2)=T) .AND.  YEAR(FECHA)=AN .AND. DESTIN='M'
   PCV=ROUND( (CAV) / VAT * 100 ,2)
   PCM=ROUND( (CAM) / VAT * 100 ,2)
   APCV=APCV+PCV
   APCM=APCM+PCM
   ACAV=ACAV+CAV
   ACAM=ACAM+CAM
   @NU ,17 SAY NUMENT(CAV+CAM,5)+SPACE(3)+NUME(PCV+PCM,5)+' %'
   @NU ,35 SAY "ณ"
   @NU ,39 SAY NUMENT(CAV,5)+SPACE(3)+NUME(PCV,5)+' %'
   @NU ,58 SAY "ณ"
   @NU ,62 SAY NUMENT(CAM,5)+SPACE(3)+NUME(PCM,5)+' %'
   @NU ,79 SAY "บ"
   SELECT TIPOS
   SKIP
   NU = NU + 1
ENDDO

AADD(LIN, "วฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ"
AADD(LIN, "บ  TOTALES   ณ   "+NUMENT(ACAV+ACAM,5)+SPACE(3)+NUME(APCV+APCM,5)+" %   ณ"+;
          NUMENT(ACAV,5)+SPACE(3)+NUME(APCV,5)+" %   ณ"+NUMENT(ACAM,5)+SPACE(3)+;
          NUME(APCM,5)+" %   บ"

AADD(LIN, "ศออออออออออออฯอออออออออออออออออออออฯออออออออออออออออออออออฯออออออออออออออออออออผ"