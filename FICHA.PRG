PROCEDURE VACA(COD)

SELECT TAMBO
PRIVATE LIN:={}
CLS

*
AADD(LIN,"                                 旼컴컴컴컴컴커                                 ")
AADD(LIN,"                                 � VACA: "+Cod+" �                                 ")
AADD(LIN,"旼컴컴컴컴컴컴컴컴컴컫컴컴컴컴컴컨컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커")
AADD(LIN,"� 1   IDENTIFICACION � FECHA      PADR   MADR   RFL  MOT                       �")
AADD(LIN,"�                    � "+DTOC(FECNAC)+SPACE(3)+PADRE+SPACE(3)+MADRE+SPACE(3)+REFILA+SPACE(4)+CODRFL+SPACE(22)+"�")
AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑")
AADD(LIN,"� 2   PARTO          � FECHA      IDEN   T    NR   LAC   GES   ULT   ACUM      �")
AADD(LIN,"�                    � "+DTOC(FECPAR)+SPACE(3)+SEXO+SPACE(3)+TIPPAR+SPACE(4)+STR(NROPAR,2)+SPACE(3);
         +STR(DIALAC,3)+SPACE(3)+STR(DIAGES,3)+SPACE(3)+STR(ULTPRO,3)+SPACE(2)+STR(ACUPRO,5)+SPACE(6)+"�")
AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑" )
AADD(LIN,"� 3   SERVICIO       � FECHA      TORO  INS   NR   P/S   P/P   GES             �")
IF NROSER>0
   SELECT SERVIC
   SEEK COD
   DO WHILE CODVAC = COD
      AADD(LIN,"�                    � "+DTOC(FECSER)+SPACE(3)+TORO+SPACE(2)+INSEMI+SPACE(2)+STR(NROSER,2)+SPACE(3)+;
               IF(NROSER=1,STR(TAMBO->PARSER,3),SPACE(3))+SPACE(3)+IF(RESULT='P',STR(TAMBO->PARPRE,3),SPACE(3))+;
               SPACE(3)+IF(NROSER=TAMBO->NROSER.AND.TAMBO->DIAGES>0,STR(TAMBO->DIAGES,3),SPACE(3))+SPACE(13)+"�")

      SKIP
   ENDDO
   SELECT TAMBO
ENDIF
AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑")
AADD(LIN,"� 4   TACTO          � FECHA      R                                            �")
AADD(LIN,"�                    � "+DTOC(FECTAC)+SPACE(3)+RESULT+SPACE(44)+"�")
AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑")
AADD(LIN,"� 5   SECADO         � FECHA                       SEC   LAC                   �")
AADD(LIN,"�                    � "+DTOC(FINLAC)+SPACE(20)+STR(DIASEC,3)+SPACE(3)+STR(ANTLAC,3)+SPACE(19)+"�")
AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑")
AADD(LIN,"� 6   ENFERMERIA     � FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  �")

IF MARENF
   SELECT ENFERM
   SEEK COD
   DO WHILE CODVAC = COD
      IF MARCA
         AADD(LIN,"�                    � "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                  +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"�")
      ENDIF
      SKIP
   ENDDO
   SELECT TAMBO
ENDIF
AADD(LIN,"읕컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸")

RETURN LIN
 