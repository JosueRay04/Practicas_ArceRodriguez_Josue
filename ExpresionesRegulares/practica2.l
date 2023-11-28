%{
#include <stdio.h>
%}

%%
[0-9]{3}-[0-9]{3}-[0-9]{4} { printf("Cadena válida: %s\n", yytext); }
. { printf("Cadena inválida: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}