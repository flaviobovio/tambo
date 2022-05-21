PROCEDURE VER_LIS( EN )
CLS
IF LEN(EN) > 80
   EN = LEFT(EN,80)
ENDIF
@ 0, 0 SAY PADC(EN,80)
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
@ 24,2 SAY "Espacio Imprimir     Esc Finalizar     1..9,A..Z Busca por 1er Caracter Vaca"
PRIVATE BASE:=ALIAS( SELECT() ), CA, HE, CO
DO CASE
CASE BASE = 'TAMBO'
   CA=FCOUNT()-2
   HE={'Vaca','RC','Fecha','Padr','Madr','RFL','C.R.','Parto','Tern','T','Nr',;
       'Servicio', 'Toro','Ins.','Nr','Tacto','R','FPA','Secado','IPP','P/S','P/P',;
       'D.La','L.An','D.Se','S.An','D.Ge','Pro','P.Acu','Score'}
   CO=1
CASE BASE = 'ENFERM'
   CA=FCOUNT()-1
   HE={'Vaca','Fecha','D.Pa','D.Ac','Mo.1','Mo.2','Tr.1','Tr.2','Tr.3';
       ,'Tr.4','De'}
CASE BASE = 'SERVIC'
   CA=FCOUNT()
   HE={'Vaca','N#P','Parto','Serv.Ant', 'Servicio','Toro','Ins.','Nro','Resultado'}
   CO=1
CASE BASE = 'PRODUC'
   CA=FCOUNT() - 1
   HE={'Vaca','1øToma','2øToma','3øToma','Total'}
CASE BASE = 'GUACHE'
   CA=FCOUNT()-1
   HE={'Tern', 'Padre','Madre','F.Entrada', 'F.Salida','D¡as','Lts.Leche','Kgs.Alim.'}
CASE BASE = 'ENFGUA'
   CA=FCOUNT()-1
   HE={'Vaca','Fecha','D.Pa','D.Ac','Mo.1','Mo.2','Tr.1','Tr.2','Tr.3';
       ,'Tr.4','De'}
case base = "P_ANUAL"
   ca = fcount ()
   he = {'Vaca', 'D.Seca','NøPa','F.Parto','NøSe','F.Serv.','Tacto','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'}
   co = 1
ENDCASE
GO TOP
MYBROWSE ( 1, 0,18,79,CA,HE,CO)
# INCLUDE 'MYBROWSE.PRG'
