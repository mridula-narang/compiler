

%{
#include "assignment1.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%%
void {return KEY1;}
main {return KEY2;}
if {return KEY3;}
for {return KEY4;}
while {return KEY5;}
"printf" {return KEY6;}
"scanf" {return KEY7;}
int|float {return Type;}
"{" {return FOB;}
"}" {return FCB;}
"(" {return OB;}
")" {return CB;}
"," {return COMMA;}
";" {return SC;}
"<"|"<="|">="|">=" {return symbol;}
"++" {return increment;}
"--" {return decrement;}
"=" {return equals;}
"-" {return minus;}
"[" {return OSB;}
"]" {return CSB;}
"/" {return quotes;}
"%d"|"%s" {return specifiers;}
"&" {return ampersand;}
[a-zA-z][a-zA-z0-9]* {yylval.string=yytext; return ID;}
[0-9]+ {yylval.NUMBER = atoi(yytext); return digit;}
[\n] {return NL;}
%%
