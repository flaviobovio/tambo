procedure rep_pan(en)
sele produc
set inde to procod
sele tambo
set inde to tampar
loca for !empt(fecpar)
li = 10
impri(3)
priv promed:= array (16,2)
for i = 1 to 16
   promed [i, 1] = 0
   promed [i, 2] = 0
next
pa = 1
sele p_anual
do whil !eof() .and. lastkey () # 27
   inke()
   if li = 10
      @ 0, 0 SAY 'P gina '+ALLTRIM(STR(PA))
      @ 1, 0 SAY DIA
      @ 4, 0 SAY PADC(en ,138)
      @ 6, 0 say repl("=",137)
      @ 7, 0 say "Vaca     D.Sec Parici¢n    Servicio    Tacto     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15"
      @ 8, 0 say "         Ant.  Nø Fecha    Nø Fecha"
      @ 9, 0 say repl("-",137)
   endi
                                                                                                                                                                *
   @ li, 0 say codvac
   @ li,11 say d_seca  pict "@Z 999"
   @ li,15 say n_parto pict "99"
   @ li,18 say f_parto
   @ li,27 say n_servi pict "@Z 99"
   @ li,30 say f_servi
   @ li,41 say re_tact
   if !empt (d_seca)
      promed [16,1] = promed [16,1] + d_seca
      promed [16,2] = promed [16,2] + 1
   endi

   mes = mont (f_parto)
   ano = year (f_parto)
   co = 46
   for j = 1 to 15
      do case
      case j = 1
         lit = p_m1
      case j = 2
         lit = p_m2
      case j = 3
         lit = p_m3
      case j = 4
         lit = p_m4
      case j = 5
         lit = p_m5
      case j = 6
         lit = p_m6
      case j = 7
         lit = p_m7
      case j = 8
         lit = p_m8
      case j = 9
         lit = p_m9
      case j = 10
         lit = p_m10
      case j = 11
         lit = p_m11
      case j = 12
         lit = p_m12
      case j = 13
         lit = p_m13
      case j = 14
         lit = p_m14
      case j = 15
         lit = p_m15
      endc
      @ li,co say lit pict '@Z 99.9'
      if !empt (lit)
         promed [j,1] = promed [j,1] + lit
         promed [j,2] = promed [j,2] + 1
      endi
      co = co + 6
   next
   if li = 59
      li = 10
   else
      li ++
   endi
   skip

endd

@li  , 0 say repl("=",137)
@li+1,11 say roun (promed [16,1] / promed [16,2], 0) pict "@Z 999"
co = 46
for i = 1 to 15
    @li+1,co say roun (promed [i,1] / promed [i,2], 1) pict "99.9"
    co = co + 6
next
@li+2, 0 say repl("=",137)
ejec
impri(0)