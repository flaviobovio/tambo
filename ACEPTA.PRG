FUNCTION ACEPTA ( CO )
PRIVATE R:=.T. , X:=0, COL:=SETCOLOR(), CUR:=SETCURSOR()
SET CURSOR OFF
CO=IF(CO=NIL, "< Enter > ACEPTA     < Esc > CANCELA", CO)
MENSAJE( CO )
DO WHILE X # 13 .AND. X # 27
   X = INKEY()
ENDDO
IF X = 27
   R=.F.
ENDIF
SETCOLOR(COMUN)
@24, 0 CLEAR
SETCOLOR(COL)
SETCURSOR(CUR)
RETURN R