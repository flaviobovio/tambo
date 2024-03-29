/***
* set.ch
* Clipper SET() definitions
* Copyright (c) 1990 Nantucket Corp.  All Rights Reserved.
*
* xOldSetting := Set( nSpecifier [, xNewSetting] )
*/

#ifndef _SET_DEFINED

#define _SET_EXACT   1
#define _SET_FIXED   2
#define _SET_DECIMALS  3
#define _SET_DATEFORMAT  4
#define _SET_EPOCH   5
#define _SET_PATH   6
#define _SET_DEFAULT  7

#define _SET_EXCLUSIVE  8
#define _SET_SOFTSEEK  9
#define _SET_UNIQUE   10
#define _SET_DELETED  11

#define _SET_CANCEL   12
#define _SET_DEBUG   13
#define _SET_TYPEAHEAD  14

#define _SET_COLOR   15
#define _SET_CURSOR   16
#define _SET_CONSOLE  17
#define _SET_ALTERNATE  18
#define _SET_ALTFILE  19
#define _SET_DEVICE   20
#define _SET_EXTRA   21
#define _SET_EXTRAFILE  22
#define _SET_PRINTER  23
#define _SET_PRINTFILE  24
#define _SET_MARGIN   25

#define _SET_BELL   26
#define _SET_CONFIRM  27
#define _SET_ESCAPE   28
#define _SET_INSERT   29
#define _SET_EXIT   30
#define _SET_INTENSITY  31
#define _SET_SCOREBOARD  32
#define _SET_DELIMITERS  33
#define _SET_DELIMCHARS  34

#define _SET_WRAP   35
#define _SET_MESSAGE  36
#define _SET_MCENTER  37

#define _SET_COUNT   37

#define _SET_DEFINED
#endif