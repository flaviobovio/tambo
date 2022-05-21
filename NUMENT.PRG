FUNCTION NUMENT (L,R)
F=LTRIM(STR(L))
G=LEN(F)
IF L=0
    WW=SPACE(R)
ELSE
   IF G>=4.AND.G<=6
       TT=STUFF(F,4-(6-G),0,'.')
       II=2
   ENDIF
   IF G>=7.AND.G<=9
       JJ=STUFF(F,4-(9-G),0,'.')
       TT=STUFF(JJ,8-(9-G),0,'.')
       II=1
   ENDIF
   IF G=10
       JJ=STUFF(F,4-(12-G),0,'.')
       KK=STUFF(JJ,8-(12-G),0,'.')
       TT=STUFF(KK,12-(12-G),0,'.')
       II=0
   ENDIF
   IF G<=3
       TT=F
       II=3
   ENDIF
   WW=RIGHT(SPACE(10-G+II)+TT,R)
ENDIF
RETURN WW