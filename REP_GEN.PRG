PROCEDURE REP_GEN(EN)
PRIVATE LI:=16, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(1)
IMPRI(3)
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27

   INKEY()
   IF LI=16
      @   0,  0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @   1,  0 SAY DIA
      @   2,  0 say 'Tambo: '+ DIR
      IF LEN(EN) <= 137
         @ 7, 0 SAY PADC(EN,137)
      ELSE
         PRIVATE E1, E2, LA:=LEN(EN)
         IF LA>274
            LA=274
         ENDIF
         IF LA/2#INT(LA#2)
            E1=INT(LA/2)+1
            E2=INT(LA/2)
         ELSE
            E1=LA/2
            E2=E1
         ENDIF
         E1=LEFT(EN,E1)
         E2=SUBSTR(EN,E1+1,E2)
         @ 7, 0 SAY PADC(E1,137)
         @ 8, 0 SAY PADC(E2,137)
      ENDIF



      @   9,  0 SAY "������������������������������������������������������������������������������������������������������������������������������������������������������Ŀ"
      @  10,  0 SAY "�         IDENTIFICACION          �        PARTO         �      SERVICIO       �  TACTO            � SECADO �INTERV.�       DIAS        �PRODUCC.      �"
      @  11,  0 SAY "������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ"
      @  12,  0 SAY "�                                 �                      �                     �                   �        �       �   �ORDE�O � SECAS �              �"
      @  13,  0 SAY "�                                 �                      �                     �                   �        �       �   ���������������Ĵ              �"
      @  14,  0 SAY "�CODIGO   FECHA    PADR MADR     R�FECHA    TERN     T NR�FECHA    TORO INS. NR�FECHA    R PA.APROX�FECHA   �P/S P/P�GES�LAC SEC�SEC LAC�UL  ACUM SCORE�"
      @  15,  0 SAY "������������������������������������������������������������������������������������������������������������������������������������������������������Ĵ"
   ENDIF
   @  LI,  0 SAY "�"
   @  LI,  1 SAY Codvac
   @  LI, 10 SAY Fecnac
   @  LI, 19 SAY Padre
   @  LI, 24 SAY Madre
   @  LI, 33 SAY Refila
   @  LI, 34 SAY "�"
   @  LI, 35 SAY Fecpar
   @  LI, 44 SAY Sexo
   @  LI, 53 SAY Tippar
   @  LI, 55 SAY Nropar PICTURE "99"
   @  LI, 57 SAY "�"
   @  LI, 58 SAY Fecser
   @  LI, 67 SAY Toro
   @  LI, 72 SAY Insemi
   @  LI, 77 SAY Nroser PICTURE "99"
   @  LI, 79 SAY "�"
   @  LI, 80  SAY Fectac
   @  LI, 89  SAY Result
   @  LI, 91  SAY Fpapro
   @  LI, 99  SAY "�"
   @  LI,100  SAY Finlac
   @  LI,108 SAY "�"
   @  LI,109 SAY Parser PICTURE "999"
   @  LI,113 SAY Parpre PICTURE "999"
   @  LI,116 SAY "�"
   @  LI,117 SAY Diages PICTURE "999"
   @  LI,120 SAY "�"
   @  LI,121 SAY Dialac PICTURE "999"
   @  LI,125 SAY Antsec PICTURE "999"
   @  LI,128 SAY "�"
   @  LI,129 SAY Diasec PICTURE "999"
   @  LI,133 SAY Antlac PICTURE "999"
   @  LI,136 SAY "�"
   @  LI,137 SAY Ultpro PICTURE "99"
   @  LI,140 SAY Acupro PICTURE "99999"
   @  LI,148 SAY Scorec PICTURE "9.9"
   @  LI,151 SAY "�"
   SKIP
   LI=LI+1
   IF LI > 65 .AND. !EOF()
      @  LI,  0 SAY "��������������������������������������������������������������������������������������������������������������������������������������������������������"
      EJECT
      PA=PA+1
      LI=16
   ENDIF
ENDDO

@  LI,  0 SAY "��������������������������������������������������������������������������������������������������������������������������������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)
