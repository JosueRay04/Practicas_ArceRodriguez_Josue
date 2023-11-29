%{
#include <stdio.h>
%}

%option noyywrap

%%

"#"([^\\\n]|\\.)*\n  { /* Ignorar comentarios con # */ }

.|\n { printf("%s", yytext);}

%%

int main(int argc, char* argv[]) {

    FILE* file = fopen(argv[1], "r");

    yyin = file;

    yylex();

    fclose(file);

    return 0;
}
