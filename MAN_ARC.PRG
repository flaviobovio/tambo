PROCEDURE MAN_ARC()
CLS
@ 0, 0 TO 23,79 DOUBLE
@ 0, 2 SAY' MANEJO DE ARCHIVOS '
@  6,25 TO 14,53 DOUBLE
@  8,28 PROMPT "1 - RESPALDAR          " MESSAGE'REPALDAR LOS DATOS EN DISKETTES'
@ 10,28 PROMPT "2 - RESTAURAR          " MESSAGE'RESTAURAR LAS DATOS DE DISKETTES'
@ 12,28 PROMPT "3 - OPTIMIZAR ARCHIVOS " MESSAGE'ELIMINAR FISICAMENTE LOS REGISTROS BORRADOS'
MENU TO RR
DO CASE
   CASE RR=1
      CLOSE databases
      nombretambo = SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )
      RUN ('DEL ' + DOSDRIVE + '\*.ZIP')
      RUN ('..\PKZIP '+DOSDRIVE+nombretambo)
   CASE RR=2
      @  1, 1 CLEAR TO 22,78
      @  5,19 TO 13,58 DOUBLE
      @  7,21 SAY "ATENCION LOS DATOS DE LOS DISKETTES "
      @  9,21 SAY "SERAN RESTAURADOS Y BORRARAN LOS QUE"
      @ 11,21 SAY "SE ENCUENTRE EN EL DISCO ! ! !      "
      IF ACEPTA()
         nombretambo = SUBSTR(CURDIR(), AT( "\",CURDIR() )+1 )
         IF .NOT. file (DOSDRIVE + nombretambo + '.ZIP')
                MENSAJE ("ERROR! DISCO RESPALDO INCORRECTO.", .t.)
                INKEY (0)
                RETURN
         ENDIF
         close databases
         RUN ('..\PKUNZIP -o '+DOSDRIVE+nombretambo)
         USE CONFIG.CFG                  NEW
         USE TAMBO  INDEX TAMBO , PRODUC, tampar NEW
         USE ENFERM INDEX ENFERM         NEW
         USE BACENF INDEX BACENF         NEW
         USE SERVIC INDEX SERVIC         NEW
         USE BACSER INDEX BACSER         NEW
         USE TEMPO  INDEX TEMPO          NEW
         USE PRODUC INDEX PROCOD, PROLIT NEW
         D_GUA = (ALLTRIM(CONFIG->GUACHE))
         USE (D_GUA+"GUACHE") INDEX (D_GUA+"GUACHE") NEW
         USE (D_GUA+"ENFGUA") INDEX (D_GUA+"ENFGUA") NEW
         use partos inde partos          new
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
         ACT_DIA()
      ENDIF

   CASE RR=3
      CLS
      MARCO(7,18,13,60)
      @  9,26 SAY "POR FAVOR ESPERE UN MOMENTO"
      @ 11,21 SAY "LOS ARCHIVOS ESTAN SIENDO OPTIMIZADOS"
      SELECT TAMBO
      CLOSE INDEXES
      PACK
      COMMIT
      INDEX ON CODVAC  TO TAMBO
      INDEX ON -ULTPRO TO PRODUC
      inde  on fecpar  to tampar
      SET INDEX TO TAMBO , PRODUC, tampar
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

      sele partos
      close indexes
      pack
      commit
      inde on codvac+str(nropar) to partos

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

      D_GUA = (ALLTRIM(CONFIG->GUACHE))
      SELECT GUACHE
      CLOSE INDEXES
      PACK
      COMMIT
      INDEX ON CODIGO TO (D_GUA+"GUACHE")
      SELECT ENFGUA
      CLOSE INDEXES
      PACK
      COMMIT
      INDEX ON CODIGO+DTOS(FECHA) TO (D_GUA+"ENFGUA")

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
   OTHERWISE
      RETURN
ENDCASE
