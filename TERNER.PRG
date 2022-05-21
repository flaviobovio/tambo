FUNCTION TERNER (COD)

SELECT GUACHE
PRIVATE LIN:={}
CLS

*

AADD(LIN,"                               ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                               ")
AADD(LIN,"                               ³ TER.: "+Cod+" ³                               ")
AADD(LIN,"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿")
AADD(LIN,"³ 1   IDENTIFICACION ³ ENTRADA  PADR MADR     SALIDA   DIAS Lts.LECHE Kgs.ALIM ³")
AADD(LIN,"³                    ³ "+DTOC(Fecent)+" "+Padre+" "+Madre+" "+DTOC(Fecsal)+" "+;
           STR(CanDia,4)+SPACE(6)+STR(L_Leche,4)+spac(5)+STR(K_Alime,4)+" ³" )

AADD(LIN,"ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´")
AADD(LIN,"³ 2   ENFERMERIA     ³ FECHA       DP  DA    MOTIVOS      TRATAMIENTOS    DES  ³")

IF MARENF
   SELECT ENFGUA
   SEEK COD
   DO WHILE CODIGO = COD
      IF MARCA
         AADD(LIN,"³                    ³ "+DTOC(FECHA)+SPACE(3)+STR(DIAPAR,3)+SPACE(1)+STR(DIAACU,3)+SPACE(4)+MOTIV1+SPACE(1);
                  +MOTIV2+SPACE(4)+TRATA1+SPACE(1)+TRATA2+SPACE(1)+TRATA3+SPACE(1)+TRATA4+SPACE(5)+DESTIN+SPACE(4)+"³")
      ENDIF
      SKIP
   ENDDO
   SELECT GUACHE
ENDIF
AADD(LIN,"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ")

RETURN LIN