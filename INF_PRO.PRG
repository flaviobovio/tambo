PROCEDURE INF_PRO ()

PRIVATE V_ORD[6], V_SEC[6], Q_PRE[6], R_VOS[6], V_REC[5], V_ASE[5],;
        V_SBP[5], V_APA[5], Q_APA[5], V_TOT[6], X
*
AFILL(V_REC, 0)
AFILL(V_SBP, 0)
AFILL(V_APA, 0)
AFILL(Q_APA, 0)
AFILL(V_ASE, 0)
V_ORD[1] = 0
V_SEC[1] = 0
Q_PRE[1] = 0
*
CLS

@  0,20 SAY "PROYECCION FISICA DEL TAMBO A 150 DIAS"
@  1, 0 SAY "浜様様様様様様様様様様様様様様様様様用様様様冤様様用様様様冤様様用様様様冤様様融"
@  2, 0 SAY "� Concepto   \   Fecha               �"+DATES(DIA,3)+"�"+DATES(DIA+30,3)+"�"+DATES(DIA+60,3)+;
            "�"+DATES(DIA+90 ,3)+"�"+DATES(DIA+120,3)+"�"+DATES(DIA+150,3)+"�"
@  3, 0 SAY "麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵"
@  4, 0 SAY "� VACAS ORDE�O                       �      �      �      �      �      �      �"
@  5, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@  6, 0 SAY "� VACAS SECAS                        �      �      �      �      �      �      �"
@  7, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@  8, 0 SAY "� VAQUILLONAS PRE�ADAS               �      �      �      �      �      �      �"
@  9, 0 SAY "麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵"
@ 10, 0 SAY "� TOTAL                              �      �      �      �      �      �      �"
@ 11, 0 SAY "麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵"
@ 12, 0 SAY "� RELACION VACA ORDE�O / VACA SECA   �      �      �      �      �      �      �"
@ 13, 0 SAY "麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵"
@ 14, 0 SAY "� VACAS RECHAZO                      �      �      �      �      �      �      �"
@ 15, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@ 16, 0 SAY "� VACAS A SECAR                      �      �      �      �      �      �      �"
@ 17, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@ 18, 0 SAY "� VACAS A SECAR POR BAJA PRODUCCION  �      �      �      �      �      �      �"
@ 19, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@ 20, 0 SAY "� VACAS A PARIR                      �      �      �      �      �      �      �"
@ 21, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超"
@ 22, 0 SAY "� VAQUILLONAS A PARIR                �      �      �      �      �      �      �"
@ 23, 0 SAY "藩様様様様様様様様様様様様様様様様様溶様様様詫様様溶様様様詫様様溶様様様詫様様夕"

***   VACAS RECHAZO   ***
@14,45 GET  V_REC[1] PICTURE '999999'
@14,52 GET  V_REC[2] PICTURE '999999'
@14,59 GET  V_REC[3] PICTURE '999999'
@14,66 GET  V_REC[4] PICTURE '999999'
@14,73 GET  V_REC[5] PICTURE '999999'

***   VACAS A SECAR x BAJA PROD.   ***
@18,45 GET  V_SBP[1] PICTURE '999999'
@18,52 GET  V_SBP[2] PICTURE '999999'
@18,59 GET  V_SBP[3] PICTURE '999999'
@18,66 GET  V_SBP[4] PICTURE '999999'
@18,73 GET  V_SBP[5] PICTURE '999999'

SET CURSOR ON
READ
SET CURSOR OFF

@  9,11 CLEAR TO 13,67
MARCO( 9,11,13,67 )
@11,15  SAY 'PROCESANDO LOS DATOS . POR FAVOR ESPERE UN MOMENTO'

SELECT TAMBO
GO TOP

