FUNCTION DI_TAMB ()

# INCLUDE 'DIRECTRY.CH'
private DIR:=SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )
RUN ("CD..")
private TAM:=DIRECTORY("*.*", "DV")
cantid=1
RUN ("CD "+DIR)
AADD(TAM,NIL)

DO WHILE TAM[CANTID] # NIL

  IF TAM[CANTID,F_ATTR]#'D' .OR. TAM[CANTID ,F_NAME]='BACK' .OR.  ;
     TAM[CANTID,F_NAME]='ESTRUC' .OR.  TAM[CANTID,F_NAME]='.' .OR. ;
     TAM[CANTID,F_NAME]='..'

     ADEL(TAM,cantid)

  ELSE
     cantid ++

  ENDIF

ENDDO

cantid --

tambos={}
AEVAL( TAM, {|x| AADD( tambos, PADR(X[F_NAME],10) ) },, Cantid )


RETURN tambos