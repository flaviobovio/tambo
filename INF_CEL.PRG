proc inf_cel()

priv wano:=year(date()), anio, cuadro [ 12, 4 ], lin, ;
     wmes:=mont(date()), wqui:=iif(day(date())>14,2,1), can

sele celula
lin = ll_arra ()
mostrar ( lin )
anio = wano
@ 2, 54 get anio pict "9999"
set curs on
read
set curs off
if wano # anio
   wano = anio
   lin = ll_arra ()
   mostrar ( lin )
endi


mensaje("<I> INGRESAR DATOS    <Enter> CONTINUAR")
x=0
do whil x#13 .and. upper( chr(x))#"I"
   x = inke(0)
endd

if x = 13
   impres( lin )
else
   *@ 20,27 TO 22,51
   @ 21,29 SAY "Quincena:"
   @ 21,43 SAY "Mes:"
   @ 21,39 get wqui pict "9"  rang 1, 2
   @ 21,48 get wmes pict "99" rang 1,12
   set curs on
   read
   l = 5 + wmes
   c = iif( wqui=1, 27, 44)
   can = val ( cuadro [wmes, wqui+1] )
   @ l, c get can pict "99999999"
   read
   set curs off
   if acepta()
     seek wmes
     if !foun()
        appe blan
        repl ano with wano, mes with wmes
     endi
     if wqui = 1
        repl quinc_1 with can
     else
        repl quinc_2 with can
     endi
   endi
endi





func ll_arra

priv lin := {}, m, sobre:=0, promed:=0
set filt to ano =  wano
for m = 1 to 12
   cuadro [m, 1] =  padl ( mes ( m ), 9)
   seek m
   if foun()
      cuadro [m, 2] = iif (quinc_1>0, str (quinc_1, 8), spac(8) )
      cuadro [m, 3] = iif (quinc_2>0, str (quinc_2, 8), spac(8) )
      ca_quin       = iif (empt(quinc_1), 0, 1) + iif (empt(quinc_2), 0, 1)
      cuadro [m, 4] = roun ( (quinc_1 + quinc_2) / ca_quin , 0 )
      if ca_quin > 0
         promed = promed + cuadro [m, 4]
         sobre  = sobre + 1
      endi
      cuadro [m, 4] = str( cuadro [m, 4], 8)
   else
      cuadro [m, 2] = spac(8)
      cuadro [m, 3] = spac(8)
      cuadro [m, 4] = spac(8)
   endi
next
promed = iif( sobre>0, str( promed / sobre, 8 ), spac(8) )

aadd( lin, "   浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融   " )
aadd( lin, "   �                  CONTEO DE CELULAS SOMATICAS A�O "+str(wano,4)+spac(18)+"�   ")
aadd( lin, "   把陳陳陳陳陳陳陳陳賃陳陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳陳陳超   " )
aadd( lin, "   �       MES        �  1� QUINCENA   �  2� QUINCENA  �  PROMEDIO MENSUAL  �   " )
aadd( lin, "   把陳陳陳陳陳陳陳陳津陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超   " )
for m = 1 to 12
   aadd( lin, "   �  "+cuadro[m,1]+"       �    "+cuadro[m,2]+;
              "    �    "+cuadro[m,3]+"   �      "+cuadro[m,4]+"      �   " )
next
aadd( lin, "   把陳陳陳陳陳陳陳陳珍陳陳陳陳陳陳陳陳祖陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳超   " )
aadd( lin, "   �  PROMEDIO ANUAL                                   �      "+promed+"      �   " )
aadd( lin, "   藩様様様様様様様様様様様様様様様様様様様様様様様様様詫様様様様様様様様様夕   " )
retu lin
