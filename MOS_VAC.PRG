FUNCTION MOS_VAC(COD,TD)
PRIVATE LI, SE, EN, AC ,SA, AP:=0 , RET
SELECT SERVIC
COUNT TO SE FOR CODVAC = COD .AND. FECPAR = TAMBO->FECPAR
SELECT ENFERM
COUNT TO EN FOR CODVAC = COD .AND. MARCA
SELECT TAMBO
LI = 7 + SE + 8 + EN
IF TD = 3 .OR. TD = 6
   LI = LI+1
ENDIF
PRIVATE LIN [LI]
VAR_MOS(TD)
@ 2, 0 SAY "旼컴컴컴컴컴컴컴컴컴컫컴컴컴컴컨컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴커"
DO CASE
   CASE TD = 1 .OR. TD = 7
      RET = 4
   CASE TD = 2 .OR. TD = 8
      RET = 7
   CASE TD = 3
      RET = 9 + SE + 1
   CASE TD = 4
      RET = 9 + SE + 3
   CASE TD = 5
      RET = 9 + SE + 6
   CASE TD = 6
      RET = 9 + SE + 8 + EN + 1
ENDCASE
IF RET > 20

   AP = LI-19

*   AP = LI-20
   RET = RET - AP
ENDIF
FOR AC = 1 TO 20
   IF AC+AP > LI
      EXIT
   ENDIF
   @ AC+2, 0 SAY LIN[AC+AP]
NEXT
@AC+2, 0 SAY "읕컴컴컴컴컴컴컴컴컴컨컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸"
RETURN RET
# INCLUDE 'VAR_MOS.PRG'
