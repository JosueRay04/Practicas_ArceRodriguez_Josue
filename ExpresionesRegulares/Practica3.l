%{
#include <stdio.h>
%}

%%

[A-Za-z0-9._-]+@(?:uas\.edu\.mx|hotmail\.com|gmail\.com|xyz\.[A-Za-z0-9._-]+\.mx)     { printf("Cadena valida"); }
\n     { /* Opcional: Para manejar saltos de l  nea */ }
. {printf("Cadena invalida");}

%%

int main() {
    yylex();
    return 0;
}