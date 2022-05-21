PROCEDURE INF_DIS()

CLS
@ 0, 0 TO 23, 79 DOUBLE
@ 0, 2 SAY ' DISTRIBUCION VO SEGUN CANTIDAD PARTOS Y DIAS DE LACTANCIA '
MARCO( 9,11,13,67 )
@11,15  SAY 'PROCESANDO LOS DATOS . POR FAVOR ESPERE UN MOMENTO'

PRIVATE L_30 [6], L_60 [6], L_90 [6], L_120[6], L_150[6], L_180[6], L_210[6], ;
        L_240[6], L_270[6], L_300[6], L_MAS[6], L_TOT[6], LIN:={}

AFILL(L_30 , 0)
AFILL(L_60 , 0)
AFILL(L_90 , 0)
AFILL(L_120, 0)
AFILL(L_150, 0)
AFILL(L_180, 0)
AFILL(L_210, 0)
AFILL(L_240, 0)
AFILL(L_270, 0)
AFILL(L_300, 0)
AFILL(L_MAS, 0)
AFILL(L_TOT, 0)

SELECT TAMBO
GO TOP

DO WHILE !EOF()
   DO CASE
   CASE NROPAR = 1
      L_30 [1] += IF(DIALAC>   0.AND.DIALAC<= 30, 1, 0 )
      L_60 [1] += IF(DIALAC>= 31.AND.DIALAC<= 60, 1, 0 )
      L_90 [1] += IF(DIALAC>= 61.AND.DIALAC<= 90, 1, 0 )
      L_120[1] += IF(DIALAC>= 91.AND.DIALAC<=120, 1, 0 )
      L_150[1] += IF(DIALAC>=121.AND.DIALAC<=150, 1, 0 )
      L_180[1] += IF(DIALAC>=151.AND.DIALAC<=180, 1, 0 )
      L_210[1] += IF(DIALAC>=181.AND.DIALAC<=210, 1, 0 )
      L_240[1] += IF(DIALAC>=211.AND.DIALAC<=240, 1, 0 )
      L_270[1] += IF(DIALAC>=241.AND.DIALAC<=270, 1, 0 )
      L_300[1] += IF(DIALAC>=271.AND.DIALAC<=300, 1, 0 )
      L_MAS[1] += IF(DIALAC>=301, 1, 0 )

   CASE NROPAR = 2
       L_30 [2] += IF(DIALAC>   0.AND.DIALAC<= 30, 1, 0 )
       L_60 [2] += IF(DIALAC>= 31.AND.DIALAC<= 60, 1, 0 )
       L_90 [2] += IF(DIALAC>= 61.AND.DIALAC<= 90, 1, 0 )
       L_120[2] += IF(DIALAC>= 91.AND.DIALAC<=120, 1, 0 )
       L_150[2] += IF(DIALAC>=121.AND.DIALAC<=150, 1, 0 )
       L_180[2] += IF(DIALAC>=151.AND.DIALAC<=180, 1, 0 )
       L_210[2] += IF(DIALAC>=181.AND.DIALAC<=210, 1, 0 )
       L_240[2] += IF(DIALAC>=211.AND.DIALAC<=240, 1, 0 )
       L_270[2] += IF(DIALAC>=241.AND.DIALAC<=270, 1, 0 )
       L_300[2] += IF(DIALAC>=271.AND.DIALAC<=300, 1, 0 )
       L_MAS[2] += IF(DIALAC>=301, 1, 0 )

   CASE NROPAR = 3
      L_30 [3] += IF(DIALAC>   0.AND.DIALAC<= 30, 1, 0 )
      L_60 [3] += IF(DIALAC>= 31.AND.DIALAC<= 60, 1, 0 )
      L_90 [3] += IF(DIALAC>= 61.AND.DIALAC<= 90, 1, 0 )
      L_120[3] += IF(DIALAC>= 91.AND.DIALAC<=120, 1, 0 )
      L_150[3] += IF(DIALAC>=121.AND.DIALAC<=150, 1, 0 )
      L_180[3] += IF(DIALAC>=151.AND.DIALAC<=180, 1, 0 )
      L_210[3] += IF(DIALAC>=181.AND.DIALAC<=210, 1, 0 )
      L_240[3] += IF(DIALAC>=211.AND.DIALAC<=240, 1, 0 )
      L_270[3] += IF(DIALAC>=241.AND.DIALAC<=270, 1, 0 )
      L_300[3] += IF(DIALAC>=271.AND.DIALAC<=300, 1, 0 )
      L_MAS[3] += IF(DIALAC>=301, 1, 0 )

   CASE NROPAR = 4
      L_30 [4] += IF(DIALAC>   0.AND.DIALAC<= 30, 1, 0 )
      L_60 [4] += IF(DIALAC>= 31.AND.DIALAC<= 60, 1, 0 )
      L_90 [4] += IF(DIALAC>= 61.AND.DIALAC<= 90, 1, 0 )
      L_120[4] += IF(DIALAC>= 91.AND.DIALAC<=120, 1, 0 )
      L_150[4] += IF(DIALAC>=121.AND.DIALAC<=150, 1, 0 )
      L_180[4] += IF(DIALAC>=151.AND.DIALAC<=180, 1, 0 )
      L_210[4] += IF(DIALAC>=181.AND.DIALAC<=210, 1, 0 )
      L_240[4] += IF(DIALAC>=211.AND.DIALAC<=240, 1, 0 )
      L_270[4] += IF(DIALAC>=241.AND.DIALAC<=270, 1, 0 )
      L_300[4] += IF(DIALAC>=271.AND.DIALAC<=300, 1, 0 )
      L_MAS[4] += IF(DIALAC>=301, 1, 0 )

   CASE NROPAR >= 5
      L_30 [5] += IF(DIALAC>   0.AND.DIALAC<= 30, 1, 0 )
      L_60 [5] += IF(DIALAC>= 31.AND.DIALAC<= 60, 1, 0 )
      L_90 [5] += IF(DIALAC>= 61.AND.DIALAC<= 90, 1, 0 )
      L_120[5] += IF(DIALAC>= 91.AND.DIALAC<=120, 1, 0 )
      L_150[5] += IF(DIALAC>=121.AND.DIALAC<=150, 1, 0 )
      L_180[5] += IF(DIALAC>=151.AND.DIALAC<=180, 1, 0 )
      L_210[5] += IF(DIALAC>=181.AND.DIALAC<=210, 1, 0 )
      L_240[5] += IF(DIALAC>=211.AND.DIALAC<=240, 1, 0 )
      L_270[5] += IF(DIALAC>=241.AND.DIALAC<=270, 1, 0 )
      L_300[5] += IF(DIALAC>=271.AND.DIALAC<=300, 1, 0 )
      L_MAS[5] += IF(DIALAC>=301, 1, 0 )

   ENDCASE
   SKIP

