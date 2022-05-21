****************************************************************************
*                                                                          *
* FUNCION MYBROWSE (nTop, nLeft, nBottom, nRight,nCampos,Encab,ColCongela) *
*                                                                          *
****************************************************************************
# INCLUDE 'INKEY.CH'

FUNCTION MyBrowse (nTop, nLeft, nBottom, nRight,nCampos,Encab,ColCongela)
local b, column, n
local lMore, nKey, nCursSave
***   Dibuja el Recuadro y Crea el objeto del Browse   ***
@nTop, nLeft to nBottom, nRight
@nTop+2,nLeft  SAY'Ã'
@nTop+2,nRight SAY'´'
b := TBrowseDB(nTop+1, nLeft+1, nBottom, nRight-1)

***   Separadores de Columna y Encabezamiento   ***
b:headSep := "ÄÂÄ"
b:colSep  := " ³ "
b:footSep := "ÄÁÄ"
***   Agrega una Columna para cada Campo   ***
for n = 1 to nCampos

   ***   Crea La nueva Columna   ***
   column := TBColumnNew(  Encab[n], ;
          FieldWBlock(FieldName(n), Select()) )

   b:addColumn(column)
next

***   Congela ColCongela columna/s a la izquierda   ***
if colCongela # NIL
   b:freeze := ColCongela
endif

***   Salva estado del Cursor   ***
nCursSave := SetCursor(0)

lMore := .t.
while (lMore)
    set typeahead to 16
    ***   Estabilize El display   ***
    while ( !b:stabilize() )
       nKey := InKey()
       if ( nKey != 0 )
          exit
       endif
    enddo
    set typeahead to 0
    if ( b:hitTop .or. b:hitBottom )
     Tone(125, 0)
    end

    ***   Espera una Tecla  ***
    nKey := InKey(0)

    ***   Procesa La Tecla   ***
    do case
    case ( nKey == K_DOWN )
       b:down()
    case ( nKey == K_UP )
       b:up()
    case ( nKey == K_PGDN )
       b:pageDown()
    case ( nKey == K_PGUP )
       b:pageUp()
    case ( nKey == K_CTRL_PGUP )
       b:goTop()
    case ( nKey == K_CTRL_PGDN )
       b:goBottom()
    case ( nKey == K_RIGHT )
       b:right()
    case ( nKey == K_LEFT )
       b:left()
    case ( nKey == K_HOME )
       b:home()
    case ( nKey == K_END )
       b:end()
    case ( nKey == K_CTRL_LEFT )
       b:panLeft()
    case ( nKey == K_CTRL_RIGHT )
       b:panRight()
    case ( nKey == K_CTRL_HOME )
       b:panHome()
    case ( nKey == K_CTRL_END )
       b:panEnd()
    case ( nKey == K_ESC )
       set typeahead to 16
       set relation to
       lMore := .f.
    case ( nKey == 32 )
       if printok()
          cls
          MARCO( 9,13,15,64)
          @12,17 SAY'IMPRIMIENDO...   <Esc> INTERRUMPIR IMPRESION'
          base =  alias(select())
          Do Case
             Case base = 'TAMBO' .and. li # 18
                REP_GEN(ENC)
             Case base = 'ENFERM'
                REP_ENF(ENC)
             Case base = 'SERVIC'
                REP_SER(ENC)
             Case base = 'PRODUC'
                REP_PRO(ENC)
             Case base = 'MOTIVO'
                REP_MOT(ENC)
             Case base = 'TRATAM'
                REP_TRA(ENC)
             Case base = 'GUACHE'
                REP_GUA(ENC)
             Case base = 'ENFGUA'
                REP_ENG(ENC)
             Case alias(select()) = 'P_ANUAL'
                REP_PAN(ENC)
          EndCase
          return
       endif
    case ( nKey>47 .and. nKey<58 ) .or. ( nKey>64 .and. nKey<123 )
       r=recno()
       seek upper(chr(nkey))
       if found()
          b:SkipBlock := {|x| Skipper(x)}
          b:RefreshAll()
       else
          go r
       endif
    endcase
enddo
SetCursor(nCursSave)
return (.t.)

****
* Skipper()
*
func Skipper(n)
local i
i := 0
if ( LastRec() != 0 )
   if ( n == 0 )
      SKIP 0
   elseif ( n > 0 .and. Recno() != LastRec() + 1 )
      while ( i < n )
         SKIP 1
         if ( Eof() )
            SKIP -1
            exit
         endif
         i++
      enddo
   elseif ( n < 0 )
      while ( i > n )
         SKIP -1
         if ( Bof() )
            exit
         end
         i--
      end
   end
end
return (i)