DO WHILE !EOF()

   ***   VACAS EN ORDE�O   ***
   V_ORD[1] += IF(DIALAC>0, 1, 0 )

   ***   VACAS SECAS   ***
   V_SEC[1] += IF(DIALAC=0.AND.NROPAR>0, 1, 0)

   IF RESULT='P'

      ***   VACAS A SECAR   ***
      V_ASE[1] += IF(DIALAC>0.AND.(FECSER+223)<=(DIA+ 30).AND.(FECSER+223)>(DIA    ), 1, 0)
      V_ASE[2] += IF(DIALAC>0.AND.(FECSER+223)<=(DIA+ 60).AND.(FECSER+223)>(DIA+ 30), 1, 0)
      V_ASE[3] += IF(DIALAC>0.AND.(FECSER+223)<=(DIA+ 90).AND.(FECSER+223)>(DIA+ 60), 1, 0)
      V_ASE[4] += IF(DIALAC>0.AND.(FECSER+223)<=(DIA+120).AND.(FECSER+223)>(DIA+ 90), 1, 0)
      V_ASE[5] += IF(DIALAC>0.AND.(FECSER+223)<=(DIA+150).AND.(FECSER+223)>(DIA+120), 1, 0)

      IF NROPAR > 0

         ***   VACAS A PARIR   ***
         V_APA[1] += IF((FECSER+283)<=(DIA+ 30).AND.(FECSER+283)>(DIA),1,0)
         V_APA[2] += IF((FECSER+283)<=(DIA+ 60).AND.(FECSER+283)>(DIA+ 30) ,1,0)
         V_APA[3] += IF((FECSER+283)<=(DIA+ 90).AND.(FECSER+283)>(DIA+ 60) ,1,0)
         V_APA[4] += IF((FECSER+283)<=(DIA+120).AND.(FECSER+283)>(DIA+ 90) ,1,0)
         V_APA[5] += IF((FECSER+283)<=(DIA+150).AND.(FECSER+283)>(DIA+120) ,1,0)

      ELSE

         ***   VAQUILLONAS PRE�ADAS   ***
         Q_PRE[1] ++

         ***   VAQUILLONAS A PARIR   ***
         Q_APA[1] += IF((FECSER+283)<=(DIA+ 30).AND.(FECSER+283)>(DIA),1,0)
         Q_APA[2] += IF((FECSER+283)<=(DIA+ 60).AND.(FECSER+283)>(DIA+ 30) ,1,0)
         Q_APA[3] += IF((FECSER+283)<=(DIA+ 90).AND.(FECSER+283)>(DIA+ 60) ,1,0)
         Q_APA[4] += IF((FECSER+283)<=(DIA+120).AND.(FECSER+283)>(DIA+ 90) ,1,0)
         Q_APA[5] += IF((FECSER+283)<=(DIA+150).AND.(FECSER+283)>(DIA+120) ,1,0)

      ENDIF

   ENDIF

SKIP

ENDDO



***   VACAS SECAS   ***
V_SEC[2] = V_SEC[1] + V_ASE[1] + V_SBP[1] - V_APA[1]
V_SEC[3] = V_SEC[2] + V_ASE[2] + V_SBP[2] - V_APA[2]
V_SEC[4] = V_SEC[3] + V_ASE[3] + V_SBP[3] - V_APA[3]
V_SEC[5] = V_SEC[4] + V_ASE[4] + V_SBP[4] - V_APA[4]
V_SEC[6] = V_SEC[5] + V_ASE[5] + V_SBP[5] - V_APA[5]


***   VAQ.PRE�ADAS   ***
Q_PRE[2] = Q_PRE[1] - Q_APA[1]
Q_PRE[3] = Q_PRE[2] - Q_APA[2]
Q_PRE[4] = Q_PRE[3] - Q_APA[3]
Q_PRE[5] = Q_PRE[4] - Q_APA[4]
Q_PRE[6] = Q_PRE[5] - Q_APA[5]

***   VACAS ORDE�O   ***
V_ORD[2] = V_ORD[1] + V_APA[1] + Q_APA[1] - V_ASE[1] - V_SBP[1] - V_REC[1]
V_ORD[3] = V_ORD[2] + V_APA[2] + Q_APA[2] - V_ASE[2] - V_SBP[2] - V_REC[2]
V_ORD[4] = V_ORD[3] + V_APA[3] + Q_APA[3] - V_ASE[3] - V_SBP[3] - V_REC[3]
V_ORD[5] = V_ORD[4] + V_APA[4] + Q_APA[4] - V_ASE[4] - V_SBP[4] - V_REC[4]
V_ORD[6] = V_ORD[5] + V_APA[5] + Q_APA[5] - V_ASE[5] - V_SBP[5] - V_REC[5]

***   TOTAL DE VACAS   ***
X = 1
AEVAL( V_TOT, { || V_TOT[X]:=V_ORD[X] + V_SEC[X] + Q_PRE[X], X++ } )

***   RELACION VACA ORDE�O / VACA SECA   ***
X = 1
AEVAL( R_VOS, { || R_VOS[X]:= NUME(ROUND( V_ORD[X] / (V_ORD[X]+V_SEC[X]) * 100, 2 ),5), X++ } )

IMP_PRO()

# INCLUDE 'IMP_PRO.PRG'