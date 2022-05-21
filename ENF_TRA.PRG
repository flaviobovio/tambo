PROCEDURE ENF_TRA()
DO WHILE .T.
   CLS
   @ 0, 0 TO 23,79 DOUBLE
   @  0, 2 SAY " AGREGAR, BORRAR O LISTAR ENFERMEDADES Y TRATAMIENTOS "
   @  4,33 TO 10,45 DOUBLE
   @  5,35 PROMPT "1-AGREGAR "
   @  7,35 PROMPT "2-BORRAR"
   @  9,35 PROMPT "3-LISTAR"
   MENU TO AL
   IF AL = 0
      RETURN
   ENDIF
   @  5,44 CLEAR TO 9,61
   @  5,44 TO 9,61 DOUBLE
   @  6,46 PROMPT "1-Enfermedades"
   @  8,46 PROMPT "2-Tratamientos"
   MENU TO ET
   DO CASE
   CASE AL = 1 .AND. ET = 1
      SELECT TIPOS
      PRIVATE TI:={}, RE
      DBEVAL( { || AADD(TI,CONTIP) } )
      @ 15,23 SAY "TIPO DE ENFERMEDAD:"
      @ 14,42 TO 20,55
      RE=ACHOICE(15,43,19,54,TI,,"ACH_FUN")
      GO RE
      CTI=TIPO
      @14,42 CLEAR TO 20,55
      SETCOLOR(INVER)
      @15,43 SAY CONTIP
      SETCOLOR(COMUN)
      PRIVATE ENF:=SPACE(20)
      @ 17,23 SAY "ENFERMEDAD:" GET ENF PICTURE'@!' VALID ENF # SPACE(20)
      SET CURSOR ON
      READ
      SET CURSOR OFF
      IF ACEPTA()
         SELECT MOTIVO
         GO BOTTOM
         NR:= ALLTRIM( STR( VAL(RIGHT(CODMOT,2))+1 ,2) )
         APPEND BLANK
         REPLACE CODMOT WITH CTI+ NR, CONMOT WITH ENF
      ENDIF
   CASE AL = 1 .AND. ET = 2
      TRA=SPACE(20)
      @ 17,23 SAY "TRATAMIENTO:" GET TRA PICTURE '@!' VALID TRA#SPACE(20)
      SET CURSOR ON
      READ
      SET CURSOR OFF
      IF ACEPTA()
         SELECT TRATAM
         GO BOTTOM
         NR:= ALLTRIM(STR( VAL( ALLTRIM(CODTRA) ) +1 )  )
         APPEND BLANK
         REPLACE CODTRA WITH NR, CONTRA WITH TRA
      ENDIF
   CASE AL = 2 .AND. ET = 1
      SELECT MOTIVO
      PRIVATE EN:={}, RE
      DBEVAL( { || AADD(EN,CONMOT) } )
      @ 15,23 SAY "ENFERMEDAD:"
      @ 14,34 TO 20,55
      RE=ACHOICE(15,35,19,54,EN,,"ACH_FUN")
      @ 14,34 CLEAR TO 20,55
      GO RE
      SETCOLOR(INVER)
      @15,35 SAY CONMOT
      SETCOLOR(COMUN)
      IF ACEPTA()
         DELETE
      ENDIF
   CASE AL = 2 .AND. ET = 2
      SELECT TRATAM
      PRIVATE TR:={}, RE
      DBEVAL( { || AADD(TR,CONTRA) } )
      @ 15,23 SAY "TRATAMIENTO:"
      @ 14,35 TO 20,56
      RE=ACHOICE(15,36,19,55,TR,,"ACH_FUN")
      @ 14,35 CLEAR TO 20,56
      GO RE
      SETCOLOR(INVER)
      @15,36 SAY CONTRA
      SETCOLOR(COMUN)
      IF ACEPTA()
         DELETE
      ENDIF
   CASE AL = 3
      CLS
      IF ET = 1
         PRIVATE HE:={'Cod.','Enfermedad'}, ENC:='ENFERMEDADES'
         SELECT MOTIVO
      ELSEIF ET = 2
         SELECT TRATAM
         PRIVATE HE:={'Cod.','Tratamiento'}, ENC:='TRATAMIENTOS'
      ENDIF
      @  0, 0 SAY PADC(ENC,80)
      @ 19,20 SAY "USE LAS SIGUIENTES TECLAS PARA MOVERSE"
      @ 20, 2 SAY CHR(24)+" Linea Arriba"
      @ 21, 2 SAY CHR(25)+" Linea Abajo"
      @ 22, 2 SAY CHR(27)+" Columna Izquierda"
      @ 23, 2 SAY CHR(26)+" Columna Derecha"
      @ 20,23 SAY "Inicio   Col.Izquierda Pant."
      @ 21,23 SAY "Fin      Col.Derecha Pan."
      @ 22,23 SAY "Ctrl-Ini Primera Columna"
      @ 23,23 SAY "Ctrl-Fin Ultima Columna "
      @ 20,53 SAY "Pag Arr      Pant.Arriba"
      @ 21,53 SAY "Pag Abj      Pant.Abajo"
      @ 22,53 SAY "Ctrl-Pag Arr Primer Linea"
      @ 23,53 SAY "Ctrl-Pag Abj Ultima Linea"
      @ 24,23 SAY "Espacio Imprimir     Esc Finalizar"
      GO TOP
      MYBROWSE ( 1, 0,18,79,2,HE)
   OTHERWISE
      LOOP
   ENDCASE
   COMMIT
   EXIT
ENDDO
# INCLUDE 'REP_MOT.PRG'
# INCLUDE 'REP_TRA.PRG'