%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token EOL

%%

list:
 | EOL list { printf("%d\n", $2);}
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
