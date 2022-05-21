PROCEDURE VAR_MO2 (TD)
PRIVATE NS:=7

LIN[ 1] = "³ 1   IDENTIFICACION ³ FECHA      PADR   MADR       RC         RFL  MOT        ³"
LIN[ 2] = "³                    ³ "+DTOC(FECNAC)+SPACE(3)+PADRE+SPACE(3)+MADRE+SPACE(3)+RC+SPACE(3)+REFILA+SPACE(4)+CODRFL+SPACE(8)+"³"
LIN[ 3] = "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
LIN[ 4] = "³ 2   PARTO          ³ FECHA      IDEN       T    NR   LAC   GES   ULT   ACUM  ³"
LIN[ 5] = "³                    ³ "+DTOC(FECPAR)+SPACE(3)+SEXO+SPACE(3)+TIPPAR+SPACE(4)+STR(NROPAR,2)+SPACE(3);
         +STR(DIALAC,3)+SPACE(3)+STR(DIAGES,3)+SPACE(3)+STR(ULTPRO,3)+SPACE(2)+STR(ACUPRO,5)+"  ³"
LIN[ 6] = "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
LIN[ 7] = "³ 3   SERVICIO       ³ FECHA      TORO  INS   NR   P/S   P/P   GES             ³"
IF NROSER>0
   SELECT SERVIC
   SEEK COD
   DO WHILE CODVAC = COD
      IF fecpar = tambo->fecpar
        NS = NS + 1

         LIN[NS] = "³                    ³ "+DTOC(FECSER)+SPACE(3)+TORO+SPACE(2)+INSEMI+SPACE(2)+STR(NROSER,2)+SPACE(3);
                +IF(NS=8,STR(TAMBO->PARSER,3),SPACE(3))+SPACE(3)+STR(TAMBO->PARPRE,3)+SPACE(3)+STR(TAMBO->DIAGES,3)+SPACE(13)+"³"
      ENDIF
      SKIP
   ENDDO
   skip -1
   SELECT TAMBO
ENDIF
LIN[NS+1] = "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
LIN[NS+2] = "³ 4   TACTO          ³ FECHA      R                                            ³"
LIN[NS+3] = "³                    ³ "+DTOC(FECTAC)+SPACE(3)+RESULT+SPACE(44)+"³"
LIN[NS+4] = "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
LIN[NS+5] = "³ 5   SECADO         ³ FECHA                       SEC   LAC                   ³"
LIN[NS+6] = "³                    ³ "+DTOC(FINLAC)+SPACE(20)+STR(DIASEC,3)+SPACE(3)+STR(ANTLAC,3)+SPACE(19)+"³"
LIN[NS+7] = "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
LIN[NS+8] = "³ 6   ENFERMERIA     ³ FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  ³"
IF MARENF
   SELECT ENFERM
   SEEK COD
   DO WHILE CODVAC = COD
      IF MARCA
         LIN[NS+9] = "³                    ³ "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                     +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"³"
         NS ++
      ENDIF
      SKIP
   ENDDO
   SELECT TAMBO
ENDIF