ENDDO

L_30 [6] = L_30 [1]+L_30 [2]+L_30 [3]+L_30 [4]+L_30 [5]
L_60 [6] = L_60 [1]+L_60 [2]+L_60 [3]+L_60 [4]+L_60 [5]
L_90 [6] = L_90 [1]+L_90 [2]+L_90 [3]+L_90 [4]+L_90 [5]
L_120[6] = L_120[1]+L_120[2]+L_120[3]+L_120[4]+L_120[5]
L_150[6] = L_150[1]+L_150[2]+L_150[3]+L_150[4]+L_150[5]
L_180[6] = L_180[1]+L_180[2]+L_180[3]+L_180[4]+L_180[5]
L_210[6] = L_210[1]+L_210[2]+L_210[3]+L_210[4]+L_210[5]
L_240[6] = L_240[1]+L_240[2]+L_240[3]+L_240[4]+L_240[5]
L_270[6] = L_270[1]+L_270[2]+L_270[3]+L_270[4]+L_270[5]
L_300[6] = L_300[1]+L_300[2]+L_300[3]+L_300[4]+L_300[5]
L_MAS[6] = L_MAS[1]+L_MAS[2]+L_MAS[3]+L_MAS[4]+L_MAS[5]
*
L_TOT[1] = L_30 [1]+L_60 [1]+L_90[1]+L_120[1]+L_150[1]+L_180[1]+L_210[1]+L_240[1]+L_270[1]+L_300[1]+L_MAS[1]
L_TOT[2] = L_30 [2]+L_60 [2]+L_90[2]+L_120[2]+L_150[2]+L_180[2]+L_210[2]+L_240[2]+L_270[2]+L_300[2]+L_MAS[2]
L_TOT[3] = L_30 [3]+L_60 [3]+L_90[3]+L_120[3]+L_150[3]+L_180[3]+L_210[3]+L_240[3]+L_270[3]+L_300[3]+L_MAS[3]
L_TOT[4] = L_30 [4]+L_60 [4]+L_90[4]+L_120[4]+L_150[4]+L_180[4]+L_210[4]+L_240[4]+L_270[4]+L_300[4]+L_MAS[4]
L_TOT[5] = L_30 [5]+L_60 [5]+L_90[5]+L_120[5]+L_150[5]+L_180[5]+L_210[5]+L_240[5]+L_270[5]+L_300[5]+L_MAS[5]
L_TOT[6] = L_30 [6]+L_60 [6]+L_90[6]+L_120[6]+L_150[6]+L_180[6]+L_210[6]+L_240[6]+L_270[6]+L_300[6]+L_MAS[6]
*


