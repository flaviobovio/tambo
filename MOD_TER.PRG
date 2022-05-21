PROCEDURE MOD_TER()

PRIVATE TD, COD
*, ENT , PAD , MAD, SAL, CDI, LLE, KAL
*PRIVATE FEN := CTOD('') , DPA:=0 , DAC:=0, MOT[2] ,TRA[4], DES:=SPACE(1)

TD=TID_TER()




SELECT GUACHE
CLS
COD=SPACE(8)
MENSAJE('INGRESE EL CODIGO DEL TERNERO')
@  0,31 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
@  1,31 SAY "³ TER.:          ³"
@  2,31 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
@  1,39 GET COD PICTURE '@!' VALID EXI_TER(COD)
SET CURSOR ON
READ
SET CURSOR OFF
@24, 0 CLEAR

PRIVATE ARR, LINEA := -2
ARR = TERNER( COD )
AEVAL(  ARR, {|x|  QQOUT (x), LINEA++ } )


DO CASE
   CASE TD = 1

      @  4,23 GET Fecent VALID Fecent > CTOD("")
      @  4,32 GET Padre PICTURE "@! XXXX" ;
                      VALID Padre=SPACE(4) .OR. EXI_TOR(Padre,.T.)
      @  4,37 GET Madre PICTURE "@!"
      SET CURSOR ON
      READ
      SET CURSOR OFF


   CASE TD = 2
      @  4,46 GET Fecsal
      SET CURSOR ON
      READ
      SET CURSOR OFF
      commit

      replace Candia with Fecsal - FECENT
      SETCOLOR ( INVER )
      @  4,55 SAY Candia PICTURE "999"
      SETCOLOR ( COMUN )

   CASE TD = 3
      @  4,65 GET L_leche PICTURE "9999"
      SET CURSOR ON
      READ
      SET CURSOR OFF

   CASE TD = 4
      @  4,74 GET K_alime PICTURE "9999"
      SET CURSOR ON
      READ
      SET CURSOR OFF

   CASE TD = 5


      SET CURSOR ON




      SELECT ENFgua
      SEEK COD
      DAC=FECHA
      DO WHILE CODIGO = COD
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
      REPLACE ENFGUA->MOTIV1 WITH MOT[1], ENFGUA->MOTIV2 WITH MOT[2]
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
      REPLACE ENFGUA->TRATA1 WITH TRA[1], ENFGUA->TRATA2 WITH TRA[2], ENFGUA->TRATA3 WITH TRA[3], ENFGUA->TRATA4 WITH TRA[4]
      IF MOT[1]=SPACE(4) .AND. TRA[1]=SPACE(2)
         PRIVATE AR3 := {'RODEO','VENTA','MUERTA'}
         PANT = SAVESCREEN(LINEA-4,71,LINEA,78)
         @ LINEA-4,71 TO LINEA,78 DOUBLE
         DE = ACHOICE (LINEA-3,72,LINEA-1,77,AR3,"ACH_FUN")
         RESTSCREEN(LINEA-4,71,LINEA,78,PANT)
         DO CASE
         CASE DE = 1
            ENFGUA->DESTIN = 'R'
         CASE DE = 2
            ENFGUA->DESTIN = 'V'
         CASE DE = 3
            ENFGUA->DESTIN = 'M'
         ENDCASE
         SETCOLOR(INVER)
         @ LINEA  ,74 SAY ENFGUA->DESTIN
         SETCOLOR(COMUN)
         IF ENFGUA->DESTIN = 'M' .OR. ENFGUA->DESTIN = 'V'
            SELECT GUACHE
            DELETE
            SELECT BACENF
            APPEND FROM ENFGUA FOR CODIGO = COD
            SELECT ENFGUA
            DELETE FOR CODIGO = COD
         ENDIF
      ENDIF







      SET CURSOR OFF


ENDCASE

COMMIT


MENSAJE ('EL REGISTRO SE HA MODIFICADO. CUALQUIER TECLA CONTINUAR')
INKEY(0)