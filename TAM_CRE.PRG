PROCEDURE TAM_CRE()

CLS


PRIVATE wTam:=SPACE(8), arch:={}, c_arc:=0
@  0, 0 TO 23,79 DOUBLE
@  0, 2 SAY " CREAR UN TAMBO "
@ 12,23 SAY "INGRESE EL NOMBRE DEL NUEVO TAMBO"
@ 11,22 TO 15,57
@ 13,23 TO 13,56
@ 14,35 GET wTam PICTURE "@!" ;
                 VALID wTam#SPACE(8) .AND.;
                       wTam#'NINGUNO'.and.;
                       ascan( tambos, upper(alltrim(wtam)) ) = 0
SET CURSOR ON
READ
SET CURSOR OFF
wTam=upper(alltrim(wtam))
if acepta('<Enter> CREAR TAMBO     <Esc> CANCELAR')

   ***   CREA EL DIREC. Y COPIA LOS ARCHIVOS   ***
   RUN ("CD..")
   RUN ("MD "+wTam)
   aeval( DIRECTORY("ESTRUC\*.*"), ;
          { |a| aadd(arch, a[1]), c_arc++ } )
   CLOSE ALL
   for i = 1 to c_arc
      copy file ("ESTRUC\"+arch[i]) TO (wTam+"\"+arch[i])
   next
   RUN ("CD "+wTam)

   ***   LO AGREGA AL ARRAY(TAMBOS) DE DIRECTORIOS   ***
   AADD( Tambos, PADR( wTam, 10 ) )

   ***   SELECCIONA EL TAMBO CREADO   ***
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
   USE CELULA INDE CELULA          NEW
   use p_anual                     new
   USE MOTIVO                      NEW
   USE TRATAM                      NEW
   USE TOROS                       NEW
   USE INSEMI                      NEW
   USE TIPOS                       NEW
   USE VACTOT                      NEW
   USE RODEOS                      NEW
   USE AYUDA.HLP                   NEW
   USE IMPRES.IMP                  NEW

endif
