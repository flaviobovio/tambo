


@  0,31 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
@  1,31 SAY "³ TERN.:"
@  1,40 SAY TRIM(A->Codigo)
@  1,46 SAY "³"
@  2, 1 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
@  3, 1 SAY "³IDENTIFICACION ³ ENTRADA  PADRE MADRE SALIDA   DIAS    Lts.LECHE Kgs.BALANC. ³"
@  4, 1 SAY "³               ³"
@  4,19 SAY A->Fecent
@  4,28 SAY TRIM(A->Padre)
@  4,34 SAY TRIM(A->Madre)
@  4,40 SAY A->Fecsal
@  4,49 SAY A->Candia PICTURE "999"
@  4,59 SAY A->L_leche PICTURE "9999"
@  4,70 SAY A->K_balan PICTURE "9999"
@  4,79 SAY "³"
@  5, 1 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
@ 22, 0 SAY "Codigo"
@ 22,10 SAY TRIM(B->Codigo)
@ 23, 0 SAY "Fecha"
@ 23,10 SAY B->Fecha
@ 24, 0 SAY "Diapar"
@ 24,10 SAY B->Diapar PICTURE "999"
@ 25, 0 SAY "Diaacu"
@ 25,10 SAY B->Diaacu PICTURE "999"
@ 26, 0 SAY "Motiv1"
@ 26,10 SAY TRIM(B->Motiv1)
@ 27, 0 SAY "Motiv2"
@ 27,10 SAY TRIM(B->Motiv2)
@ 28, 0 SAY "Trata1"
@ 28,10 SAY TRIM(B->Trata1)
@ 29, 0 SAY "Trata2"
@ 29,10 SAY TRIM(B->Trata2)
@ 30, 0 SAY "Trata3"
@ 30,10 SAY TRIM(B->Trata3)
@ 31, 0 SAY "Trata4"
@ 31,10 SAY TRIM(B->Trata4)
@ 32, 0 SAY "Destin"
@ 32,10 SAY TRIM(B->Destin)
@ 33, 0 SAY "Marca"
@ 33,10 SAY B->Marca
 