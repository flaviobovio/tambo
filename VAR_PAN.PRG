PROCEDURE VAR_PAN ( )
AADD(LIN,"                                 ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿                                 ")
AADD(LIN,"                                 ³ VACA: "+Cod+" ³                                 ")
AADD(LIN,"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿")

AADD(LIN,"³ 1   IDENTIFICACION ³ FECHA      PADR   MADR   RFL  MOT                       ³")

AADD(LIN,"³                    ³ "+DTOC(FECNAC)+SPACE(3)+PADRE+SPACE(3)+MADRE+SPACE(3)+REFILA+SPACE(4)+CODRFL+SPACE(22)+"³")
AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD(LIN,"³ 2   PARTO          ³ FECHA      IDEN   T    NR   LAC   GES   ULT   ACUM      ³")
AADD(LIN,"³                    ³ "+DTOC(FECPAR)+SPACE(3)+SEXO+SPACE(3)+TIPPAR+SPACE(4)+STR(NROPAR,2)+SPACE(3);
         +STR(DIALAC,3)+SPACE(3)+STR(DIAGES,3)+SPACE(3)+STR(ULTPRO,3)+SPACE(2)+STR(ACUPRO,5)+SPACE(6)+"³")
AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´" )
AADD(LIN,"³ 3   SERVICIO       ³ FECHA      TORO  INS   NR   P/S   P/P   GES             ³")
IF NROSER>0
   SELECT SERVIC
   SEEK COD
   DO WHILE CODVAC = COD
      AADD(LIN,"³                    ³ "+DTOC(FECSER)+SPACE(3)+TORO+SPACE(2)+INSEMI+SPACE(2)+STR(NROSER,2)+SPACE(3)+;
               IF(NROSER=1,STR(TAMBO->PARSER,3),SPACE(3))+SPACE(3)+IF(RESULT='P',STR(TAMBO->PARPRE,3),SPACE(3))+;
               SPACE(3)+IF(NROSER=TAMBO->NROSER.AND.TAMBO->DIAGES>0,STR(TAMBO->DIAGES,3),SPACE(3))+SPACE(13)+"³")
      SKIP
   ENDDO
   SELECT TAMBO
ENDIF
AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD(LIN,"³ 4   TACTO          ³ FECHA      R                                            ³")
AADD(LIN,"³                    ³ "+DTOC(FECTAC)+SPACE(3)+RESULT+SPACE(44)+"³")
AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD(LIN,"³ 5   SECADO         ³ FECHA                       SEC   LAC                   ³")
AADD(LIN,"³                    ³ "+DTOC(FINLAC)+SPACE(20)+STR(DIASEC,3)+SPACE(3)+STR(ANTLAC,3)+SPACE(19)+"³")
AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD(LIN,"³ 6   ENFERMERIA     ³ FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  ³")

IF MARENF
   SELECT ENFERM
   SEEK COD
   DO WHILE CODVAC = COD
      IF MARCA
         AADD(LIN,"³                    ³ "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                  +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"³")
      ENDIF
      SKIP
   ENDDO
   SELECT TAMBO
ENDIF

AADD(LIN,"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ")