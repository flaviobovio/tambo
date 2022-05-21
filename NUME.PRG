FUNCTION NUME(L,R)
PRIVATE WW, F, G, II, TT, JJ, OO, DD, LL
IF L > 0
   IF R <4
      R=4
   ELSEIF R >13
      R=13
   ENDIF
   F=LTRIM(STR(INT(L)))
   G=LEN(F)
   IF G>=4.AND.G<=6
       TT=STUFF(F,4-(6-G),0,'.')
       II=2
   ENDIF
   IF G>=7.AND.G<=9
       JJ=STUFF(F,4-(9-G),0,'.')
       TT=STUFF(JJ,8-(9-G),0,'.')
       II=1
   ENDIF
   IF G<=3
       TT=F
       II=3
   ENDIF
   DD=RIGHT(STR(L-INT(L),5,3),3)
   IF RIGHT(DD,1)='0'
      DD=LEFT(DD,2)
   ENDIF
   OO=LEN(DD)+1
   WW=SPACE(10+II-(G+OO))+TT+','+DD
   LL=LEN( LTRIM(WW) )
*?R
*?"<"
*?LEN( LTRIM(WW) )
*WAIT
   IF R < LL
      WW=LEFT(LTRIM(WW),R)
   ELSE
      WW=RIGHT(WW,R)
   ENDIF

ELSE
   WW=SPACE(R)
ENDIF

RETURN WW