AADD(LIN, PADC("DISTRIBUCION VO SEGUN CANTIDAD PARTOS Y DIAS DE LACTANCIA", 80) )
AADD(LIN, "   иммммммммммммммммммммммммммммммяммммммяммммммяммммммяммммммяммммммямммммм╩   " )
AADD(LIN, "   ╨ DIAS LACTANCIA \ CANT.PARTOS Ё  1   Ё  2   Ё  3   Ё  4   Ё 5 +  ЁTotal ╨   " )
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre   1 y  30 D║as         Ё"+STR(L_30 [1],6)+'Ё'+STR(L_30 [2],6)+'Ё'+;
          STR(L_30 [3],6)+'Ё'+STR(L_30 [4],6)+'Ё'+STR(L_30 [5],6)+'Ё'+STR(L_30 [6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre  31 y  60 D║as         Ё"+STR(L_60 [1],6)+'Ё'+STR(L_30 [2],6)+'Ё'+;
          STR(L_60 [3],6)+'Ё'+STR(L_60 [4],6)+'Ё'+STR(L_60 [5],6)+'Ё'+STR(L_60 [6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre  61 y  90 D║as         Ё"+STR(L_90 [1],6)+'Ё'+STR(L_90 [2],6)+'Ё'+;
          STR(L_90 [3],6)+'Ё'+STR(L_90 [4],6)+'Ё'+STR(L_90 [5],6)+'Ё'+STR(L_90 [6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre  91 y 120 D║as         Ё"+STR(L_120[1],6)+'Ё'+STR(L_120[2],6)+'Ё'+;
          STR(L_120[3],6)+'Ё'+STR(L_120[4],6)+'Ё'+STR(L_120[5],6)+'Ё'+STR(L_120[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 121 y 150 D║as         Ё"+STR(L_150[1],6)+'Ё'+STR(L_150[2],6)+'Ё'+;
          STR(L_150[3],6)+'Ё'+STR(L_150[4],6)+'Ё'+STR(L_150[5],6)+'Ё'+STR(L_150[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 151 y 180 D║as         Ё"+STR(L_180[1],6)+'Ё'+STR(L_180[2],6)+'Ё'+;
          STR(L_180[3],6)+'Ё'+STR(L_180[4],6)+'Ё'+STR(L_180[5],6)+'Ё'+STR(L_180[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 181 y 210 D║as         Ё"+STR(L_210[1],6)+'Ё'+STR(L_210[2],6)+'Ё'+;
          STR(L_210[3],6)+'Ё'+STR(L_210[4],6)+'Ё'+STR(L_210[5],6)+'Ё'+STR(L_210[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 211 y 240 D║as         Ё"+STR(L_240[1],6)+'Ё'+STR(L_240[2],6)+'Ё'+;
          STR(L_240[3],6)+'Ё'+STR(L_240[4],6)+'Ё'+STR(L_240[5],6)+'Ё'+STR(L_240[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 241 y 270 D║as         Ё"+STR(L_270[1],6)+'Ё'+STR(L_270[2],6)+'Ё'+;
          STR(L_270[3],6)+'Ё'+STR(L_270[4],6)+'Ё'+STR(L_270[5],6)+'Ё'+STR(L_270[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Entre 271 y 300 D║as         Ё"+STR(L_300[1],6)+'Ё'+STR(L_300[2],6)+'Ё'+;
          STR(L_300[3],6)+'Ё'+STR(L_300[4],6)+'Ё'+STR(L_300[5],6)+'Ё'+STR(L_300[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ 301 o m═s D║as               Ё"+STR(L_MAS[1],6)+'Ё'+STR(L_MAS[2],6)+'Ё'+;
          STR(L_MAS[3],6)+'Ё'+STR(L_MAS[4],6)+'Ё'+STR(L_MAS[5],6)+'Ё'+STR(L_MAS[6],6)+"╨   ")
AADD(LIN, "   гддддддддддддддддддддддддддддддеддддддеддддддеддддддеддддддеддддддедддддд╤   " )
AADD(LIN, "   ╨ Total                        Ё"+STR(L_TOT[1],6)+'Ё'+STR(L_TOT[2],6)+'Ё'+;
          STR(L_TOT[3],6)+'Ё'+STR(L_TOT[4],6)+'Ё'+STR(L_TOT[5],6)+'Ё'+STR(L_TOT[6],6)+"╨   ")
AADD(LIN, "   хммммммммммммммммммммммммммммммоммммммоммммммоммммммоммммммоммммммомммммм╪   " )


MOSTRAR(LIN,4)

IMPRES(LIN)