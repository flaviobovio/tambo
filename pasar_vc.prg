PROCEDURE pasar_vc()

CLS
private c_tam:=0
aeval( tambos, { || c_tam++} )

@ 0,0 TO 23,79 DOUBLE
DIR=SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )
@  0, 2 SAY " PASAR VACA DE TAMBO " + dir + " A "

PRIVATE COD := SPACE(8)
@  4, 2 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
@  5, 2 SAY "³ VACA:          ³"
@  6, 2 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
@  5,10 GET COD PICTURE "@!" VALID EXISTE(COD)
MENSAJE('INGRESE EL CODIGO')
SET CURSOR ON
READ
SET CURSOR OFF
@24, 0 CLEAR


UL=IF(C_tam>11,18,C_tam+7)
@  4,30 SAY "PASAR A TAMBO"
@  6,31 TO UL+2,46 DOUBLE

PRIVATE TSE:= ACHOICE( 8,34,UL,43, tambos)

IF tambos[tse] = dir
    MENSAJE ("ERROR. EL TAMBO DE ORIGEN Y EL DE DESTINO SON LOS MISMOS", .T.)
    INKEY (0)
    RETURN
ENDIF
IF c_tam > 0 .AND. TSE > 0
   PATHDES = "..\" + tambos[tse] + "\"
   MENSAJE ("PASANDO DATOS VACA " + COD )

   * TAMBO
   USE (PATHDES + "TAMBO")  ALIAS DESTIN ;
        INDEX (PATHDES + "TAMBO") , (PATHDES + "PRODUC") NEW
   SET ORDER TO 1
   SEEK COD
   IF FOUND ()
      MENSAJE ("ERROR. EL YA EXISTE EN EL TAMBO DE DESTINO", .T.)
      INKEY (0)
      USE
      RETURN       
   ENDIF
   SELECT TAMBO
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   SELECT destin
   APPEND FROM destin SDF
   USE

   * PARTOS
   SELECT partos
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   USE (PATHDES + "PARTOS")  ALIAS DESTIN ;
        INDEX (PATHDES + "PARTOS") NEW
   APPEND FROM destin SDF
   USE

   * ENFERM
   SELECT enferm
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   USE (PATHDES + "enferm")  ALIAS DESTIN ;
        INDEX (PATHDES + "enferm") NEW
   APPEND FROM destin SDF
   USE


   * BACENF
   SELECT bacenf
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   USE (PATHDES + "bacenf")  ALIAS DESTIN ;
        INDEX (PATHDES + "bacenf") NEW
   APPEND FROM destin SDF
   USE

   *SERVIC
   SELECT servic
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   USE (PATHDES + "servic")  ALIAS DESTIN ;
        INDEX (PATHDES + "servic") NEW
   APPEND FROM destin SDF
   USE

   * BACSER
   SELECT bacser
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD
   USE (PATHDES + "bacser")  ALIAS DESTIN ;
        INDEX (PATHDES + "bacser") NEW
   APPEND FROM destin SDF
   USE

   * PRODUC
   SELECT produc
   COPY TO destin FOR CODVAC = COD SDF
   DELETE FOR CODVAC = COD

   USE (PATHDES + "PRODUC")  ALIAS DESTIN ;
        INDEX (PATHDES + "PROCOD"), (PATHDES + "PROLIT") NEW
   APPEND FROM destin SDF
   USE

   *
   ERASE destin.txt

ENDIF
