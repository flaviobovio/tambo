PROCEDURE IMP_PRO()
PRIVATE LIN:={}
AADD(LIN,PADC('PROYECCION FISICA DEL TAMBO A 150 DIAS',80))
AADD(LIN,"浜様様様様様様様様様様様様様様様様様用様様様冤様様用様様様冤様様用様様様冤様様融")
AADD(LIN,"� Concepto   \   Fecha               �"+DATES(DIA,3)+"�"+DATES(DIA+30,3)+"�"+DATES(DIA+60,3)+;
         "�"+DATES(DIA+90 ,3)+"�"+DATES(DIA+120,3)+"�"+DATES(DIA+150,3)+"�")
AADD(LIN,"麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵")
AADD(LIN,"� VACAS ORDE�O                       �"+STR(V_ORD[1],6)+"�"+STR(V_ORD[2],6)+"�"+;
         STR(V_ORD[3],6)+"�"+STR(V_ORD[4],6)+"�"+STR(V_ORD[5],6)+"�"+STR(V_ORD[6],6)+"�")

AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VACAS SECAS                        �"+STR(V_SEC[1],6)+"�"+STR(V_SEC[2],6)+"�"+;
         STR(V_SEC[3],6)+"�"+STR(V_SEC[4],6)+"�"+STR(V_SEC[5],6)+"�"+STR(V_SEC[6],6)+"�")

AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VAQUILLONAS PRE�ADAS               �"+STR(Q_PRE[1],6)+"�"+STR(Q_PRE[2],6)+"�"+;
         STR(Q_PRE[3],6)+"�"+STR(Q_PRE[4],6)+"�"+STR(Q_PRE[5],6)+"�"+STR(Q_PRE[6],6)+"�")


AADD(LIN,"麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵")
AADD(LIN,"� TOTAL                              �"+STR(V_TOT[1],6)+"�"+STR(V_TOT[2],6)+"�"+;
         STR(V_TOT[3],6)+"�"+STR(V_TOT[4],6)+"�"+STR(V_TOT[5],6)+"�"+STR(V_TOT[6],6)+"�")

AADD(LIN,"麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵")
AADD(LIN,"� RELACION VACA ORDE�O / VACA SECA   �"+R_VOS[1]+"%�"+R_VOS[2]+"%�"+;
         R_VOS[3]+"%�"+R_VOS[4]+"%�"+R_VOS[5]+"%�"+R_VOS[6]+"%�")



AADD(LIN,"麺様様様様様様様様様様様様様様様様様謡様様様慷様様謡様様様慷様様謡様様様慷様様郵")
AADD(LIN,"� VACAS RECHAZO                      �      �"+STR(V_REC[1],6)+"�"+STR(V_REC[2],6)+"�"+;
         STR(V_REC[3],6)+"�"+STR(V_REC[4],6)+"�"+STR(V_REC[5],6)+"�")



AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VACAS A SECAR                      �      �"+STR(V_ASE[1],6)+"�"+STR(V_ASE[2],6)+"�"+;
         STR(V_ASE[3],6)+"�"+STR(V_ASE[4],6)+"�"+STR(V_ASE[5],6)+"�")


AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VACAS A SECAR POR BAJA PRODUCCION  �      �"+STR(V_SBP[1],6)+"�"+STR(V_SBP[2],6)+"�"+;
         STR(V_SBP[3],6)+"�"+STR(V_SBP[4],6)+"�"+STR(V_SBP[4],6)+"�")

AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VACAS A PARIR                      �      �"+STR(V_APA[1],6)+"�"+STR(V_APA[2],6)+"�"+;
          STR(V_APA[3],6)+"�"+STR(V_APA[4],6)+"�"+STR(V_APA[5],6)+"�")

AADD(LIN,"把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳田陳陳津陳陳陳田陳陳津陳陳陳田陳陳超")
AADD(LIN,"� VAQUILLONAS A PARIR                �      �"+STR(Q_APA[1],6)+"�"+STR(Q_APA[2],6)+"�"+;
          STR(Q_APA[3],6)+"�"+STR(Q_APA[4],6)+"�"+STR(Q_APA[5],6)+"�")

AADD(LIN,"藩様様様様様様様様様様様様様様様様様溶様様様詫様様溶様様様詫様様溶様様様詫様様夕")

MOSTRAR( LIN, 4 )

IMPRES( LIN )