PROCEDURE MENU()
PRIVATE PR:=0
RESTSCREEN( 0, 0,23,79,FONDO)
SETCOLOR(NEGRO)
@  2,30, 4,49 BOX " "
@  8,29,22,50 BOX " "
@ 1, 1 CLEAR TO 6,14
@ 1, 1 TO 6,14
@ 2, 2 SAY PADC(TAMBO,12)
SETCOLOR(COMUN)
@  1,29 CLEAR TO  3,48
@  7,28 CLEAR TO 20,49
@  1,29 TO  3,48 DOUBLE
@  7,28 TO 21,49 DOUBLE
@  2,31 SAY " MENU PRINCIPAL "
FONDO=SAVESCREEN( 0, 0,24,79)

DO WHILE PR # 7
   CLEAR
   RESTSCREEN( 0, 0,23,79,FONDO)
   SET CURSOR OFF
   SETCOLOR(NEGRO)
   DIR=SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )
   @ 3, 2 SAY PADC(IF(DIR#"ESTRUC",DIR,'NINGUNO'),12)
   @ 4, 2 SAY PADC(DATES(DIA,1),12)
   @ 5, 2 SAY PADC("<F1> AYUDA",12)
   SETCOLOR(COMUN)


   @  8,31 PROMPT "1 - DATOS       " MESSAGE 'INGRESOS, BAJAS Y MODIFICACIONES DE DATOS Y FICHA DE UNA VACA'
   @ 10,31 PROMPT "2 - LISTADOS    " MESSAGE 'VER O IMPRIMIR DISTINTOS TIPOS DE LISTADOS'
   @ 12,31 PROMPT "3 - INFORMES    " MESSAGE 'REPRODUCCION, BAJAS, PROYECCION FISICA, STOCK DE SEMEM Y DISTRIBUCION DE VO'
   @ 14,31 PROMPT "4 - TAMBOS      " MESSAGE 'SELECCIONAR, CREAR O BORRAR UN TAMBO'
   @ 16,31 PROMPT "5 - GUACHERAS   " MESSAGE '                '
   @ 18,31 PROMPT "6 - VARIOS      " MESSAGE 'ARCHIVOS DE DATOS, PARAMETROS, TOROS E INSEMINADORES, ENFERMEDADES Y TRATAM.'
   @ 20,31 PROMPT "7 - FIN PROCESO " MESSAGE 'SALIR AL SISTEMA'
   MENU TO PR
   DO CASE
      CASE PR = 1
         @ 24, 0 CLEAR
         @  9,44 CLEAR TO 19,64
         @  9,44 TO 19,64 DOUBLE
         @ 10,46 PROMPT "1-Ingresos       " MESSAGE'INGRESAR IDENT., PARTO, SERVICIO , TACTO, SECADO, ENFERM., R.F.L. Y PRODUCCION'
         @ 12,46 PROMPT "2-Borrar         " MESSAGE'BORRAR UN DATO INCORRRECTO'
         @ 14,46 PROMPT "3-Modificaciones " MESSAGE'MODIFICAR DATOS YA INGRESADOS'
         @ 16,46 PROMPT "4-Bajas          " MESSAGE'DAR DE BAJA A UNA VACA'
         @ 18,46 PROMPT "5-Ficha de Vaca  " MESSAGE'VER O IMPRIMIR LA FICHA DE UNA VACA'
         MENU TO DA
         DO CASE
            CASE DA = 1
               ING_DAT()
            CASE DA = 2
               BOR_DAT()
            CASE DA = 3
               MOD_DAT()
            CASE DA = 4
               BAJ_DAT()
            CASE DA = 5
               FIC_DAT()
         ENDCASE
      CASE PR = 2
         LISTADOS()
      CASE PR = 3
         @ 24, 0 CLEAR
         @  9,44 CLEAR TO 21,67
         @  9,44 TO 21,67 DOUBLE
         @ 10,46 PROMPT "1-Reproducci¢n      " MESSAGE'EVALUACION REPRODUCTIVA'
         @ 12,46 PROMPT "2-Bajas             " MESSAGE'ESTADISTICAS DE BAJAS'
         @ 14,46 PROMPT "3-Proyecci¢n F¡sica " MESSAGE'PROYECCION FISICA DEL TAMBO (a 150 D¡as)'
         @ 16,46 PROMPT "4-Stock Semen       " MESSAGE'STOCK ACTUAL DE SEMEN'
         @ 18,46 PROMPT "5-Distribuci¢n de VO" MESSAGE'DISTRIBUCION DE VO SEGUN CANTIDAD DE PARTOS Y DIAS DE LACTANCIA'
         @ 20,46 PROMPT "6-C‚lulas Som ticas " MESSAGE'PLANILLA DE CONTEO DE CELULAS SOMATICAS'
         MENU TO DA

         DO CASE
            CASE DA = 1
               INF_REP()
            CASE DA = 2
               INF_BAJ()
            CASE DA = 3
               INF_PRO()
            CASE DA = 4
               INF_SEM()
            CASE DA = 5
               INF_DIS()
            CASE DA = 6
               INF_CEL()
         ENDCASE

      CASE PR = 4
         @ 24, 0 CLEAR
         @ 13,44 CLEAR TO 21,60
         @ 13,44 TO 21,60 DOUBLE
         @ 14,46 PROMPT "1-Seleccionar" MESSAGE'SELECCIONAR EL TAMBO SOBRE EL QUE SE VA A TRABAJAR'
         @ 16,46 PROMPT "2-Crear      " MESSAGE'CREAR UN TAMBO'
         @ 18,46 PROMPT "3-Borrar     " MESSAGE'BORRAR UN TAMBO'
         @ 20,46 PROMPT "4-Pasar VACA " MESSAGE'PASA UNA VACA DE UN TAMBO A OTRO'
         MENU TO TA
         DO CASE
            CASE TA = 1
               TAM_SEL()
            CASE TA = 2
               TAM_CRE()
            CASE TA = 3
               TAM_BOR()
            CASE TA = 4
               PASAR_VC()
         ENDCASE
      CASE PR = 5
         @ 24, 0 CLEAR
         @ 11,44 CLEAR TO 21,64
         @ 11,44 TO 21,64 DOUBLE
         @ 12,46 PROMPT "1-Ingresos       " MESSAGE'INGRESAR IDENTIDAD, ALIMENTACION Y ENFERMERIA'
         @ 14,46 PROMPT "2-Modificaciones " MESSAGE'MODIFICAR DATOS YA INGRESADOS'
         @ 16,46 PROMPT "3-Bajas          " MESSAGE'DAR DE BAJA A UN TERNERO'
         @ 18,46 PROMPT "4-Ficha de Tern. " MESSAGE'VER O IMPRIMIR LA FICHA DE UN TERNERO'
         @ 20,46 PROMPT "5-Listar         " MESSAGE'VER O IMPRIMIR LISTADOS DE LA GUACHERA'
         MENU TO GU

         DO CASE
            CASE GU = 1
               ING_TER()
            CASE GU = 2
               MOD_TER()
            CASE GU = 3
               BAJ_TER()
            CASE GU = 4
               FIC_TER()
            CASE GU = 5
               LIS_TER()
         ENDCASE


      CASE PR = 6
         @ 24, 0 CLEAR
         @ 14,44 CLEAR TO 22,76
         @ 14,44 TO 22,76 DOUBLE
         @ 15,46 PROMPT "1-Manejo Archivos de Datos   " MESSAGE'RESPALDAR, RESTAURAR Y OPTIMIZAR LOS ARCHIVOS DE DATOS'
         @ 17,46 PROMPT "2-Par metros del Sistema     " MESSAGE'CAMBIAR LOS PARAMETROS DEL SISTEMA'
         @ 19,46 PROMPT "3-Toros e Inseminadores      " MESSAGE'AGREGAR O BORRAR TOROS E INSEMINADORES'
         @ 21,46 PROMPT "4-Enfermedades y Tratamientos" MESSAGE'AGREGAR, BORRAR O LISTAR ENFERMEDADES Y TRATAMIENTOS'
         MENU TO VA
         DO CASE
            CASE VA = 1
               MAN_ARC()
            CASE VA = 2
               PAR_SIS()
            CASE VA = 3
               TOR_INS()
            CASE VA = 4
               ENF_TRA()
         ENDCASE
   ENDCASE
ENDDO

RUN ("CD..")
CLS
QUIT
