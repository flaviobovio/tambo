FUNCTION EVA_CON()
*
PRIVATE In:=AT('?',Val[T])#0)), CCV, C:=SPACE(0)
IF In>0
   FOR A = 1 TO 4
      IF SUBSTR(Val[T],A,1)
      C+=SUBSTR(A,1, )
   NETX
   CCV=&( "{ ||"+FIELD(Cam[T]])+Con[T]+"Val[T]}"  )
ELSE
   CCV=&( "{ ||"+FIELD(Cam[T]])+Con[T]+"Val[T]}"  )
ENDIF
VA=0
DBEVAL({ || FIELD->LISTAR:=EVAL(CCV), VA=IF(FIELD->LISTAR ,VA++,VA)} ;
       ,{!DELETED().AND.LISTAR})