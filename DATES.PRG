***************************************************************
*                         DATES(1)                            *
*                                                             *
*  DATES ( ExpD , ExpN )  -->  ExpC ( fecha en mmm,dd,aaaa )  *
*                                                             *
***************************************************************
*                         DATES(2)                            *
*                                                             *
*  DATES ( ExpD , ExpN )  -->  ExpC ( fecha en mmm,aaaa )     *
*                                                             *
***************************************************************
*                         DATES(3)                            *
*                                                             *
*  DATES ( ExpD , ExpN )  -->  ExpC ( fecha en dd Mmm )       *
*                                                             *
***************************************************************
*                         DATES(4)                            *
*                                                             *
*  DATES ( ExpD , ExpN )  -->  ExpC ( fecha en Mes dd,aaaa )  *
*                                                             *
***************************************************************
FUNCTION DATES (cl_date,F)
DO CASE
   CASE F<1 .OR. F>4
      ?'PARAMETROS NO VALIDOS'
      RETURN
   CASE F=1
      RETURN SUBSTR(MES(cl_date),1,3)+" "+LTRIM(STR(DAY(cl_date)))+", "+LTRIM(STR(YEAR(cl_date)))
   CASE F=2
      RETURN SUBSTR(MES(cl_date),1,3)+" "+LTRIM(STR(YEAR(cl_date)))
   CASE F=3
      RETURN STR(DAY(cl_date), 2)+" "+SUBSTR(MES(cl_date),1,3)
   CASE F=4
      RETURN LTRIM(STR(DAY(cl_date)))+" de "+MES(cl_date)+" de "+LTRIM(STR(YEAR(cl_date)))
ENDCASE