PROCEDURE TAM_BOR()

CLS
private c_tam:=0
aeval( tambos, { || c_tam++} )

@ 0,0 TO 23,79 DOUBLE
@  0, 2 SAY " BORRAR UN TAMBO "

UL=IF(C_tam>11,18,C_tam+7)

@  4,30 SAY "SELECCIONE UN TAMBO"
@  6,31 TO UL+2,46 DOUBLE

PRIVATE TSE:= ACHOICE( 8,34,UL,43, tambos)
IF c_tam > 0 .AND. TSE > 0
   @  4,30 CLEAR TO UL+2,48
   @ 10,33,14,46 BOX "Û"
   @ 12,35 SAY tambos[tse]
   if acepta("<Enter> BORRAR ESTE TAMBO     <Esc> CANCELAR",.T.) .AND.;
      acepta('<Enter> CONFIRMAR BORRADO     <Esc> CANCELAR',.t.)

      ***   BORRA ARCHIVOS Y DIRECCTORIOS   ***
      CLOSE ALL
      RUN ("CD..")
      RUN ("CD "+tambos[tse])
      AEVAL( DIRECTORY( "*.*"),{ |A| FERASE( A[1] ) } )
      RUN ("CD..")
      RUN ("RD "+tambos[tse])

      ***   BORRA EL TAMBO DEL ARRAY(TAMBOS) DE SELECCION   ***
      ADEL ( tambos, ASCAN( tambos, tambos[tse] ) )

      ***   SELECCIONA EL TAMBO NINGUNO   ***
      RUN ("CD ESTRUC")
      USE CONFIG.CFG                  NEW
      DOSRIGID=RIGIDO
      DOSDRIVE=FLEXIBLE
      DOSPATH =PATHDOS
      USE TAMBO  INDEX TAMBO , PRODUC NEW
      USE PARTOS INDEX PARTOS         NEW
      USE ENFERM INDEX ENFERM         NEW
      USE BACENF INDEX BACENF         NEW
      USE SERVIC INDEX SERVIC         NEW
      USE BACSER INDEX BACSER         NEW
      USE TEMPO  INDEX TEMPO          NEW
      USE PRODUC INDEX PROCOD, PROLIT NEW
      D_GUA = (ALLTRIM(CONFIG->GUACHE))
      USE (D_GUA+"GUACHE") INDEX (D_GUA+"GUACHE") NEW
      USE (D_GUA+"ENFGUA") INDEX (D_GUA+"ENFGUA") NEW
      use p_anual                     new
      USE CELULA INDE CELULA          NEW
      USE MOTIVO                      NEW
      USE TRATAM                      NEW
      USE TOROS                       NEW
      USE INSEMI                      NEW
      USE TIPOS                       NEW
      USE VACTOT                      NEW
      USE RODEOS                      NEW
      USE AYUDA.HLP                   NEW
      USE IMPRES.IMP                  NEW

   ENDIF
ENDIF
