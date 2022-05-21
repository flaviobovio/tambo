**************************************************************
*                                                            *
*   IMPRES( <Array> [,<Codigo Impresi¢n>] [,<Ejectar>]       *
*                                                            *
**************************************************************

FUNCTION IMPRES(AR,CIm,EJ)

***   VALIDAR PARAMETROS   ***
CIm = IF( CIm=NIL, 2, CIm )
EJ = IF( EJ=NIL, .T., EJ )
*

PRIVATE T_ECLA:=0, L_ARGO:=0, PANT:=SAVESCREEN( 0, 0,24,79)
CLEAR TYPEAHEAD
AEVAL( AR, {|| L_ARGO++ } )

MENSAJE ('<I> IMPRIMIR      <Enter> CONTINUAR')

DO WHILE T_ECLA#13 .AND. UPPER(CHR(T_ECLA))#'I'
   T_ECLA=INKEY()
ENDDO

IF T_ECLA = 13
   RETURN
ELSE
   IF PRINTOK()
      IF PROW() + L_ARGO > 64 .AND. PROW() # 0
         EJECT
         IF !PRINTOK()
            RETURN
         ENDIF
      ENDIF

      @10,19 CLEAR TO 14,58
      @12, 0 SAY PADC('IMPRIMIENDO...',80)
      MARCO(10,19,14,58)
      IMPRI(CIm)
      l_ant = prow()
      for e = 1 to L_argo
          @e+l_ant, 0 say ar[e]
      next
      IMPRI( 0)
      IF EJ
         EJECT
      ENDIF
   ELSE
      RETURN
   ENDIF
ENDIF

RESTSCREEN ( 0, 0,24,79,PANT )