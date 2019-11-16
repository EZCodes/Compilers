%{
#include "calcwithvariables.tab.h"
void yyerror(char *s);
%}

%%
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
"print" {return PRINT;}
[a-z]{1} { yylval = yytext[0]-97; return VAR;}
[a-z]{2,} {yyerror("syntax error"); return ERR;}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
";" {return EOS;}
":=" {return ASSIGN;}
\n {}
\t|" " {} // whitespace
. {yyerror("syntax error"); return ERR;}
%%
