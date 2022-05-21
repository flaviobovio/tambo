FUNCTION FIL_LIS()
*
PRIVATE LI:=14, CO:=3, Cam:={NIL}, Con:={}, Val:={}, Pic, T:=1, CCV, vv
SELECT TAMBO
*
CLS
@  0, 0 TO 23,79 DOUBLE
@ 11, 1 TO 11,78
@  0, 2 SAY " LISTADOS CONDICIONADOS POR EL USUARIO "
@  2, 3 SAY "Nr CAMPO           Nr CAMPO           Nr CAMPO           Nr CAMPO"

@  3, 3 SAY " 1-Identidad     "
@  3,22 SAY " 2-RC            "
@  3,41 SAY " 3-Fec.Nacimiento"
@  3,60 SAY " 4-Padre         "

@  4, 3 SAY " 5-Madre         "
@  4,22 SAY " 6-R.F.L.        "
@  4,41 SAY " 7-C¢digo R.F.L. "
@  4,60 SAY " 8-Fecha de Parto"

@  5, 3 SAY "9-Sexo           "
@  5,22 SAY "10-Tipo de Parto "
@  5,41 SAY "11-Cant.Partos   "
@  5,60 SAY "12-Fec.Servicio  "

@  6, 3 SAY "13-Toro          "
@  6,22 SAY "14-Inseminador   "
@  6,41 SAY "15-Cant.Servicios"
@  6,60 SAY "16-Fec.Tacto     "

@  7, 3 SAY "17-Result.Tacto  "
@  7,22 SAY "18-F.Parto Aprox."
@  7,41 SAY "19-Fec.Fin Lact. "
@  7,60 SAY "20-Int.Par./Parto"

@  8, 3 SAY "21-Int.Par/1øSer "
@  8,22 SAY "22-Int.Par/Pre¤ez"
@  8,41 SAY "23-D¡as Lactancia"
@  8,60 SAY "24-Lactancia Ant."

@  9, 3 SAY "25-D¡as Seca     "
@  9,22 SAY "26-Seca Anterior "
@  9,41 SAY "27-D¡as Gestaci¢n"
@  9,60 SAY "28-Ult.Producci¢n"

@ 10, 3 SAY "29-Prod.Acumulada"
@ 10,22 SAY "30-Score Corporal"


@ 13, 3 SAY"Nr COND VALOR      Nr COND VALOR      Nr COND VALOR      Nr COND VALOR"
*
VV=0
DBEVAL( { || FIELD->LISTAR:=.T., VV++ },{ !DELETED() } )
DO WHILE T<=36
   @12, 1 SAY PADC('LISTADO DE '+LTRIM(STR(VV))+' VACAS CONDICIONADAS POR EL USUARIO',78)
   AFILL(Cam, 0)
   AADD (Cam,NIL)
   @ LI,CO   GET Cam[T] PICTURE '99' VALID Cam[T]>=0 .AND. Cam[T]<=30
   MENSAJE('INGRESE Nr = " 0 " PARA LISTAR')
   READ
   IF Cam[T] = 0
      EXIT
   ENDIF
   SIG_TIP(Cam[T])
   @ LI,CO+4 GET Con[T] VALID Con[T] $ "= # > >= < <= $ "
   MENSAJE('Ingrese =,# para Caracteres y =,#,<,<=,>,>= para N£meros o Fechas')
   READ
   @24, 0 CLEAR
   @ LI,CO+8 GET Val[T] PICTURE Pic
   READ
   CCV=&( "{ ||"+FIELD(Cam[T])+Con[T]+"Val[T].AND.FIELD->LISTAR}"  )
   VV=0
   DBEVAL({ || FIELD->LISTAR:= EVAL(CCV), VV=IF(FIELD->LISTAR ,VV++,VV)} ;
          ,{!DELETED()})
   IF CO # 60
      CO+=19
   ELSE
      CO=3
      LI++
   ENDIF
   T++
ENDDO

ENC='CONDICIONES DADAS POR EL USUARIO'
SET FILTER TO LISTAR
RETURN VV

# INCLUDE 'SIG_TIP.PRG'
# INCLUDE 'VAL_CON.PRG'
*# INCLUDE 'EVA_CON.PRG'
*# INCLUDE 'VAL_VAL.PRG'
