PROCEDURE INF_BAJ()

CLS
PRIVATE AN:=YEAR(DIA)
@  0, 0 TO 23,79 DOUBLE
@  0, 2 SAY " DATOS ESTADISTICOS DE BAJAS "

@  4,27 SAY "INGRESE A�O INFORMAR:" GET AN PICTURE'9999' VALID AN > 1900

SET CURSOR ON
READ
SET CURSOR OFF

MARCO( 9,11,13,67 )
@11,15  SAY 'PROCESANDO LOS DATOS . POR FAVOR ESPERE UN MOMENTO'

PRIVATE VAT , FE
SELECT VACTOT
LOCATE FOR ANIO = AN

IF FOUND()

   IF ACTUA
      SELECT TAMBO
      COUNT TO VAT FOR NROPAR>0
      SELECT VACTOT
      VAT = ROUND( (VAT+VACTOT) / 2 ,0 )
      REPLACE ACTUA WITH .F., VACTOT WITH VAT
   ELSE
      VAT = VACTOT
   ENDIF

ELSE

   @ 9,11 CLEAR TO 13,67
   MENSAJE('NO HAY DATOS DE VACA TOTAL PARA ESE A�O. CUALQUIER TECLA PARA CONTINUAR...',.T.)
   INKEY(0)
   RETURN

ENDIF


SELECT motivo
PRIVATE C_TIP:=0
DBEVAL( {|| C_TIP++ } )
PRIVATE C_VEN[C_TIP], C_MUE[C_TIP], C_TOT[C_TIP], P_VEN[C_TIP], P_MUE[C_TIP],;
        P_TOT[C_TIP], T_VEN:=0, T_MUE:=0, T_TOT, P_TVE, P_TMU, P_TTO, T:=1,;
        LIN:={}

AFILL( C_VEN, 0 )
AFILL( C_MUE, 0 )

GO TOP

DO WHILE !EOF()

   SELECT BACENF
   GO TOP

   DO WHILE !EOF()

      ***   CANTIDAD VENTAS Y MUERTAS   ***
      IF YEAR(FECHA)=AN.AND.MOTIV1=motivo->codmot.OR.MOTIV2=motivo->codmot
         C_VEN[T] += IF(DESTIN='V', 1, 0)
         C_MUE[T] += IF(DESTIN='M', 1 ,0)
      ENDIF

      SKIP

   ENDDO

   ***   CANTIDAD TOTAL   ***
   C_TOT[T] = C_VEN[T] + C_MUE[T]

   ***   PORCENTAJES   ***
   P_VEN[T] = ROUND( (C_VEN[T]) / VAT * 100 ,2)
   P_MUE[T] = ROUND( (C_MUE[T]) / VAT * 100 ,2)
   P_TOT[T] = ROUND( (C_TOT[T]) / VAT * 100 ,2)

   ***   TOTAL VENTAS Y MUERTAS   ***
   T_VEN += C_VEN[T]
   T_MUE += C_MUE[T]

   SELECT motivo
   SKIP
   T ++

ENDDO

***   TOTAL   ***
T_TOT = T_VEN + T_MUE

***   PORCENTAJES TOTALES   ***
P_TVE = ROUND( (T_VEN) / VAT * 100 ,2)
P_TMU = ROUND( (T_MUE) / VAT * 100 ,2)
P_TTO = ROUND( (T_TOT) / VAT * 100 ,2)





AADD(LIN, PADC("DATOS ESTADISTICOS DE BAJAS",80) )
AADD(LIN, "������������������������������������������������������������������������������ͻ")
AADD(LIN, "�"+PADC('A�O: '+STR(AN,4)+' - '+LTRIM(STR(VAT))+' VACAS TOTAL',78)+"�")
AADD(LIN, "������������������������������������������������������������������������������Ķ")
AADD(LIN, "�   Causas             � Total   Porc.  � Ventas   Porc.  �   Muerta   Porc.   �")
AADD(LIN, "������������������������������������������������������������������������������Ķ")

SELECT motivo
GO TOP
T=1

DO WHILE !EOF()

    AADD(LIN, "�"+conmot+"  � "+NUMENT(C_TOT[T],5)+SPACE(3)+NUME(P_TOT[T],5)+;
              " %�  "+NUMENT(C_VEN[T],5)+SPACE(3)+NUME(P_VEN[T],5)+;
              " %�    "+NUMENT(C_MUE[T],5)+SPACE(3)+NUME(P_MUE[T],5)+" % �")

   SKIP
   T++

ENDDO

AADD(LIN, "������������������������������������������������������������������������������Ķ")
AADD(LIN, "�  TOTALES             � "+NUMENT(T_TOT,5)+SPACE(3)+NUME(P_TTO,5)+" %�  "+;
          NUMENT(T_VEN,5)+SPACE(3)+NUME(P_TVE,5)+" %�    "+NUMENT(T_MUE,5)+;
          SPACE(3)+NUME(P_TMU,5)+" % �")

AADD(LIN, "������������������������������������������������������������������������������ͼ")


MOSTRAR (LIN,5)

IMPRES (LIN)
