PROCEDURE ING_TER()

PRIVATE TD, COD , ENT , PAD , MAD, SAL, CDI, LLE, KAL
PRIVATE FEN := CTOD('') , DPA:=0 , DAC:=0, MOT[2] ,TRA[4], DES:=SPACE(1)

TD=TID_TER()



DO WHILE .T.

   SELECT GUACHE
   CLS
   COD=SPACE(8)
   MENSAJE('INGRESE EL CODIGO DEL TERNERO')
   @  0,31 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
   @  1,31 SAY "³ TER.:          ³"
   @  2,31 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
   IF TD=1
      @  1,39 GET COD PICTURE '@!' VALID COD#SPACE(8) .AND. !EXI_TER(COD)
   ELSE
      @  1,39 GET COD PICTURE '@!' VALID EXI_TER(COD)
   ENDIF
   SET CURSOR ON
   READ
   SET CURSOR OFF
   @24, 0 CLEAR

   PRIVATE ARR, LINEA := -1
   ARR = TERNER( COD )
   AEVAL(  ARR, {|x|  QQOUT (x), LINEA++ } )
   IF TD = 5
      @ LINEA , 0 SAY "³"+SPACE(20)+"³"+SPACE(57)+"³"
      @ LINEA+1, 0 SAY ARR[LINEA+1]

   ENDIF


   DO CASE
      CASE TD = 1
         Ent = CTOD("")
         Pad = SPACE(4)
         Mad = SPACE(8)

         @  4,23 GET Ent VALID Ent > CTOD("")
         @  4,32 GET Pad PICTURE "@! XXXX" ;
                         VALID Pad=SPACE(4) .OR. EXI_TOR(Pad,.T.)
         @  4,37 GET Mad PICTURE "@!"
         SET CURSOR ON
         READ
         SET CURSOR OFF


      CASE TD = 2
         Sal = CTOD("")
         @  4,46 GET Sal
         SET CURSOR ON
         READ
         SET CURSOR OFF

         Cdi = Sal - GUACHE->FECENT
         SETCOLOR ( INVER )
         @  4,55 SAY Cdi PICTURE "999"
         SETCOLOR ( COMUN )

      CASE TD = 3
         Lle = 0
         @  4,65 GET Lle PICTURE "9999"
         SET CURSOR ON
         READ
         SET CURSOR OFF

      CASE TD = 4
         Kal = 0
         @  4,74 GET Kal PICTURE "9999"
         SET CURSOR ON
         READ
         SET CURSOR OFF

      CASE TD = 5


   SET CURSOR ON
   DAC=0
   DPA=0
   IF MARENF
      SELECT ENFGUA
      SEEK COD
      DAC=FECHA
      DO WHILE CODIGO = COD
         DPA=FECHA
         SKIP
      ENDDO
      SELECT GUACHE
   ENDIF
   @ LINEA,23 GET FEN VALID FEN > CTOD("")
   READ
   IF MARENF
      DAC=FEN-DAC
      DPA=FEN-DPA
   ENDIF
   SETCOLOR(INVER)
   @ LINEA  ,34 SAY DPA PICTURE'999'
   @ LINEA  ,38 SAY DAC PICTURE'999'
   SETCOLOR(COMUN)
   SELECT MOTIVO
   GO TOP
   PRIVATE AR1[ LASTREC() ], Y := 1 , MO
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
   SELECT TRATAM
   PRIVATE AR2[ LASTREC() ] , TR
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
   SELECT GUACHE
   IF MOT[1]=SPACE(4) .AND. TRA[1]=SPACE(2)
      PRIVATE AR3 := {'RODEO','VENTA','MUERTO'}
      PANT = SAVESCREEN(LINEA-4,71,LINEA,78)
      @ LINEA-4,71 TO LINEA,78 DOUBLE
      DE = ACHOICE (LINEA-3,72,LINEA-1,77,AR3,"ACH_FUN" )
      RESTSCREEN(LINEA-4,71,LINEA,78,PANT)
      DO CASE
      CASE DE = 1
         DES = 'R'
      CASE DE = 2
         DES = 'V'
      CASE DE = 3
         DES = 'M'
      ENDCASE
      SETCOLOR(INVER)
      @ LINEA  ,74 SAY DES
      SETCOLOR(COMUN)
   ENDIF

   SET CURSOR OFF














   ENDCASE








   IF ACEPTA() .AND. SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )#'ESTRUC'

      SELECT GUACHE

      DO CASE
      CASE TD = 1
         APPEND BLANK
         REPLACE CODIGO WITH COD, FECENT WITH ENT, PADRE WITH PAD,;
                 MADRE WITH MAD , CANDIA WITH VAL(STR(DIA-ENT,3))
      CASE TD = 2
         REPLACE FECSAL WITH SAL, CANDIA WITH CDI
      CASE TD = 3
         REPLACE L_LECHE WITH LLE
      CASE TD = 4
         REPLACE K_ALIME WITH KAL
      CASE TD = 5



   IF DES = 'V' .OR. DES = 'M'
      DELETE
      SELECT ENFGUA
      DELETE FOR CODIGO = COD

   ELSE

      IF DES = 'R'
         REPLACE MARENF WITH .F.
      ELSE
         REPLACE MARENF WITH .T.
      ENDIF

      SELECT ENFGUA
      APPEND BLANK
      REPLACE CODIGO WITH COD, FECHA  WITH FEN, DIAPAR WITH DPA, DIAACU WITH DAC
      REPLACE MOTIV1 WITH MOT[1], MOTIV2 WITH MOT[2]
      REPLACE TRATA1 WITH TRA[1], TRATA2 WITH TRA[2], TRATA3 WITH TRA[3], TRATA4 WITH TRA[4]
      REPLACE DESTIN WITH DES
      IF DES = 'R'
         REPLACE MARCA WITH .F.
         REPLACE MARCA WITH .F. FOR CODIGO=COD
      ELSE
         REPLACE MARCA WITH .T.
         REPLACE MARCA WITH .T. FOR CODIGO=COD
      ENDIF
   ENDIF







      ENDCASE

      COMMIT

   ENDIF


   MENSAJE ('< Enter > CONTINUAR INGRESANDO    < F > FINALIZAR')
   Z=0
   DO WHILE Z#13 .AND. UPPER(CHR(Z))#'F'
      Z=INKEY()
   ENDDO
   @ 24, 0 CLEAR
   IF Z#13
      EXIT
   ENDIF


ENDDO