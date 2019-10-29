%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token EOL
%token NUMBER
%token ERR
%token RB
%token LB

%%

calc:
 | calc exp EOL { printf("%d\n", $2);}
 | calc ERR {return 0;}
 ;
 
exp: hp_exp
 | exp ADD hp_exp { $$ = $1 + $3; }
 | exp SUB hp_exp { $$ = $1 + $3; }
 ;

hp_exp : term 
 | hp_exp MUL term { $$ = $1 * $3;}
 | hp_exp DIV term { $$ = $1 / $3;}
 ;
 
term : NUMBER
 | RB exp LB { $$ = $2;}
 ;

%%

int main()
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  printf("%s",s);
}
