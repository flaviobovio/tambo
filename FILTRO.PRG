FUNCTION FILTRO (A,B)
IF LEN(A) # 0
   A = A +' .AND. '+ B
ELSE
   A = B
ENDIF
RETURN A