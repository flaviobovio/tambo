PROCEDURE TOR_INS()
CLS
PRIVATE TI, AB, TOI:=SPACE(4), TF
@  0, 0 TO 23,79 DOUBLE
@  0, 2 SAY " AGREGAR O BORRAR TOROS E INSEMINADORES "
@  4,14 TO 19,64
@  5,17 TO  9,36 DOUBLE
@  6,19 PROMPT "1 - TORO        "
@  8,19 PROMPT "2 - INSEMINADOR "
MENU TO TI
IF TI = 0
   RETURN
ENDIF
@  5,46 TO  9,61 DOUBLE
@  6,48 PROMPT "1 - AGREGAR "
@  8,48 PROMPT "2 - BORRAR  "
MENU TO AB
IF AB = 1
   TF = .F.
ELSEIF AB = 2
   TF = .T.
ELSE
   RETURN
ENDIF
IF TI = 1
   @ 16,22 TO 18,57 DOUBLE
   @ 17,24 SAY "INGRESE EL CODIGO DEL TORO:" GET TOI PICTURE'@! XXXX' VALID EXI_TOR(TOI,TF)
ELSE
   @ 16,18 TO 18,60 DOUBLE
   @ 17,20 SAY "INGRESE EL CODIGO DEL INSEMINADOR:" GET TOI PICTURE'@! XXXX' VALID EXI_INS(TOI,TF)
ENDIF
SET CURSOR ON
READ
SET CURSOR OFF
IF ACEPTA()
   IF TI = 1
      SELECT TOROS
      IF AB = 1
         APPEND BLANK
         REPLACE TORO   WITH TOI
      ELSE
         DELETE
      ENDIF
   ELSE
      SELECT INSEMI
      IF AB = 1
         APPEND BLANK
         REPLACE INSEMI WITH TOI
      ELSE
         DELETE
      ENDIF
   ENDIF
ENDIF
RETURN