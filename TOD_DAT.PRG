PROCEDURE TOD_DAT (TD,LINEA)
PRIVATE COL:=SETCOLOR() , LI := 7
DO CASE
CASE TD = 1
   cod_ant = cod
   @  1,39 GET cod   PICTURE '@!' VALID  cod=cod_ant .or. NOEXISTE(COD)
   set curs on
   read
   set curs off
   if cod # cod_ant
      seek cod_ant
      repl codvac with cod
      seek cod

      sele servic
      seek cod_ant
      if foun()
         set orde to
         repl codvac with cod for codvac = cod_ant
         set orde to 1
      endi
      sele bacser
      seek cod_ant
      if foun()
         set orde to
         repl codvac with cod for codvac = cod_ant
         set orde to 1
      endi
      sele enferm
      seek cod_ant
      if foun()
         set orde to
         repl codvac with cod for codvac = cod_ant
         set orde to 1
      endi
      sele bacenf
      seek cod_ant
      if foun()
         set orde to
         repl codvac with cod for codvac = cod_ant
         set orde to 1
      endi
   endi
   sele tambo
   @  4,23 GET FECNAC
   @  4,34 GET PADRE PICTURE'@! XXXX' VALID PADRE=SPACE(4) .OR. EXI_TOR(PADRE,.T.)
   @  4,41 GET MADRE PICTURE'@!'
   @  4,52 GET RC PICTURE'@! XXXXXXX'
   SET CURSOR ON
   READ
   SET CURSOR OFF

CASE TD = 2 .AND. FECPAR>CTOD('  /  /  ')
   wsexo = sexo
   @  7,23 GET FECPAR VALID FECPAR > CTOD('  /  /  ')
   @  7,34 GET SEXO PICTURE'@!' VALID ( SEXO='M' .OR. len(SEXO)>2 )
   SET CURSOR ON
   READ
   SET CURSOR OFF
   PANT=SAVESCREEN( 7,45, 9,61)
   @  7,45 CLEAR TO  9,61
   @  7,45 TO  9,61
   @  8,47 PROMPT 'S' MESSAGE 'PARTO SIN AYUDA'
   @  8,50 PROMPT 'C' MESSAGE 'PARTO CON AYUDA'
   @  8,53 PROMPT 'A' MESSAGE 'ABORTO'
   @  8,56 PROMPT 'M' MESSAGE 'MUERTO'
   @  8,59 PROMPT 'U' MESSAGE 'MUERTO CON AYUDA'
   MENU TO T
   DO CASE
      CASE T = 1
         TIPPAR = 'S'
      CASE T = 2
         TIPPAR = 'C'
      CASE T = 3
         TIPPAR = 'A'
      CASE T = 4
         TIPPAR = 'M'
      CASE T = 5
         TIPPAR = 'U'
   ENDCASE
   RESTSCREEN( 7,45, 9,61,PANT)
   SETCOLOR(INVER)
   @  7,45 SAY TIPPAR
   setcolor(comun)
   @  7,50 GET NROPAR PICTURE '99'
   SET CURSOR ON
   READ
   SET CURSOR OFF
   setcolor(inver)
   repl dialac with dia - fecpar
   @  7,55 SAY DIALAC PICTURE'999'
   @  7,61 SAY ANTSEC PICTURE'999'
   @  7,67 SAY ULTPRO PICTURE'999'
   @  7,72 SAY ACUPRO PICTURE'99999'
   SETCOLOR(COMUN)
   IF NROSER > 0
      SELECT SERVIC
      REPLACE FECPAR WITH TAMBO->FECPAR FOR CODVAC=COD
   ENDIF
CASE TD = 3 .AND. FECSER>CTOD('  /  /  ')
   TO = TORO
   @ LINEA,23 GET FECSER VALID FEC_PAR (FECSER)
   @ LINEA,34 GET TORO   PICTURE'@! XXXX' VALID EXI_TOR(TORO,.T.)
   @ LINEA,40 GET INSEMI PICTURE'@! XXXX' VALID EXI_INS(INSEMI,.T.)
   @ LINEA,46 GET NROSER PICTURE '99'
   SET CURSOR ON
   READ
   SET CURSOR OFF
   repl fpapro with fecser + 282
   COMMIT
   SELECT TOROS
   IF TORO # TO
      LOCATE FOR TORO = TO
      REPLACE DSAIFI WITH DSAIFI+1, DTOTAL WITH DTOTAL+1
      LOCATE FOR TORO = TAMBO->TORO
      REPLACE DSAIFI WITH DSAIFI-1, DTOTAL WITH DTOTAL-1
   ENDIF
   SELECT TAMBO
   COMMIT
   REPLACE SERVIC->FECSER WITH FECSER, SERVIC->TORO WITH TORO, SERVIC->INSEMI WITH INSEMI
   ***   INTERVALO PARTO 1er SERVICIO   ***
   IF NROSER=1 .AND. (FECSER-FECPAR) < 1000
      REPLACE PARSER WITH (FECSER-FECPAR)
   ENDIF
   *
