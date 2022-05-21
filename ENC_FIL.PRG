FUNCTION ENC_FIL (CO)
PRIVATE AE := SPACE(0)
DO CASE
   ***   PARTO   ***
   CASE CO =  1
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre ' + DTOC(CONDIC->FPART1) + ' y '+DTOC(CONDIC->FPART2)+', '
      AFILL(FIL,"FECPAR>=CONDIC->FPART1.AND.FECPAR<=CONDIC->FPART2", 1,1)
   CASE CO =  2
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Tipo '+CONDIC->TPARTO+', '
      AFILL(FIL,"TIPPAR=CONDIC->TPARTO", 2,1)
   CASE CO =  3
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre '+STR(CONDIC->NPART1,2)+' y '+STR(CONDIC->NPART2,2)+', '
      AFILL(FIL,"NROPAR>=CONDIC->NPART1.AND.NROPAR<=CONDIC->NPART2", 3,1)
   ***   SERVICIO   ***
   CASE CO =  4
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre ' + DTOC(CONDIC->FSERV1) + ' y '+DTOC(CONDIC->FSERV2)+', '
      AFILL(FIL,"FECSER>=CONDIC->FSERV1.AND.FECSER<=CONDIC->FSERV2", 4,1)
   CASE CO =  5
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Toro '+CONDIC->TSERVI+', '
      AFILL(FIL,"TORO=CONDIC->TSERVI", 5,1)
   CASE CO =  6
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Ins '+CONDIC->ISERVI+', '
      AFILL(FIL,"INSEMI=CONDIC->ISERVI",6,1)
   CASE CO =  7
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre '+STR(CONDIC->NSERV1,2)+' y '+STR(CONDIC->NSERV2,2)+', '
      AFILL(FIL,"NROSER >= CONDIC->NSERV1 .AND. NROSER <= CONDIC->NSERV2",7,1)
   ***   TACTO   ***
   CASE CO =  8
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre ' + DTOC(CONDIC->FTACT1) + ' y '+DTOC(CONDIC->FTACT2)+', '
      AFILL(FIL,"FECTAC >= CONDIC->FTACT1 .AND. FECTAC <= CONDIC->FTACT2",8,1)
   CASE CO =  9
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Res '+CONDIC->RTACTO+', '
      AFILL(FIL,"RESULT =CONDIC->RTACTO",9,1)
   ***   IDENTIDAD   ***
   CASE CO = 10
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre ' + DTOC(CONDIC->FIDEN1) + ' y '+DTOC(CONDIC->FIDEN2)+', '
      AFILL(FIL,"FECNAC >= CONDIC->FIDEN1 .AND. FECNAC <= CONDIC->FIDEN2",10,1)
   CASE CO = 11
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Padr '+CONDIC->PIDENT+', '
      AFILL(FIL,"PADRE=CONDIC->PIDENT",11,1)
   CASE CO = 12
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      AE = 'Madr '+CONDIC->MIDENT+', '
      AFILL(FIL,"MADRE=CONDIC->MIDENT",12,1)
   ***   R.F.L.   ***
   CASE CO = 13
      IF LEN(SE[CO]) = 0
         CUU=CUU+1
      ENDIF
      IF CONDIC->MREFIL = 'R'
         AE = 'SI, '
      ELSE
         AE = 'NO, '
      ENDIF
      AFILL(FIL,"REFILA=CONDIC->MREFIL",13,1)
   ***   SECAS   ***
   CASE CO = 14
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre ' + DTOC(CONDIC->FSECA1) + ' y '+DTOC(CONDIC->FSECA2)+', '
      AFILL(FIL,"FINLAC >= CONDIC->FSECA1 .AND. FINLAC <= CONDIC->FSECA2",14,1)
   ***   PRODUCCION   ***
   CASE CO = 15
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre '+STR(CONDIC->LUPRO1,3)+' y '+STR(CONDIC->LUPRO2,3)+', '
      AFILL(FIL,"ULTPRO >= CONDIC-> LUPRO1 .AND. ULTPRO <= CONDIC-> LUPRO2",15,1)
   CASE CO = 16
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Entre '+STR(CONDIC->LAPRO1,5)+' y '+STR(CONDIC->LAPRO2,5)+', '
      AFILL(FIL,"ACUPRO >= CONDIC-> LAPRO1 .AND. ACUPRO <= CONDIC-> LAPRO2",16,1)
   ***   DIAS   ***
   CASE CO = 17
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Lac.Entre '+STR(CONDIC->DLACT1,3)+' y '+STR(CONDIC->DLACT2,3)+', '
      AFILL(FIL,"DIALAC >= CONDIC-> DLACT1 .AND. DIALAC <= CONDIC-> DLACT2",17,1)
   CASE CO = 18
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Sec.Entre '+STR(CONDIC->DSECA1,3)+' y '+STR(CONDIC->DSECA2,3)+', '
      AFILL(FIL,"DIASEC >= CONDIC-> DSECA1 .AND. DIASEC <= CONDIC-> DSECA2",18,1)
   CASE CO = 19
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Ges.Entre '+STR(CONDIC->DGEST1,3)+' y '+STR(CONDIC->DGEST2,3)+', '
      AFILL(FIL,"DIAGES >= CONDIC-> DGEST1 .AND. DIAGES <= CONDIC-> DGEST2",19,1)
   ***   INTERVALOS   ***
   CASE CO = 20
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Par-1Se Entre '+STR(CONDIC->DPA1S1,3)+' y '+STR(CONDIC->DPA1S2,3)+', '
      AFILL(FIL,"PARSER >= CONDIC-> DPA1S1 .AND. PARSER <= CONDIC-> DPA1S2",20,1)
   CASE CO = 21
      IF LEN(SE[CO]) = 0
         CUU=CUU+2
      ENDIF
      AE = 'Par-Pre Entre '+STR(CONDIC->DPAPR1,3)+' y '+STR(CONDIC->DPAPR2,3)+', '
      AFILL(FIL,"PARPRE >= CONDIC-> DPAPR1 .AND. PARPRE <= CONDIC-> DPAPR2",21,1)
ENDCASE
RETURN AE