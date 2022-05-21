PROCEDURE IMP_REP()

PRIVATE LIN:={} , TO:=IF(V='VACA',37,34)

AADD ( LIN, PADC("EVALUACION REPRODUCTIVA de las "+V+" INSEMINADAS en "+MES(ME)+" de "+STR(AN,4),80) )
AADD ( LIN, "ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸")
AADD ( LIN, "³  SERVICIOS DADOS                     ³   "+STR(S_DAD,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  CANTIDAD DE INSEMINADAS             ³   "+STR(V_INS,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  CANTIDAD DE  TACTADAS               ³   "+STR(V_TAC,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  PRIMEROS SERVICIOS                  ³   "+STR(P_SER,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  PRE¥ADAS DE 1er SERVICIO            ³   "+STR(P_1SE,5)+"                               ³")
AADD ( LIN, "³  PRE¥ADAS DE 2do SERVICIO            ³   "+STR(P_2SE,5)+"                               ³")
AADD ( LIN, "³  PRE¥ADAS DE 3er SERVICIO            ³   "+STR(P_3SE,5)+"                               ³")
AADD ( LIN, "³  PRE¥ADAS DE 4to+ SERVICIO           ³   "+STR(P_4SE,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  TOTAL DE PRE¥ADAS                   ³   "+STR(V_PRE,5)+"                               ³")
AADD ( LIN, "³  TOTAL DE VACIAS                     ³   "+STR(V_VAC,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  INTERV.ENTRE CELOS DE  0 a 17 DIAS  ³   "+STR(I_CE1,5)+"                               ³")
AADD ( LIN, "³  INTERV.ENTRE CELOS DE 18 a 25 DIAS  ³   "+STR(I_CE2,5)+"                               ³")
AADD ( LIN, "³  INTERV.ENTRE CELOS DE 26 a 33 DIAS  ³   "+STR(I_CE3,5)+"                               ³")
AADD ( LIN, "³  INTERV.ENTRE CELOS DE 34 a 49 DIAS  ³   "+STR(I_CE4,5)+"                               ³")
AADD ( LIN, "³  INTERV.ENTRE CELOS DE 50 a +  DIAS  ³   "+STR(I_CE5,5)+"                               ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  PRE¥EZ 1er SERVICIO                 ³     "+NUME(P_P1S,6)+" %                          ³")
AADD ( LIN, "³  PRE¥EZ TOTAL                        ³     "+NUME(P_PTO,6)+" %                          ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD ( LIN, "³  DOSIS POR PRE¥ADA                   ³     "+NUME(D_VAP,6)+"                            ³")
AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")

IF V = 'VACA'
   AADD ( LIN, "³  INTERVALO PARTO 1er SERVICIO        ³   "+STR(I_P1S,5)+"                               ³")
   AADD ( LIN, "³  INTERVALO PARTO PRE¥EZ              ³   "+STR(I_PPR,5)+"                               ³")
   AADD ( LIN, "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
ENDIF
AADD ( LIN, "³  INEFICIENCIA DE OBS. DE CELOS       ³     "+NUME(I_OBS,6)+" %                          ³")
AADD ( LIN, "³  PORCENTAJE DE CELOS DE 28 DIAS      ³     "+NUME(P_C28,6)+" %                          ³")
AADD ( LIN, "ÆÍÍÍÍÍÍÑÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÏÑÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍµ")

***   INSEMINADORES   ***

AADD ( LIN, "³INSEM.³TORO  ³1 SERVICIOS ³2 SERVICIOS ³3 SERVICIOS ³4+ SERVICIOS³TOTAL SERV. ³" )
AADD ( LIN, "³      ³      ÃÄÄÄÂÄÄÄÂÄÄÄÄÅÄÄÄÂÄÄÄÂÄÄÄÄÅÄÄÄÂÄÄÄÅÄÄÄÄÅÄÄÄÂÄÄÄÂÄÄÄÄÅÄÄÄÂÄÄÄÂÄÄÄÄ´" )
AADD ( LIN, "³      ³      ³Dad³Pre³Dos.³Dad³Pre³Dos.³Dad³Pre³Dos.³Dad³Pre³Dos.³Dad³Pre³Dos.³" )
AADD ( LIN, "ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄ´" )

I=1
T=1
DO WHILE I<=C_INS

   AADD ( LIN, "³"+IF(T>1,SPACE(4),INS[I])+"  ³" + IF(T<=C_TOR,TOR[T]+"  ",'TOTAL ') + "³"+;
   STR(E_INS[I,T, 1],3)+"³"+STR(E_INS[I,T, 2],3)+"³"+NUME(E_INS[I,T, 3],4)+"³"+STR(E_INS[I,T, 4],3)+"³"+;
   STR(E_INS[I,T, 5],3)+"³"+NUME(E_INS[I,T, 6],4)+"³"+STR(E_INS[I,T, 7],3)+"³"+STR(E_INS[I,T, 8],3)+"³"+;
   NUME(E_INS[I,T, 9],4)+"³"+STR(E_INS[I,T,10],3)+"³"+STR(E_INS[I,T,11],3)+"³"+NUME(E_INS[I,T,12],4)+"³"+;
   STR(E_INS[I,T,13],3)+"³"+STR(E_INS[I,T,14],3)+"³"+NUME(E_INS[I,T,15],4)+"³" )

   IF T < C_TOR+1
      T++
   ELSE
     T=1
     I++

     AADD ( LIN, "ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÄ´" )
   ENDIF

ENDDO

***   TOROS   ***
I=1
T=1
DO WHILE T<=C_TOR

   AADD ( LIN, "³"+IF(T=1,"TOTAL ",SPACE(6))+"³"+TOR[T]+"  ³"+;
   STR(E_TOR[T, 1],3)+"³"+STR(E_TOR[T, 2],3)+"³"+NUME(E_TOR[T, 3],4)+"³"+STR(E_TOR[T, 4],3)+"³"+;
   STR(E_TOR[T, 5],3)+"³"+NUME(E_TOR[T, 6],4)+"³"+STR(E_TOR[T, 7],3)+"³"+STR(E_TOR[T, 8],3)+"³"+;
   NUME(E_TOR[T, 9],4)+"³"+STR(E_TOR[T,10],3)+"³"+STR(E_TOR[T,11],3)+"³"+NUME(E_TOR[T,12],4)+"³"+;
   STR(E_TOR[T,13],3)+"³"+STR(E_TOR[T,14],3)+"³"+NUME(E_TOR[T,15],4)+"³" )

   T++
ENDDO

AADD ( LIN, "ÔÍÍÍÍÍÍÏÍÍÍÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÍ¾" )


MOSTRAR(LIN,2)

IMPRES(LIN)