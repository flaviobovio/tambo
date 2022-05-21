run cd estruc
tam=di_tamb()
lar = 0
aeval(tam, {|a| lar++})

for i = 1 to lar
   cls
   @12, 0 say padc( "Modificando archivos del tambo: "+;
              upper(tam[i])+". Espere un momento." ,80)
   run ("cd ..\"+tam[i])
   copy file ("..\estruc\celula.dbf") to ("celula.dbf")
   copy file ("..\estruc\celula.ntx") to ("celula.ntx")
   mo_estr("tambo")
   mo_estr("bacenf")
   mo_estr("bacser")
   mo_estr("enferm")
   mo_estr("enfgua")
   mo_estr("guache")
   mo_estr("produc")
   mo_estr("servic")
   mo_estr("tambo")
   mo_estr("tempo")
   optimi()
next
run cd..
cls


*
proc mo_estr( arc )

use (arc)
copy to ffffff
use
copy file ("..\estruc\"+arc+".dbf") to (arc+".dbf")
use (arc)
appe from ffffff



proc optimi ()

eras ffffff.dbf
USE CONFIG.CFG                  NEW
USE TAMBO  INDEX TAMBO , PRODUC NEW
USE ENFERM INDEX ENFERM         NEW
USE BACENF INDEX BACENF         NEW
USE SERVIC INDEX SERVIC         NEW
USE BACSER INDEX BACSER         NEW
USE TEMPO  INDEX TEMPO          NEW
USE PRODUC INDEX PROCOD, PROLIT NEW
USE GUACHE INDEX GUACHE         NEW
USE ENFGUA INDEX ENFGUA         NEW
USE CELULA  INDE CELULA         NEW
USE MOTIVO                      NEW
USE TRATAM                      NEW
USE TOROS                       NEW
USE INSEMI                      NEW
USE TIPOS                       NEW
USE VACTOT                      NEW
USE RODEOS                      NEW
USE AYUDA.HLP                   NEW
USE IMPRES.IMP                  NEW
***********************************
SELECT TAMBO
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODVAC  TO TAMBO
INDEX ON -ULTPRO TO PRODUC
SET INDEX TO TAMBO , PRODUC
SELECT ENFERM
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODVAC+DTOS(FECHA) TO ENFERM
SELECT BACENF
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODVAC+DTOS(FECHA) TO BACENF
SELECT SERVIC
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODVAC+DTOS(FECSER) TO SERVIC

SELE CELULA
CLOS INDE
PACK
COMM
INDE ON MES TO CELULA

SELECT BACSER
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODVAC+DTOS(FECSER) TO BACSER

SELECT GUACHE
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODIGO TO GUACHE
SELECT ENFGUA
CLOSE INDEXES
PACK
COMMIT
INDEX ON CODIGO+DTOS(FECHA) TO ENFGUA

SELECT PRODUC
CLOSE INDEX
PACK
COMMIT
INDEX ON CODVAC TO PROCOD
INDEX ON -TOTAL TO PROLIT

SELECT MOTIVO
PACK
SELECT TRATAM
PACK
SELECT TOROS
PACK
SELECT INSEMI
PACK
SELECT TIPOS
PACK
clos databases




# include "di_tamb.prg"