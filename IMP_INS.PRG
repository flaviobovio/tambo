PROCEDURE IMP_INS()
CLS
IF PRINTOK()
   IMPRI(2)
   @  0,19 SAY "EVALUACION REPRODUCTIVA DE "+MES(ME)+' DE '+STR(AN,4)
   @  1, 0 SAY "浜様様様様様様様様様様様様様様様様様様用様様様様様様様様様様様様様様様様様様様融"
   @  2, 0 SAY "�  SERVICIOS DADOS                     �   "+STR(S_DAD,5)+"                               �"
   @  3, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @  4, 0 SAY "�  VACAS INSEMINADAS                   �   "+STR(V_INS,5)+"                               �"
   @  5, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @  6, 0 SAY "�  VACAS TACTADAS                      �   "+STR(V_TAC,5)+"                               �"
   @  7, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @  8, 0 SAY "�  PRIMEROS SERVICIOS                  �   "+STR(P_SER,5)+"                               �"
   @  9, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 10, 0 SAY "�  VACIAS DE 1er SERVICIO              �   "+STR(V_1SE,5)+"                               �"
   @ 11, 0 SAY "�  VACIAS DE 2do SERVICIO              �   "+STR(V_2SE,5)+"                               �"
   @ 12, 0 SAY "�  VACIAS DE 3er SERVICIO              �   "+STR(V_3SE,5)+"                               �"
   @ 13, 0 SAY "�  VACIAS DE 4to+ SERVICIO             �   "+STR(V_4SE,5)+"                               �"
   @ 14, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 15, 0 SAY "�  PRE�ADAS DE 1er SERVICIO            �   "+STR(P_1SE,5)+"                               �"
   @ 16, 0 SAY "�  PRE�ADAS DE 2do SERVICIO            �   "+STR(P_2SE,5)+"                               �"
   @ 17, 0 SAY "�  PRE�ADAS DE 3er SERVICIO            �   "+STR(P_3SE,5)+"                               �"
   @ 18, 0 SAY "�  PRE�ADAS DE 4to+ SERVICIO           �   "+STR(P_4SE,5)+"                               �"
   @ 19, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 20, 0 SAY "�  TOTAL DE VACAS PRE�ADAS             �   "+STR(V_PRE,5)+"                               �"
   @ 21, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 22, 0 SAY "�  INTERV.ENTRE CELOS DE  0 a 17 DIAS  �   "+STR(I_CE1,5)+"                               �"
   @ 23, 0 SAY "�  INTERV.ENTRE CELOS DE 18 a 25 DIAS  �   "+STR(I_CE2,5)+"                               �"
   @ 24, 0 SAY "�  INTERV.ENTRE CELOS DE 26 a 33 DIAS  �   "+STR(I_CE3,5)+"                               �"
   @ 25, 0 SAY "�  INTERV.ENTRE CELOS DE 34 a 49 DIAS  �   "+STR(I_CE4,5)+"                               �"
   @ 26, 0 SAY "�  INTERV.ENTRE CELOS DE 50 a +  DIAS  �   "+STR(I_CE5,5)+"                               �"
   @ 27, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 28, 0 SAY "�  PRE�EZ 1er SERVICIO                 �     "+NUME(P_P1S,6)+" %                          �"
   @ 29, 0 SAY "�  PRE�EZ TOTAL                        �     "+NUME(P_PTO,6)+" %                          �"
   @ 30, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ 31, 0 SAY "�  DOSIS POR PRE�ADA                   �     "+NUME(D_VAP,6)+"                            �"
   @ 32, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   LI= 33
   ***   INSEMINADORES   ***
   X = 1
   DO WHILE X <= N_INS
      IF S_DAI[X]#0
         @ LI   , 0 SAY "� INSEMINADOR: "+INS[X]+" - SERVICIOS DADOS  �   "+STR(S_DAI[X],5)+"                               �"
         @ LI+ 1, 0 SAY "�                     PRE�ADAS         �   "+STR(V_PRI[X],5)+"                               �"
         @ LI+ 2, 0 SAY "�                     DOSIS            �     "+NUME(D_INI[X],6)+"                            �"
         @ LI+ 3, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
         LI = LI + 4
      ENDIF
      X = X + 1
   ENDDO
   ***   TOROS   ***
   X = 1
   DO WHILE X <= N_TOR
      IF S_DAT[X] # 0
         @ LI   , 0 SAY "� TORO: "+TOR[X]+"        - SERVICIOS DADOS  �   "+STR(S_DAT[X],5)+"                               �"
         @ LI+ 1, 0 SAY "�                     PRE�ADAS         �   "+STR(V_PRT[X],5)+"                               �"
         @ LI+ 2, 0 SAY "�                     DOSIS            �     "+NUME(D_INT[X],6)+"                            �"
         @ LI+ 3, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
         LI = LI + 4
      ENDIF
      X = X + 1
   ENDDO
   @ LI   , 0 SAY "�  INTERVALO PARTO 1er SERVICIO        �   "+STR(I_P1S,5)+"                               �"
   @ LI+ 1, 0 SAY "�  INTERVALO PARTO PRE�EZ              �   "+STR(I_PPR,5)+"                               �"
   @ LI+ 2, 0 SAY "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超"
   @ LI+ 3, 0 SAY "�  INEFICIENCIA DE OBS. ENTRE CELOS    �     "+NUME(I_OBS,6)+" %                          �"
   @ LI+ 4, 0 SAY "藩様様様様様様様様様様様様様様様様様様溶様様様様様様様様様様様様様様様様様様様夕"
   IMPRI(0)
   EJECT
ENDIF