 


"浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融"
"�                      �       �        �       �       �                      �"
"� SERVICIOS DADOS      �       �        �       �       �                      �"
"� VACAS INSEMINADAS    �       �        �       �       �                      �"
"� VACAS TACTADAS       �       �        �       �       �                      �"
"� PRIMEROS SERVICIOS   �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
"� VACIAS DE 1er SERV.  �       �        �       �       �                      �"
"� VACIAS DE 2do SERV.  �       �        �       �       �                      �"
"� VACIAS DE 3er SERV.  �       �        �       �       �                      �"
"� VACIAS DE 4to+ SERV. �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
"� PRE�ADAS 1er  SERV.  �       �        �       �       �                      �"
"� PRE�ADAS 2do  SERV.  �       �        �       �       �                      �"
"� PRE�ADAS 3er  SERV.  �       �        �       �       �                      �"
"� PRE�ADAS 4to+ SERV.  �       �        �       �       �                      �"
"� TOTAL VACAS PRE�ADAS �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
***   INSEMINADORES   ***
X = 1
DO WHILE X <= N_INS
   IF S_DAI[X]#0
      AADD ( LIN, "� INSEMINADOR: "+INS[X]+" - SERVICIOS DADOS  �   "+STR(S_DAI[X],5)+"                               �")
      AADD ( LIN, "�                     PRE�ADAS         �   "+STR(V_PRI[X],5)+"                               �")
      AADD ( LIN, "�                     DOSIS            �     "+NUME(D_INI[X],6)+"                            �")
      AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
***   TOROS   ***
X = 1
DO WHILE X <= N_TOR
   IF S_DAT[X] # 0
      AADD ( LIN, "� TORO: "+TOR[X]+"        - SERVICIOS DADOS  �   "+STR(S_DAT[X],5)+"                               �")
      AADD ( LIN, "�                     PRE�ADAS         �   "+STR(V_PRT[X],5)+"                               �")
      AADD ( LIN, "�                     DOSIS            �     "+NUME(D_INT[X],6)+"                            �")
      AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
"� I/CELOS  0 a 17 DIAS �       �        �       �       �                      �"
"� I/CELOS 18 a 25 DIAS �       �        �       �       �                      �"
"� I/CELOS 26 a 33 DIAS �       �        �       �       �                      �"
"� I/CELOS 34 a 49 DIAS �       �        �       �       �                      �"
"� I/CELOS 50 a +  DIAS �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
"� PRE�EZ 1er SERVICIO  �       �        �       �       �                      �"
"� PRE�EZ TOTAL         �       �        �       �       �                      �"
"� DOSIS POR PRE�ADA    �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
"� I/PARTO 1er SERV.    �       �        �       �       �                      �"
"� I/PARTO PRE�EZ       �       �        �       �       �                      �"
"�                      �       �        �       �       �                      �"
"� INEFIC. DE OBS.CELOS �       �        �       �       �                      �"
"藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕"

