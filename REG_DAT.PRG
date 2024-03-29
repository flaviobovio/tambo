PROCEDURE REG_DAT (TD)
PRIVATE LIN
DO CASE
CASE TD = 1
   APPEND BLANK
   REPLACE CODVAC WITH COD, FECNAC WITH FNA, PADRE WITH PAD , MADRE  WITH MAD, RC WITH WRC
CASE TD = 2
   LIN=VACA(COD)
   IMPRES(LIN,2)
   if !empt(tambo->fecpar)
      sele partos
      appe blan
      repl codvac with tambo->codvac, nropar with tambo->nropar,;
           fecpar with tambo->fecpar, sexo   with tambo->sexo  ,;
           tippar with tambo->tippar, dialac with tambo->dialac,;
           diasec with tambo->diasec, acupro with tambo->acupro
      ipp = fpa - tambo->fecpar
   else
      ipp = 0
   endi
   SELECT TAMBO
   REPLACE FECPAR WITH FPA, SEXO WITH SEX  , NROPAR WITH NPA, TIPPAR WITH TPA,;
         DIALAC WITH VAL( STR (DIA-FECPAR,3) ), parpar WITH ipp

   LIM_DAT()
   SELECT VACTOT
   LOCATE FOR ANIO=YEAR(FPA)
   IF !FOUND()
      APPEND BLANK
      REPLACE ANIO WITH YEAR(FPA)
   ENDIF
   REPLACE ACTUA WITH .T.

CASE TD = 3
   FPA = FECPAR
   ASE = FECSER
   REPLACE FECSER WITH FSE, TORO WITH TOR  , INSEMI WITH INS, NROSER WITH NSE
   repl fpapro with fse + 282
   ***   INTERVALO PARTO 1er SERVICIO   ***
   IF NROSER=1 .AND. (FSE-FECPAR) < 1000
      REPLACE PARSER WITH (FSE-FECPAR)
   ENDIF
   SELECT SERVIC
   APPEND BLANK
   REPLACE CODVAC WITH COD, FECPAR WITH FPA, FECSER WITH FSE, ANTSER WITH ASE, TORO WITH TOR,;
   INSEMI WITH INS, NROSER WITH NSE, NROPAR WITH TAMBO->NROPAR
   SELECT TOROS
   LOCATE FOR TORO = TOR
   IF DTOTAL = 1
      REPLACE DORIGI WITH 0
   ENDIF
   REPLACE DSAIFI WITH DSAIFI-1, DTOTAL WITH DTOTAL-1
CASE TD = 4
   REPLACE FECTAC WITH FTA, RESULT WITH RES
   ***   PARTO PRENIEZ   ***
   IF RES='P' .AND. (FECSER-FECPAR)<1000
      REPLACE PARPRE WITH (FECSER-FECPAR)
   ENDIF
   ***   DIAS DE GESTACION   ***
   IF RES = 'P'
      REPLACE DIAGES WITH VAL( STR(DIA-FECSER,3) )
   ENDIF
   *
   FSE = FECSER
   SELECT SERVIC
   SEEK COD+DTOS(FSE)
   IF FOUND()
      REPLACE RESULT WITH RES
    ENDIF
CASE TD = 5
   REPLACE FINLAC WITH FIN , DIALAC WITH 0, ANTSEC WITH 0
   REPLACE DIASEC WITH VAL( STR(DIA-FINLAC,3) )
   REPLACE ANTLAC WITH VAL( STR(FINLAC-FECPAR,3))
CASE TD = 6
   IF DES = 'V' .OR. DES = 'M'
      FP=FECPAR
      DELETE
      IF FP>CTOD('  /  /  ')
         SELECT BACENF
         APPEND FROM ENFERM FOR CODVAC = COD
         APPEND BLANK
         REPLACE CODVAC WITH COD, FECHA  WITH FEN, DIAPAR WITH DPA, DIAACU WITH DAC
         REPLACE MOTIV1 WITH MOT[1], MOTIV2 WITH MOT[2]
         REPLACE TRATA1 WITH TRA[1], TRATA2 WITH TRA[2], TRATA3 WITH TRA[3], TRATA4 WITH TRA[4]
         REPLACE DESTIN WITH DES
      ENDIF
      SELECT ENFERM
      DELETE FOR CODVAC = COD
      SELECT BACSER
      APPEND FROM SERVIC FOR CODVAC=COD
      SELECT SERVIC
      DELETE FOR CODVAC=COD
   ELSE
      IF DES = 'R'
         REPLACE MARENF WITH .F.
      ELSE
         REPLACE MARENF WITH .T.
      ENDIF
      SELECT ENFERM
      APPEND BLANK
      REPLACE CODVAC WITH COD, FECHA  WITH FEN, DIAPAR WITH DPA, DIAACU WITH DAC
      REPLACE MOTIV1 WITH MOT[1], MOTIV2 WITH MOT[2]
      REPLACE TRATA1 WITH TRA[1], TRATA2 WITH TRA[2], TRATA3 WITH TRA[3], TRATA4 WITH TRA[4]
      REPLACE DESTIN WITH DES
      IF DES = 'R'
         REPLACE MARCA WITH .F.
         REPLACE MARCA WITH .F. FOR CODVAC=COD
      ELSE
         REPLACE MARCA WITH .T.
         REPLACE MARCA WITH .T. FOR CODVAC=COD
      ENDIF
   ENDIF
CASE TD = 7
   REPLACE REFILA WITH RFL, CODRFL WITH CFL
ENDCASE
COMMIT
#INCLUDE 'LIM_DAT.PRG'
