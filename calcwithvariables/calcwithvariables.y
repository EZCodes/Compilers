%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
int * variables;
%}

%token NUMBER
%token ERR
%token EOS ASSIGN 
%token VAR
%token PRINT
%token ADD SUB MUL DIV

%%

calc:
 | calc exp EOS { printf("Done.\n");}
 | calc ERR {return 0;}
 | calc PRINT VAR EOS { printf("%d\n", variables[$3]);} 
 | calc VAR ASSIGN exp EOS { variables[$2] = $4;}
 ;
 
exp: hp_exp
 | exp ADD hp_exp { $$ = $1 + $3;}
 | exp SUB hp_exp { $$ = $1 - $3;}
 ;

hp_exp : term 
 | hp_exp MUL term { $$ = $1 * $3;}
 | hp_exp DIV term { $$ = $1 / $3;}
 ;
 
term : NUMBER
 | SUB NUMBER | SUB VAR{ $$ = 0-variables[$2];}
 | VAR { $$ = variables[$1];}
 ;


%%

int main()
{
  variables = malloc(26);
  yyparse();
  free(variables);
  return 0;
}

void yyerror(char *s)
{
  printf("%s",s);
}
