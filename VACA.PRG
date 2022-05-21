FUNCTION VACA(COD)

SELECT TAMBO
PRIVATE LIN:={}
CLS

*
AADD(LIN,"                               здддддддддддддддд©                               ")
AADD(LIN,"                               Ё VACA: "+Cod+" Ё                               ")
AADD(LIN,"зддддддддддддддддддддбдддддддддаддддддддддддддддадддддддддддддддддддддддддддддд©")
AADD(LIN,"Ё 1   IDENTIFICACION Ё FECHA      PADR   MADR       RC        RFL  MOT         Ё")
AADD(LIN,"Ё                    Ё "+DTOC(FECNAC)+SPACE(3)+PADRE+SPACE(3)+MADRE+SPACE(3)+RC+spac(3)+;
             REFILA+SPACE(4)+CODRFL+SPACE(8)+"Ё")



AADD(LIN,"цддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢")
AADD(LIN,"Ё 2   PARTO          Ё FECHA     IDEN      T   NR  LAC GES  IPP ULT  ACUM SCOREЁ")

sele partos
seek cod
ipp = 0
fecpar_ant = ctod ("")
do whil codvac = cod
   fecpar_ant  = fecpar
   AADD(LIN,"Ё                    Ё "+DTOC(FECPAR)+SPACE(2)+SEXO+SPACE(2)+TIPPAR+SPACE(3)+STR(NROPAR,2)+SPACE(2);
            +STR(DIALAC,3)+SPACE(5)+STR(IPP,4)+SPACE(5)+STR(ACUPRO,5)+ SPACE (6)+"Ё")
   skip
   ipp = fecpar - fecpar_ant
endd
sele tambo
IF Empty (fecpar_ant)
   ipp = 0
ELSE
   ipp = fecpar - fecpar_ant
ENDIF
AADD(LIN,"Ё                    Ё "+DTOC(FECPAR)+SPACE(2)+SEXO+SPACE(2)+TIPPAR+SPACE(3)+STR(NROPAR,2)+SPACE(2);
         +STR(DIALAC,3)+SPACE(1)+STR(DIAGES,3)+SPACE(1)+STR(IPP,4)+SPACE(1)+STR(ULTPRO,3)+SPACE(1)+STR(ACUPRO,5);
         +SPACE (3) + STR (SCOREC,3,1)+ "Ё")





AADD(LIN,"цддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢" )
AADD(LIN,"Ё 3   SERVICIO       Ё FECHA      TORO  INS   NЬ  NЬPAR   P/S   P/P   GES      Ё")
SELECT SERVIC
SEEK COD
DO WHILE CODVAC = COD
   AADD(LIN,"Ё                    Ё "+DTOC(FECSER)+SPACE(3)+TORO+SPACE(2)+INSEMI+SPACE(2)+STR(NROSER,2)+SPACE(5)+;
            str(nropar,2)+spac(3)+IF(NROSER=1.and.tambo->nropar=nropar,STR(TAMBO->PARSER,3),SPACE(3))+;
            SPACE(3)+IF(RESULT='P',STR(TAMBO->PARPRE,3),SPACE(3))+;
            SPACE(3)+IF(NROSER=TAMBO->NROSER.AND.TAMBO->DIAGES>0,STR(TAMBO->DIAGES,3),SPACE(3))+SPACE(6)+"Ё")

   SKIP
ENDDO
SELECT TAMBO




AADD(LIN,"цддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢")
AADD(LIN,"Ё 4   TACTO          Ё FECHA      R   FPA                                      Ё")
AADD(LIN,"Ё                    Ё "+DTOC(FECTAC)+SPACE(3)+RESULT+SPAC(3)+DTOC(FPAPRO)+SPACE(33)+"Ё")


AADD(LIN,"цддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢")
AADD(LIN,"Ё 5   SECADO         Ё FECHA                       SEC   LAC                   Ё")
AADD(LIN,"Ё                    Ё "+DTOC(FINLAC)+SPACE(20)+STR(DIASEC,3)+SPACE(3)+STR(ANTLAC,3)+SPACE(19)+"Ё")
AADD(LIN,"цддддддддддддддддддддеддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢")
AADD(LIN,"Ё 6   ENFERMERIA     Ё FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  Ё")

IF MARENF
   SELECT ENFERM
   SEEK COD
   DO WHILE CODVAC = COD
      IF MARCA
         AADD(LIN,"Ё                    Ё "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                  +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"Ё")
      ENDIF
      SKIP
   ENDDO
   SELECT TAMBO
ENDIF
AADD(LIN,"юддддддддддддддддддддаддддддддддддддддддддддддддддддддддддддддддддддддддддддддды")

RETURN LIN





*AADD(LIN,"зддддддддддддддддддддбдддддддддаддддддддддддддддадддддддддддддддддддддддддддддд©")
*AADD(LIN,"Ё 1   IDENTIFICACION Ё FECHA      PADR   MADR       RC        RFL  MOT         Ё")
*AADD(LIN,"Ё                    Ё "+DTOC(FECNAC)+SPACE(3)+PADRE+SPACE(3)+MADRE+SPACE(3)+RC+spac(3)+;
*            REFILA+SPACE(4)+CODRFL+SPACE(8)+"Ё")
