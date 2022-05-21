*************************************
*    MES ( expD )   -->   expC      *
*************************************
FUNCTION MES(M)
IF VALTYPE( M) = 'D'
   M=MONTH(M)
ENDIF
do case
  case m=1
     d='Enero'
  case m=2
     d='Febrero'
  case m=3
     d='Marzo'
  case m=4
     d='Abril'
  case m=5
     d='Mayo'
  case m=6
     d='Junio'
  case m=7
     d='Julio'
  case m=8
     d='Agosto'
  case m=9
     d='Setiembre'
  case m=10
     d='Octubre'
  case m=11
     d='Noviembre'
  case m=12
     d='Diciembre'
endcase
return d