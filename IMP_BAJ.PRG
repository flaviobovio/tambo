PROCEDURE IMP_BAJ()
AADD(LIN, PADC("DATOS ESTADISTICOS DE BAJAS",80) )
AADD(LIN, "浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融")
AADD(LIN, "�"+PADC('A�O: '+STR(AN,4)+' '+LTRIM(STR(VAT))+' VACAS TOTAL',78)+"�")

AADD(LIN, "把陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳陳陳超")
AADD(LIN, "�   Causas   �   Total   Porc.     �   Ventas   Porc.     �   Muerta   Porc.   �")
AADD(LIN, "把陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超")

SELECT TIPOS
GO TOP
PRIVATE CAV, CAM, APCV:=0, APCM:=0, ACAV:=0, ACAM:=0, NU:= 5, T
DO WHILE !EOF()
   T=TIPO
   @NU , 0 SAY "�"
   @NU , 1 SAY CONTIP
   @NU ,13 SAY "�"
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
   @NU ,35 SAY "�"
   @NU ,39 SAY NUMENT(CAV,5)+SPACE(3)+NUME(PCV,5)+' %'
   @NU ,58 SAY "�"
   @NU ,62 SAY NUMENT(CAM,5)+SPACE(3)+NUME(PCM,5)+' %'
   @NU ,79 SAY "�"
   SELECT TIPOS
   SKIP
   NU = NU + 1
ENDDO

AADD(LIN, "把陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超"
AADD(LIN, "�  TOTALES   �   "+NUMENT(ACAV+ACAM,5)+SPACE(3)+NUME(APCV+APCM,5)+" %   �"+;
          NUMENT(ACAV,5)+SPACE(3)+NUME(APCV,5)+" %   �"+NUMENT(ACAM,5)+SPACE(3)+;
          NUME(APCM,5)+" %   �"

AADD(LIN, "藩様様様様様溶様様様様様様様様様様溶様様様様様様様様様様様詫様様様様様様様様様夕"