CASE TD = 4 .AND. FECTAC>CTOD('  /  /  ')
   @  LINEA,23 GET FECTAC VALID FEC_PAR (FECTAC)
   SET CURSOR ON
   READ
   SET CURSOR OFF
   PANT=SAVESCREEN( LINEA,34, LINEA+2,53)
   @  LINEA,34 CLEAR TO  LINEA+2,53
   @  LINEA,34 TO  LINEA+2,53
   @  LINEA+1,36 PROMPT 'P' MESSAGE 'PRE¥ADA'
   @  LINEA+1,39 PROMPT 'V' MESSAGE 'VACIA'
   @  LINEA+1,42 PROMPT 'N' MESSAGE 'VACIA NORMAL'
   @  LINEA+1,45 PROMPT 'A' MESSAGE 'VACIA ANESTRO'
   @  LINEA+1,48 PROMPT 'R' MESSAGE 'PRESTADO REEXAMEN'
   @  LINEA+1,51 PROMPT 'S' MESSAGE 'SUCIA REEXAMEN'
   MENU TO R
   DO CASE
   CASE r = 1
      R = 'P'
   CASE r = 2
      R = 'V'
   CASE r = 3
      R = 'N'
   CASE r = 4
      R = 'A'
   CASE r = 5
      R = 'R'
   CASE r = 6
      R = 'S'
   ENDCASE

   RESTSCREEN( LINEA,34, LINEA+2,53,PANT)

   REPLACE RESULT WITH R
   ***   PARTO PRENIEZ   ***
   IF RESULT='P' .AND. (FECSER-FECPAR)<1000
      REPLACE PARPRE WITH (FECSER-FECPAR)
   ELSE
      REPLACE PARPRE WITH 0
   ENDIF
   ***    DIAS GESTAC.   ***
   IF RESULT = 'P'
      REPLACE DIAGES WITH VAL( STR(DIA-FECSER,3) )
   ELSE
      REPLACE DIAGES WITH 0
   ENDIF
   *
   SELECT SERVIC
   SEEK COD+DTOS(TAMBO->FECSER)
   IF FOUND()
      REPLACE RESULT WITH R
   ENDIF
   RESTSCREEN( LINEA-1,35, LINEA+1,42,PANT)
   @24, 0 CLEAR
   SETCOLOR(INVER)
   @  LINEA,34 SAY RESULT
   SETCOLOR(COMUN)

CASE TD = 5 .AND. FINLAC>CTOD('  /  /  ')
   @  LINEA,23 GET FINLAC VALID FEC_PAR (FINLAC)
   SET CURSOR ON
   READ
   SET CURSOR OFF
   IF FINLAC=CTOD('  /  /  ')
      REPLACE DIASEC WITH 0
      REPLACE DIALAC WITH VAL( STR(DIA-FECPAR,3) )
   ELSE
      REPLACE DIALAC WITH 0
      REPLACE DIASEC WITH VAL( STR(DIA-FINLAC,3) )
   ENDIF
   SETCOLOR(INVER)
   @  LINEA ,51 SAY DIASEC PICTURE'999'
   @  LINEA ,57 SAY ANTLAC PICTURE'999'
   SETCOLOR(COMUN)
