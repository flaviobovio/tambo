PROCEDURE REP_PRO(EN)

PRIVATE LI:=12, PA:=1, MA:=SET(_SET_MARGIN)
IMPRI(2)
SET MARGIN TO 1
GO TOP
DO WHILE !EOF() .AND. LASTKEY()#27
   INKEY()
   IF LI=12
      @  0, 0 SAY 'P�gina '+ALLTRIM(STR(PA))
      @  1, 0 SAY DIA
      @  2, 0 say 'Tambo: '+ DIR
      @  7, 0 SAY PADC(EN,80)
      @  9, 0 SAY "����������������������������������������������������������������������������Ŀ"
      @ 10, 0 SAY "�CODIGO  �1�Toma�2�Toma�3�Toma�TOTAL�D.Lact.�N�Partos� Tacto �Score Corporal �"
      @ 11, 0 SAY "����������������������������������������������������������������������������Ĵ"
   ENDIF
   @ LI, 0 SAY "�"
   @ LI, 1 SAY Codvac
   @ LI, 9 SAY "�"
   @ LI,11 SAY Toma1 PICTURE "@z 99.9"
   @ LI,16 SAY "�"
   @ LI,18 SAY Toma2 PICTURE "@z 99.9"
   @ LI,23 SAY "�"
   @ LI,25 SAY Toma3 PICTURE "@z 99.9"
   @ LI,30 SAY "�"
   @ LI,32 SAY Total PICTURE "@z 99.9"
   @ LI,36 SAY "�"
   @ LI,39 SAY tambo->dialac PICTURE "@z 999"
   @ LI,44 SAY "�"
   @ LI,48 SAY tambo->nropar PICTURE "@z 99"
   @ LI,53 SAY "�"
   @ LI,57 SAY tambo->result PICTURE "9"
   @ LI,61 SAY "�"
   @ LI,67 SAY tambo->scorec PICTURE "@z 9.9"
   @ LI,77 SAY "�"

   SKIP
   LI++
   IF LI > 60 .AND. !EOF()
      @ LI, 0 SAY "������������������������������������������������������������������������������"
      EJECT
      PA=PA+1
      LI=12
   ENDIF

ENDDO

@ LI, 0 SAY "������������������������������������������������������������������������������"
EJECT
SET(_SET_MARGIN,MA)
IMPRI(0)



