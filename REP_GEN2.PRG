PROCEDURE REP_GEN(EN)
PRIVATE LI:=16, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(3)
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=16
      @   0,  0 SAY 'P═gina '+ALLTRIM(STR(PA))
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



      @   9,  0 SAY "здддддддддддддддддддддддддддддддддбддддддддддддддддддддддбдддддддддддддддддддддбддддддддддбддддддддбдддддддбдддддддддддддддддддбдддддддд©"
      @  10,  0 SAY "Ё         IDENTIFICACION          Ё        PARTO         Ё      SERVICIO       Ё  TACTO   Ё SECADO ЁINTERV.Ё       DIAS        ЁPRODUCC.Ё"
      @  11,  0 SAY "цдддддддддддддддддддддддддддддддддеддддддддддддддддддддддедддддддддддддддддддддеддддддддддеддддддддедддддддедддбдддддддбдддддддедддддддд╢"
      @  12,  0 SAY "Ё                                 Ё                      Ё                     Ё          Ё        Ё       Ё   ЁORDE╔O Ё SECAS Ё        Ё"
      @  13,  0 SAY "Ё                                 Ё                      Ё                     Ё          Ё        Ё       Ё   цдддддддеддддддд╢        Ё"
      @  14,  0 SAY "ЁCODIGO   FECHA    PADR MADR     RЁFECHA    TERN     T NRЁFECHA    TORO INS. NRЁFECHA    RЁFECHA   ЁP/S P/PЁGESЁLAC SECЁSEC LACЁUL  ACUMЁ"
      @  15,  0 SAY "цдддддддддддддддддддддддддддддддддеддддддддддддддддддддддедддддддддддддддддддддеддддддддддеддддддддедддддддедддедддддддедддддддедддддддд╢"
   ENDIF
   @  LI,  0 SAY "Ё"
   @  LI,  1 SAY Codvac
   @  LI, 10 SAY Fecnac
   @  LI, 19 SAY Padre
   @  LI, 24 SAY Madre
   @  LI, 33 SAY Refila
   @  LI, 34 SAY "Ё"
   @  LI, 35 SAY Fecpar
   @  LI, 44 SAY Sexo
   @  LI, 53 SAY Tippar
   @  LI, 55 SAY Nropar PICTURE "99"
   @  LI, 57 SAY "Ё"
   @  LI, 58 SAY Fecser
   @  LI, 67 SAY Toro
   @  LI, 72 SAY Insemi
   @  LI, 77 SAY Nroser PICTURE "99"
   @  LI, 79 SAY "Ё"
   @  LI, 80  SAY Fectac
   @  LI, 89  SAY Result
   @  LI, 90  SAY "Ё"
   @  LI, 91  SAY Finlac
   @  LI, 99 SAY "Ё"
   @  LI,100 SAY Parser PICTURE "999"
   @  LI,104 SAY Parpre PICTURE "999"
   @  LI,107 SAY "Ё"
   @  LI,108 SAY Diages PICTURE "999"
   @  LI,111 SAY "Ё"
   @  LI,112 SAY Dialac PICTURE "999"
   @  LI,116 SAY Antsec PICTURE "999"
   @  LI,119 SAY "Ё"
   @  LI,120 SAY Diasec PICTURE "999"
   @  LI,124 SAY Antlac PICTURE "999"
   @  LI,127 SAY "Ё"
   @  LI,128 SAY Ultpro PICTURE "99"
   @  LI,131 SAY Acupro PICTURE "99999"
   @  LI,136 SAY "Ё"
   SKIP
   LI=LI+1
   IF LI > 65 .AND. !EOF()
      @  LI,  0 SAY "юдддддддддддддддддддддддддддддддддаддддддддддддддддддддддадддддддддддддддддддддаддддддддддаддддддддадддддддадддадддддддадддддддадддддддды"
      EJECT
      PA=PA+1
      LI=16
   ENDIF
ENDDO

@  LI,  0 SAY "юдддддддддддддддддддддддддддддддддаддддддддддддддддддддддадддддддддддддддддддддаддддддддддаддддддддадддддддадддадддддддадддддддадддддддды"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)