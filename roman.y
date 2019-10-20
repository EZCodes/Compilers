%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token EOL
%token NUMBER
%token ERR

%%

list:
 | list NUMBER { printf("%d\n", $2);}
 | list ERR {return 0;}
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
