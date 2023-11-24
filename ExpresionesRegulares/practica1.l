#Trabajo 1.

%{
#include <stdio.h>
%}

%%
^xx[a]*bb { printf("Cadena valida: %s\n", yytext); }
.        { printf("Cadena invalida: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}