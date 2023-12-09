%{
int yylex();
int yy_scan_string();
int yyerror(const char *message){return 0;};
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
%}

%token NUMERO

%%

linea : expresion '=' { printf("%d\n", $1); }

expresion: expresion '+' corrimiento  { $$ = $1 + $3; } /* Suma */
         | expresion '~' corrimiento  { $$ = $1 - $3; } /* Resta con ~ OwOr */
         | corrimiento
         ;

corrimiento: corrimiento '<' '<' termino { $$ = $1 << $4; } /* corrimiento */
         | corrimiento '>' '>' termino { $$ = $1 >> $4; } /* corrimiento */
         | termino
         ;

termino: termino '*' exponente      { $$ = $1 * $3; } /* Multiplicacion */
       | termino '/' exponente      { $$ = $1 / $3; } /* Division */
       | termino '%' exponente      { $$ = $1 % $3; } /* Modulo */
       | exponente
       ;

exponente: exponente '^' factor { $$ = pow($1, $3); } /* potencia */
       | exponente '&' {$$ = sqrt($1); } /* raiz */
       | factor
       ;

factor: NUMERO
       | '-' factor         { $$ = -$2; } /* Numero negativo */
       | '(' expresion ')'       { $$ = $2; } /* Agrupacion */
       | '|' expresion '|'       { $$ = abs($2); } /* Valor absoluto */
       ;
%%

int main(int argc, char* argv[]) {

    FILE* file = fopen(argv[1], "r");

    char line[256];

    while (fgets(line, sizeof(line), file)) {
        yy_scan_string(line);
        yyparse();
    }

    fclose(file);

    return 0;
}