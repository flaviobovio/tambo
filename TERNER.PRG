FUNCTION TERNER (COD)

SELECT GUACHE
PRIVATE LIN:={}
CLS

*

AADD(LIN,"                               旼컴컴컴컴컴컴컴커                               ")
AADD(LIN,"                               � TER.: "+Cod+" �                               ")
AADD(LIN,"旼컴컴컴컴컴컴컴컴컴컫컴컴컴컴컨컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴커")
AADD(LIN,"� 1   IDENTIFICACION � ENTRADA  PADR MADR     SALIDA   DIAS Lts.LECHE Kgs.ALIM �")
AADD(LIN,"�                    � "+DTOC(Fecent)+" "+Padre+" "+Madre+" "+DTOC(Fecsal)+" "+;
           STR(CanDia,4)+SPACE(6)+STR(L_Leche,4)+spac(5)+STR(K_Alime,4)+" �" )

AADD(LIN,"쳐컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑")
AADD(LIN,"� 2   ENFERMERIA     � FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  �")

IF MARENF
   SELECT ENFGUA
   SEEK COD
   DO WHILE CODIGO = COD
      IF MARCA
         AADD(LIN,"�                    � "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                  +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"�")
      ENDIF
      SKIP
   ENDDO
   SELECT GUACHE
ENDIF
AADD(LIN,"읕컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸")

RETURN LIN