CASE TD = 6 .AND. MARENF
   SELECT ENFERM
   SEEK COD
   DAC=FECHA
   DO WHILE CODVAC = COD
      DPA=FECHA
      SKIP
   ENDDO
   SKIP - 1
   @ LINEA  ,23 GET FECHA VALID FEC_PAR (FECHA)
   SET CURSOR ON
   READ
   SET CURSOR OFF
   REPLACE DIAACU WITH FECHA-DAC, DIAPAR WITH FECHA-DPA
   SETCOLOR(INVER)
   @ LINEA  ,34 SAY DIAPAR PICTURE'999'
   @ LINEA  ,38 SAY DIAACU PICTURE'999'
   SETCOLOR(COMUN)
   SELECT MOTIVO
   GO TOP
   PRIVATE AR1[ LASTREC() ], Y := 1 , MO , MOT[2]
   DO WHILE !EOF()
      AR1[Y] = CONMOT
      SKIP
      Y=Y+1
   ENDDO
   X=0
   A=1
   DO WHILE A<3
      IF A=1 .OR. MOT[A-1]#SPACE(4)
         PANT = SAVESCREEN(LINEA-6,X+51,LINEA,X+72)
         @ LINEA-6,X+51 TO LINEA,X+72 DOUBLE
         MO = ACHOICE (LINEA-5,X+52,LINEA-1,X+71, AR1,"ACH_FUN" )
         GO MO
         MOT[A]=CODMOT
         RESTSCREEN(LINEA-6,X+51,LINEA,X+72,PANT)
      ELSE
         MOT[A]=SPACE(4)
      ENDIF
      SETCOLOR(INVER)
      @ LINEA  ,X+45 SAY MOT [A]
      SETCOLOR(COMUN)
      X=X+5
      A=A+1
   ENDDO
   REPLACE ENFERM->MOTIV1 WITH MOT[1], ENFERM->MOTIV2 WITH MOT[2]
   SELECT TRATAM
   PRIVATE AR2[ LASTREC() ] , TR , TRA[4]
   Y = 1
   GO TOP
   DO WHILE !EOF()
      AR2[Y] = CONTRA
      SKIP
      Y=Y+1
   ENDDO
   X=0
   B=1
   DO WHILE B<5
      IF B=1 .OR. TRA[B-1]#SPACE(2)
         PANT = SAVESCREEN(LINEA-6,55,LINEA,78)
         @ LINEA-6,57 TO LINEA,78 DOUBLE
         TR = ACHOICE (LINEA-5,58,LINEA-1,77,AR2,"ACH_FUN" )
         GO TR
         TRA[B]=CODTRA
         RESTSCREEN(LINEA-6,55,LINEA,78,PANT)
      ELSE
         TRA[B]=SPACE(2)
      ENDIF
      SETCOLOR(INVER)
      @ LINEA,X+58 SAY TRA[B]
      SETCOLOR(COMUN)
      B=B+1
      X=X+3
   ENDDO
   REPLACE ENFERM->TRATA1 WITH TRA[1], ENFERM->TRATA2 WITH TRA[2], ENFERM->TRATA3 WITH TRA[3], ENFERM->TRATA4 WITH TRA[4]
   IF MOT[1]=SPACE(4) .AND. TRA[1]=SPACE(2)
      PRIVATE AR3 := {'RODEO','VENTA','MUERTA','R.F.L.'}
      PANT = SAVESCREEN(LINEA-5,71,LINEA,78)
      @ LINEA-5,71 TO LINEA,78 DOUBLE
      DE = ACHOICE (LINEA-4,72,LINEA-1,77,AR3,"ACH_FUN")
      RESTSCREEN(LINEA-5,71,LINEA,78,PANT)
      DO CASE
      CASE DE = 1
         ENFERM->DESTIN = 'R'
      CASE DE = 2
         ENFERM->DESTIN = 'V'
      CASE DE = 3
         ENFERM->DESTIN = 'M'
      CASE DE = 4
         ENFERM->DESTIN = 'F'
      ENDCASE
      SETCOLOR(INVER)
      @ LINEA  ,74 SAY ENFERM->DESTIN
      SETCOLOR(COMUN)
      IF ENFERM->DESTIN = 'M' .OR. ENFERM->DESTIN = 'V'
         SELECT TAMBO
         DELETE
         SELECT BACENF
         APPEND FROM ENFERM FOR CODVAC = COD
         SELECT ENFERM
         DELETE FOR CODVAC = COD
      ENDIF
   ENDIF
CASE TD = 7
   @  LINEA,48 GET REFILA VALID (REFILA=' ' .OR. REFILA='R' )
   SET CURSOR ON
   READ
   SET CURSOR OFF
   SELECT MOTIVO
   GO TOP
   PRIVATE AR1[ LASTREC() ], Y := 1
   DO WHILE !EOF()
      AR1[Y] = CONMOT
      SKIP
      Y=Y+1
   ENDDO
   PANT = SAVESCREEN(LINEA,53,LINEA+6,77)
   @ LINEA,55 TO LINEA+6,77 DOUBLE
   MO = ACHOICE (LINEA+1,56,LINEA+5,75, AR1, "ACH_FUN" )
   GO MO
   RESTSCREEN(LINEA,53,LINEA+6,77,PANT)
   SELECT TAMBO
   CODRFL=MOTIVO->CODMOT
   SETCOLOR(INVER)
   @ LINEA  ,53 SAY CODRFL
   SETCOLOR(COMUN)
CASE TD = 8
   REPLACE ACUPRO WITH ACUPRO-(ULTPRO*30)
   TO1 = ULTPRO/2
   @ LINEA,62 GET TO1 PICTURE '@ 99.9' VALID TO1 > 0
   SET CURSOR ON
   READ
   SET CURSOR OFF
   TO2=ROUND(TO1*2,0)
   @ LINEA,62 CLEAR TO LINEA,63
   SETCOLOR(INVER)
   @ LINEA,63 SAY TO2 PICTURE "999"
   SETCOLOR(COMUN)
   REPLACE ULTPRO WITH TO2, ACUPRO WITH ACUPRO+(TO2*30)
ENDCASE
SETCOLOR(COL)