PROCEDURE IMP_REP()
PRIVATE LIN[1] , TO:=37
@  0,19 SAY "EVALUACION REPRODUCTIVA DE "+MES(ME)+' DE '+STR(AN,4)
AFILL( LIN, "浜様様様様様様様様様様様様様様様様様様用様様様様様様様様様様様様様様様様様様様融",1,1)
AADD ( LIN, "�  SERVICIOS DADOS                     �   "+STR(S_DAD,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  VACAS INSEMINADAS                   �   "+STR(V_INS,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  VACAS TACTADAS                      �   "+STR(V_TAC,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  PRIMEROS SERVICIOS                  �   "+STR(P_SER,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  VACIAS DE 1er SERVICIO              �   "+STR(V_1SE,5)+"                               �")
AADD ( LIN, "�  VACIAS DE 2do SERVICIO              �   "+STR(V_2SE,5)+"                               �")
AADD ( LIN, "�  VACIAS DE 3er SERVICIO              �   "+STR(V_3SE,5)+"                               �")
AADD ( LIN, "�  VACIAS DE 4to+ SERVICIO             �   "+STR(V_4SE,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  PRE�ADAS DE 1er SERVICIO            �   "+STR(P_1SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 2do SERVICIO            �   "+STR(P_2SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 3er SERVICIO            �   "+STR(P_3SE,5)+"                               �")
AADD ( LIN, "�  PRE�ADAS DE 4to+ SERVICIO           �   "+STR(P_4SE,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  TOTAL DE VACAS PRE�ADAS             �   "+STR(V_PRE,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE  0 a 17 DIAS  �   "+STR(I_CE1,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 18 a 25 DIAS  �   "+STR(I_CE2,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 26 a 33 DIAS  �   "+STR(I_CE3,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 34 a 49 DIAS  �   "+STR(I_CE4,5)+"                               �")
AADD ( LIN, "�  INTERV.ENTRE CELOS DE 50 a +  DIAS  �   "+STR(I_CE5,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  PRE�EZ 1er SERVICIO                 �     "+NUME(P_P1S,6)+" %                          �")
AADD ( LIN, "�  PRE�EZ TOTAL                        �     "+NUME(P_PTO,6)+" %                          �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  DOSIS POR PRE�ADA                   �     "+NUME(D_VAP,6)+"                            �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
***   INSEMINADORES   ***
X = 1
DO WHILE X <= N_INS
   IF S_DAI[X]#0
      AADD ( LIN, "� INSEMINADOR: "+INS[X]+" - SERVICIOS DADOS  �   "+STR(S_DAI[X],5)+"                               �")
      AADD ( LIN, "�                     PRE�ADAS         �   "+STR(V_PRI[X],5)+"                               �")
      AADD ( LIN, "�                     DOSIS            �     "+NUME(D_INI[X],6)+"                            �")
      AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
***   TOROS   ***
X = 1
DO WHILE X <= N_TOR
   IF S_DAT[X] # 0
      AADD ( LIN, "� TORO: "+TOR[X]+"        - SERVICIOS DADOS  �   "+STR(S_DAT[X],5)+"                               �")
      AADD ( LIN, "�                     PRE�ADAS         �   "+STR(V_PRT[X],5)+"                               �")
      AADD ( LIN, "�                     DOSIS            �     "+NUME(D_INT[X],6)+"                            �")
      AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
AADD ( LIN, "�  INTERVALO PARTO 1er SERVICIO        �   "+STR(I_P1S,5)+"                               �")
AADD ( LIN, "�  INTERVALO PARTO PRE�EZ              �   "+STR(I_PPR,5)+"                               �")
AADD ( LIN, "把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超")
AADD ( LIN, "�  INEFICIENCIA DE OBS. ENTRE CELOS    �     "+NUME(I_OBS,6)+" %                          �")
AADD ( LIN, "藩様様様様様様様様様様様様様様様様様様溶様様様様様様様様様様様様様様様様様様様夕")
IF SET(_SET_DEVICE)='SCREEN'
   PRIVATE PR:=1
   SETCOLOR(INVER)
   @24,11  SAY '  < Espacio > VER LO RESTANTE     < Enter > CONTINUAR...  '
   SETCOLOR(COMUN)
   DO WHILE .T.
      @ 1, 0 CLEAR TO 23, 0
      AEVAL( LIN,{ | L | QQOUT(L) },PR,22 )
      X=0
      DO WHILE X#13 .AND. X#32
         X=INKEY()
      ENDDO
      IF X = 13
         @24, 0 CLEAR
         RETURN
      ELSE
         IF PR # TO - 21
            IF PR+44 < TO
               PR = PR + 22
            ELSE
               PR = TO - 21
            ENDIF
         ELSE
            PR=1
         ENDIF
      ENDIF
   ENDDO
ELSE
   QOUT()
   AEVAL( LIN,{ | L | QQOUT(L) },1 )
ENDIF