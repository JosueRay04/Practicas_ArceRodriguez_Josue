%{
#include "y.tab.h"
%}

%option noyywrap

%%

[-]?[0-9]+(\.[0-9]+)?                  { printf("%s", yytext);  yylval = atof(yytext); return NUMERO; }
[~+*/\^\|\&\<\>{2}\(\)\%\n]      { printf("%s", yytext);  return *yytext; }
[ \t]                   ;  // Ignorar espacios en blanco //
=                           { printf("%s", yytext);  return '='; }
.                        ;