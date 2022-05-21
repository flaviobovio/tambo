SET MESSAGE TO 24 CENTER
SET CURSOR OFF
SET TALK OFF
SET SCOREBOARD OFF
SET STATUS OFF
SET DATE FRENCH
SET CONFIRM ON
SET ESCAPE OFF
SET WRAP ON
SET DELETE ON
SET DECIMALS TO 0
SET EPOCH TO 1975
SETCANCEL(.F.)
READEXIT(.F.)
*



RUN ("CD ESTRUC")
RUN ("COPY A:TAMBO.*")
CLS
public tambos:=di_tamb()
can_tambos = 0
AEVAL( tambos, { || can_tambos++ } )
FOR i = 1 TO can_tambos
   ? tambos [i]
   RUN ("CD..")
   RUN ("CD "+tambos[i])

   * TAMBO
   USE TAMBO.DBF
   COPY TO destin.dbf
   USE
   ERASE TAMBO.dbf
   RUN ("COPY ..\ESTRUC\TAMBO.DBF")
   COMMIT
   USE TAMBO.dbf
   APPEND FROM destin.dbf 
   ERASE destin.dbf

   *
   ? tambos[i] + " -> Actualizaci¢n OK"

NEXT


RUN ("CD..")




# INCLUDE 'ACEPTA.PRG'
# INCLUDE 'MENSAJE.PRG'
# INCLUDE 'MARCO.PRG'
# include 'di_tamb.prg'
