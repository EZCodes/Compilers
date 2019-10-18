%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token EOL
