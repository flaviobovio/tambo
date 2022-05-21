CLS
RUN ("CD ESTRUC")
public tambos:=di_tamb()
AADD( TAMBOS, 'ESTRUC' )

RUN ("CD..")

C_DIR = 0
AEVAL (TAMBOS, {|A| C_DIR++, QOUT(A) } )
?
?ALLTRIM( STR( C_DIR ) ) +" TAMBO/S"
?


FOR I = 1 TO C_DIR

   RUN ("COPY A:\OTROS\. "+TAMBOS[I])

NEXT




# INCLUDE 'di_tamb.PRG'