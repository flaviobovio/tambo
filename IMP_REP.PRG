PROCEDURE IMP_REP()

PRIVATE LIN:={} , TO:=IF(V='VACA',37,34)

AADD ( LIN, PADC("EVALUACION REPRODUCTIVA de las "+V+" INSEMINADAS en "+MES(ME)+" de "+STR(AN,4),80) )
AADD ( LIN, "嬪様様様様様様様様様様様様様様様様様様用様様様様様様様様様様様様様様様様様様様邑")
AADD ( LIN, "�  SERVICIOS DADOS                     �   "+STR(S_DAD,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  CANTIDAD DE INSEMINADAS             �   "+STR(V_INS,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  CANTIDAD DE  TACTADAS               �   "+STR(V_TAC,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  PRIMEROS SERVICIOS                  �   "+STR(P_SER,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  PRE�ADAS DE 1er SERVICIO            �   "+STR(P_1SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 2do SERVICIO            �   "+STR(P_2SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 3er SERVICIO            �   "+STR(P_3SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 4to+ SERVICIO           �   "+STR(P_4SE,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  TOTAL DE PRE�ADAS                   �   "+STR(V_PRE,5)+"                               �")
AADD ( LIN, "�  TOTAL DE VACIAS                     �   "+STR(V_VAC,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE  0 a 17 DIAS  �   "+STR(I_CE1,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 18 a 25 DIAS  �   "+STR(I_CE2,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 26 a 33 DIAS  �   "+STR(I_CE3,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 34 a 49 DIAS  �   "+STR(I_CE4,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 50 a +  DIAS  �   "+STR(I_CE5,5)+"                               �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  PRE�EZ 1er SERVICIO                 �     "+NUME(P_P1S,6)+" %                          �")
AADD ( LIN, "�  PRE�EZ TOTAL                        �     "+NUME(P_PTO,6)+" %                          �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
AADD ( LIN, "�  DOSIS POR PRE�ADA                   �     "+NUME(D_VAP,6)+"                            �")
AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")

IF V = 'VACA'
   AADD ( LIN, "�  INTERVALO PARTO 1er SERVICIO        �   "+STR(I_P1S,5)+"                               �")
   AADD ( LIN, "�  INTERVALO PARTO PRE�EZ              �   "+STR(I_PPR,5)+"                               �")
   AADD ( LIN, "団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調")
ENDIF
AADD ( LIN, "�  INEFICIENCIA DE OBS. DE CELOS       �     "+NUME(I_OBS,6)+" %                          �")
AADD ( LIN, "�  PORCENTAJE DE CELOS DE 28 DIAS      �     "+NUME(P_C28,6)+" %                          �")
AADD ( LIN, "突様様用様様様冤様様様様様用様様様様様溶冤様様様様様用様様様様様様冤様様様様様裕")

***   INSEMINADORES   ***

AADD ( LIN, "�INSEM.�TORO  �1 SERVICIOS �2 SERVICIOS �3 SERVICIOS �4+ SERVICIOS�TOTAL SERV. �" )
AADD ( LIN, "�      �      団陳堕陳堕陳津陳賃陳賃陳陳田陳堕陳田陳津陳賃陳賃陳陳田陳堕陳堕陳調" )
AADD ( LIN, "�      �      �Dad�Pre�Dos.�Dad�Pre�Dos.�Dad�Pre�Dos.�Dad�Pre�Dos.�Dad�Pre�Dos.�" )
AADD ( LIN, "団陳陳津陳陳陳田陳田陳田陳津陳津陳津陳陳田陳田陳田陳津陳津陳津陳陳田陳田陳田陳調" )

I=1
T=1
DO WHILE I<=C_INS

   AADD ( LIN, "�"+IF(T>1,SPACE(4),INS[I])+"  �" + IF(T<=C_TOR,TOR[T]+"  ",'TOTAL ') + "�"+;
   STR(E_INS[I,T, 1],3)+"�"+STR(E_INS[I,T, 2],3)+"�"+NUME(E_INS[I,T, 3],4)+"�"+STR(E_INS[I,T, 4],3)+"�"+;
   STR(E_INS[I,T, 5],3)+"�"+NUME(E_INS[I,T, 6],4)+"�"+STR(E_INS[I,T, 7],3)+"�"+STR(E_INS[I,T, 8],3)+"�"+;
   NUME(E_INS[I,T, 9],4)+"�"+STR(E_INS[I,T,10],3)+"�"+STR(E_INS[I,T,11],3)+"�"+NUME(E_INS[I,T,12],4)+"�"+;
   STR(E_INS[I,T,13],3)+"�"+STR(E_INS[I,T,14],3)+"�"+NUME(E_INS[I,T,15],4)+"�" )

   IF T < C_TOR+1
      T++
   ELSE
     T=1
     I++

     AADD ( LIN, "団陳陳津陳陳陳田陳田陳田陳津陳津陳津陳陳田陳田陳田陳津陳津陳津陳陳田陳田陳田陳調" )
   ENDIF

ENDDO

***   TOROS   ***
I=1
T=1
DO WHILE T<=C_TOR

   AADD ( LIN, "�"+IF(T=1,"TOTAL ",SPACE(6))+"�"+TOR[T]+"  �"+;
   STR(E_TOR[T, 1],3)+"�"+STR(E_TOR[T, 2],3)+"�"+NUME(E_TOR[T, 3],4)+"�"+STR(E_TOR[T, 4],3)+"�"+;
   STR(E_TOR[T, 5],3)+"�"+NUME(E_TOR[T, 6],4)+"�"+STR(E_TOR[T, 7],3)+"�"+STR(E_TOR[T, 8],3)+"�"+;
   NUME(E_TOR[T, 9],4)+"�"+STR(E_TOR[T,10],3)+"�"+STR(E_TOR[T,11],3)+"�"+NUME(E_TOR[T,12],4)+"�"+;
   STR(E_TOR[T,13],3)+"�"+STR(E_TOR[T,14],3)+"�"+NUME(E_TOR[T,15],4)+"�" )

   T++
ENDDO

AADD ( LIN, "塒様様溶様様様詫様詫様詫様溶様溶様溶様様詫様詫様詫様溶様溶様溶様様詫様詫様詫様余" )


MOSTRAR(LIN,2)

IMPRES(LIN)