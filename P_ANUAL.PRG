proc p_anual()


sele p_anual
zap
sele produc
set orde to 1
sele tambo
set orde to 3
loca for !empt(fecpar)
do whil !eof()
   sele p_anual
   appe blan
   repl;
   codvac  with tambo->codvac,;
   d_seca  with tambo->antlac,;
   n_parto with tambo->nropar,;
   f_parto with tambo->fecpar,;
   n_servi with tambo->nroser,;
   f_servi with tambo->fecser,;
   re_tact with tambo->result
   mes = mont (f_parto)
   ano = year (f_parto)
   sele produc
   seek tambo->codvac
   co = 46
   j = 1
   do whil codvac = tambo->codvac
      if (year(contro)=ano .and. month(contro)>=mes) .or. year(contro)>ano
         if month (contro) = mes
            sele p_anual
            do case
            case j = 1
               repl p_m1  with produc->total
            case j = 2
               repl p_m2  with produc->total
            case j = 3
               repl p_m3  with produc->total
            case j = 4
               repl p_m4  with produc->total
            case j = 5
               repl p_m5  with produc->total
            case j = 6
               repl p_m6  with produc->total
            case j = 7
               repl p_m7  with produc->total
            case j = 8
               repl p_m8  with produc->total
            case j = 9
               repl p_m9  with produc->total
            case j = 10
               repl p_m10 with produc->total
            case j = 11
               repl p_m11 with produc->total
            case j = 12
               repl p_m12 with produc->total
            case j = 13
               repl p_m13 with produc->total
            case j = 14
               repl p_m14 with produc->total
            case j = 15
               repl p_m15 with produc->total
            endc
            sele produc
            skip
         endi
         j ++
         co = co + 6
         if mes < 12
            mes ++
         else
            mes = 1
         endi
      else
         skip
      endi
   endd
   sele tambo
   skip
endd
sele tambo
set orde to 1
sele p_anual
he = "LISTADO DE PRODUCCION POR FECHA DE PARTO"
ver_lis(he)
