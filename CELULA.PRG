proc celula

priv wano, cuadro [ 12, 4 ], promed:=0, sobre:=0
wano= 1993
afill ( cuadro, 0 )
for m = 1 to 12
   cuadro [m, 1] = mes( m )
next

sele celula
set filt to ano =  wano
go top
do whil !eof()
   cuadro [mes, 2] = quinc_1
   cuadro [mes, 3] = quinc_2
   ca_quin         = iif (empt(quinc_1, 0, 1)) + iif (empt(quinc_2, 0, 1))
   cuadro [mes, 4] = roun ( (quinc_1 + quinc_2) / ca_quin , 0 )
   if ca_quin > 0
      promed = promed + cuadro [mes, 4]
      sobre  = sobre + 1
   endi
   skip
endd
promed = roun ( promed / sobre, 0 )

lin = ll_arra ()

mostrar ( lin )
inkey(0)














proc ll_arra

priv lin := {}, m
aadd( lin, "   浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融    "
aadd( lin, "   �                  CONTEO DE CELULAS SOMATICAS A�O "+str(wano,4)+spac(18)+"�    "
aadd( lin, "   把陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳陳陳超    "
aadd( lin, "   �       MES        �  1� QUINCENA   �  2� QUINCENA  �  PROMEDIO MENSUAL  �    "
aadd( lin, "   把陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超    "
for m = 1 to 12
   aadd( lin, "   �  "+cuadro[m,1]+"       �    "+cuadro[m,2]+;
              "    �    "+cuadro[m,3]+"    �      "+cuadro[m,4]+"      �    "
next
aadd( lin, "   把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超    "
aadd( lin, "   �  PROMEDIO ANUAL                                   �      "+promed+"      �    "
aadd( lin, "   藩様様様様様様様様様様様様様様様様様様様様様様様様様詫様様様様様様様様様夕    "
retu lin



**@  1,54 SAY "1993"
**@  1,22 SAY "CONTEO DE CELULAS SOMATICAS A�O"
**@  2, 4 TO  2,74
@  3,14 SAY "MES"

** 3,25 SAY "1� QUINCENA"
**@  3,41 SAY "2� QUINCENA"
**@  3,57 SAY "PROMEDIO MENSUAL"
**@  3,22 TO 18,22
**@  3,38 TO 16,38
**@  3,54 TO 16,54


@  4, 4 TO  4,74



@  5,11 SAY "mmmmmmmmm"
@  5,26 SAY "9.999.999"
@  5,42 SAY "9.999.999"
@  5,60 SAY "9.999.999"


@ 17,4 TO 17,74



@ 18,6 SAY "PROMEDIO ANUAL"
@ 18,60 SAY "9.999.999"