******************************************************
*                                                    *
*  ULTDIA ( ExpD )  -->  ExpD (Ultimo dia del mes )  *
*                                                    *
******************************************************
FUNCTION ULT_DIA (cl_ult)
DO CASE
CASE MONTH(cl_ult) <= 8
   Ult = CTOD('01/'+"0"+LTRIM(STR(MONTH(cl_ult)+1))+ '/'+LTRIM(STR(YEAR(cl_ult))))-1
CASE MONTH(cl_ult) >= 9 .AND. MONTH(cl_ult) < 12
   Ult = CTOD('01/'+LTRIM(STR(MONTH(cl_ult)+1))+"/"+LTRIM(STR(YEAR(cl_ult))))-1
CASE MONTH(cl_ult) = 12
   Ult = CTOD("01/01/"+LTRIM(STR(YEAR(cl_ult)+1)))-1
ENDCASE
RETURN Ult