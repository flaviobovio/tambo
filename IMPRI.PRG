***   IMPRI (expN,[expL])  -->  Modifica impresora   ***
*                                                      *
*   0  =  Apagar                                       *
*   1  =  Elite                                        *
*   2  =  Pica                                         *
*   3  =  Condensed                                    *
*   4  =  Emphased                                     *
*   5  =  Double Wide                                  *
* & 6  =  Double Strike                                *
*   7  =  Subscript                                    *
* & 8  =  Italic                                       *
*   9  =  Underline                                    *

*                                                      *
*     & = MODO EPSON SOLAMENTE                         *
********************************************************
FUNCTION IMPRI(X,L)
IF L=NIL
   L=.T.
ENDIF
BAS:=SELECT()
SELECT CONFIG
IM:=IMPRES
SELECT IMPRES
LOCATE FOR IMPRES = IM
PRIVATE I1:=ELITE , I2:=PICA  , I3:=CONDEN, C3:=CANCON, I4:=EMPHAS, C4:=CANEMP
PRIVATE I5:=DOWIDE, C5:=CANDWI, I6:=DSTRIK, C6:=CANDST, I7:=SUBSCR, C7:=CANSUB
PRIVATE I8:=ITALIC, C8:=CANITA, I9:=UNDERL, C9:=CANUND
IF X = 0
   IF IM # "WINDOWS"     
           ??&C3.
           ??&C4.
           ??&C5.
           ??&C7.
           ??&C9.
           IF IM='EPSON'
                ??&C6.
                ??&C8.
           ENDIF
   ENDIF
   set print off
   set device to screen
   set console on
ELSE
   IF ! SET(_SET_PRINTER)
      set console off
      set print on
      set device to print
      IF IM # "WINDOWS"     
         ??&C3.
         ??&C4.
         ??&C5.
         ??&C7.
         ??&C9.
         IF IM='EPSON'
              ??&C6.
              ??&C8.
         ENDIF
      ENDIF
   ENDIF
   do case
     CASE IM = "WINDOWS"
        **  NADA
     case x = 1
        IF L
           ??&I1.
        ELSE
           ??&I2.
        ENDIF
     case x = 2
        ??&I2.
     case x = 3
        IF L
           ??&I3.
        ELSE
           ??&C3.
        ENDIF
     case x = 4
        IF L
           ??&I4.
        ELSE
           ??&C4.
        ENDIF
     case x = 5
        IF L
           ??&I5.
        ELSE
           ??&C5.
        ENDIF
     case x = 6 .AND. IM#'IBM'
        IF L
           ??&I6.
        ELSE
           ??&C6.
        ENDIF
     case x = 7
        IF L
           ??&I7.
        ELSE
           ??&C7.
        ENDIF
     case x = 8 .AND. IM#'IBM'
        IF L
           ??&I8.
        ELSE
           ??&C8.
        ENDIF
     case x = 9
        IF L
           ??&I9.
        ELSE
           ??&C9.
        ENDIF
   endcase
ENDIF
SELECT(BAS)
