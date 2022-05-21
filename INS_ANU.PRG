 


"имммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╩"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ SERVICIOS DADOS      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACAS INSEMINADAS    Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACAS TACTADAS       Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRIMEROS SERVICIOS   Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACIAS DE 1er SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACIAS DE 2do SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACIAS DE 3er SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ VACIAS DE 4to+ SERV. Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔ADAS 1er  SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔ADAS 2do  SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔ADAS 3er  SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔ADAS 4to+ SERV.  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ TOTAL VACAS PRE╔ADAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
***   INSEMINADORES   ***
X = 1
DO WHILE X <= N_INS
   IF S_DAI[X]#0
      AADD ( LIN, "╨ INSEMINADOR: "+INS[X]+" - SERVICIOS DADOS  Ё   "+STR(S_DAI[X],5)+"                               ╨")
      AADD ( LIN, "╨                     PRE╔ADAS         Ё   "+STR(V_PRI[X],5)+"                               ╨")
      AADD ( LIN, "╨                     DOSIS            Ё     "+NUME(D_INI[X],6)+"                            ╨")
      AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
***   TOROS   ***
X = 1
DO WHILE X <= N_TOR
   IF S_DAT[X] # 0
      AADD ( LIN, "╨ TORO: "+TOR[X]+"        - SERVICIOS DADOS  Ё   "+STR(S_DAT[X],5)+"                               ╨")
      AADD ( LIN, "╨                     PRE╔ADAS         Ё   "+STR(V_PRT[X],5)+"                               ╨")
      AADD ( LIN, "╨                     DOSIS            Ё     "+NUME(D_INT[X],6)+"                            ╨")
      AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
"╨ I/CELOS  0 a 17 DIAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/CELOS 18 a 25 DIAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/CELOS 26 a 33 DIAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/CELOS 34 a 49 DIAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/CELOS 50 a +  DIAS Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔EZ 1er SERVICIO  Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ PRE╔EZ TOTAL         Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ DOSIS POR PRE╔ADA    Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/PARTO 1er SERV.    Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ I/PARTO PRE╔EZ       Ё       Ё        Ё       Ё       Ё                      ╨"
"╨                      Ё       Ё        Ё       Ё       Ё                      ╨"
"╨ INEFIC. DE OBS.CELOS Ё       Ё        Ё       Ё       Ё                      ╨"
"хмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪"

PROCEDURE IMP_REP()
PRIVATE LIN[1] , TO:=37
@  0,19 SAY "EVALUACION REPRODUCTIVA DE "+MES(ME)+' DE '+STR(AN,4)
AFILL( LIN, "иммммммммммммммммммммммммммммммммммммммяммммммммммммммммммммммммммммммммммммммм╩",1,1)
AADD ( LIN, "╨  SERVICIOS DADOS                     Ё   "+STR(S_DAD,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  VACAS INSEMINADAS                   Ё   "+STR(V_INS,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  VACAS TACTADAS                      Ё   "+STR(V_TAC,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  PRIMEROS SERVICIOS                  Ё   "+STR(P_SER,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  VACIAS DE 1er SERVICIO              Ё   "+STR(V_1SE,5)+"                               ╨")
AADD ( LIN, "╨  VACIAS DE 2do SERVICIO              Ё   "+STR(V_2SE,5)+"                               ╨")
AADD ( LIN, "╨  VACIAS DE 3er SERVICIO              Ё   "+STR(V_3SE,5)+"                               ╨")
AADD ( LIN, "╨  VACIAS DE 4to+ SERVICIO             Ё   "+STR(V_4SE,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  PRE╔ADAS DE 1er SERVICIO            Ё   "+STR(P_1SE,5)+"                               ╨")
AADD ( LIN, "╨  PRE╔ADAS DE 2do SERVICIO            Ё   "+STR(P_2SE,5)+"                               ╨")
AADD ( LIN, "╨  PRE╔ADAS DE 3er SERVICIO            Ё   "+STR(P_3SE,5)+"                               ╨")
AADD ( LIN, "╨  PRE╔ADAS DE 4to+ SERVICIO           Ё   "+STR(P_4SE,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  TOTAL DE VACAS PRE╔ADAS             Ё   "+STR(V_PRE,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  INTERV.ENTRE CELOS DE  0 a 17 DIAS  Ё   "+STR(I_CE1,5)+"                               ╨")
AADD ( LIN, "╨  INTERV.ENTRE CELOS DE 18 a 25 DIAS  Ё   "+STR(I_CE2,5)+"                               ╨")
AADD ( LIN, "╨  INTERV.ENTRE CELOS DE 26 a 33 DIAS  Ё   "+STR(I_CE3,5)+"                               ╨")
AADD ( LIN, "╨  INTERV.ENTRE CELOS DE 34 a 49 DIAS  Ё   "+STR(I_CE4,5)+"                               ╨")
AADD ( LIN, "╨  INTERV.ENTRE CELOS DE 50 a +  DIAS  Ё   "+STR(I_CE5,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  PRE╔EZ 1er SERVICIO                 Ё     "+NUME(P_P1S,6)+" %                          ╨")
AADD ( LIN, "╨  PRE╔EZ TOTAL                        Ё     "+NUME(P_PTO,6)+" %                          ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  DOSIS POR PRE╔ADA                   Ё     "+NUME(D_VAP,6)+"                            ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
***   INSEMINADORES   ***
X = 1
DO WHILE X <= N_INS
   IF S_DAI[X]#0
      AADD ( LIN, "╨ INSEMINADOR: "+INS[X]+" - SERVICIOS DADOS  Ё   "+STR(S_DAI[X],5)+"                               ╨")
      AADD ( LIN, "╨                     PRE╔ADAS         Ё   "+STR(V_PRI[X],5)+"                               ╨")
      AADD ( LIN, "╨                     DOSIS            Ё     "+NUME(D_INI[X],6)+"                            ╨")
      AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
***   TOROS   ***
X = 1
DO WHILE X <= N_TOR
   IF S_DAT[X] # 0
      AADD ( LIN, "╨ TORO: "+TOR[X]+"        - SERVICIOS DADOS  Ё   "+STR(S_DAT[X],5)+"                               ╨")
      AADD ( LIN, "╨                     PRE╔ADAS         Ё   "+STR(V_PRT[X],5)+"                               ╨")
      AADD ( LIN, "╨                     DOSIS            Ё     "+NUME(D_INT[X],6)+"                            ╨")
      AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
      TO=TO+4
   ENDIF
   X = X + 1
ENDDO
AADD ( LIN, "╨  INTERVALO PARTO 1er SERVICIO        Ё   "+STR(I_P1S,5)+"                               ╨")
AADD ( LIN, "╨  INTERVALO PARTO PRE╔EZ              Ё   "+STR(I_PPR,5)+"                               ╨")
AADD ( LIN, "гддддддддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддд╤")
AADD ( LIN, "╨  INEFICIENCIA DE OBS. ENTRE CELOS    Ё     "+NUME(I_OBS,6)+" %                          ╨")
AADD ( LIN, "хммммммммммммммммммммммммммммммммммммммоммммммммммммммммммммммммммммммммммммммм╪")
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