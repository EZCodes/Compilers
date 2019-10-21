%{
#include "roman.tab.h"
void yyerror(char *s);
int accumulator = 0;
%}

%%
"CM".+ {yyerror("syntax error\n"); return ERR;}
"CD".+ {yyerror("syntax error\n"); return ERR;}
"XC".+ {yyerror("syntax error\n"); return ERR;}
"XL".+ {yyerror("syntax error\n"); return ERR;}
"IX".+ {yyerror("syntax error\n"); return ERR;}
"IV".+ {yyerror("syntax error\n"); return ERR;}
"CM" {accumulator= accumulator+900;}
"CD" {accumulator= accumulator+400;}
"XC" {accumulator= accumulator+90;}
"XL" {accumulator= accumulator+40;}
"IX" {accumulator= accumulator+9;}
"IV" {accumulator= accumulator+4;}
"M" {accumulator= accumulator+1000;}
"D" {accumulator= accumulator+500;}
"C" {accumulator= accumulator+100;}
"L" {accumulator= accumulator+50;}
"X" {accumulator= accumulator+10;}
"V" {accumulator= accumulator+5;}
"I" {accumulator= accumulator+1;}
\n {yylval = accumulator; accumulator = 0 ;return NUMBER;}
\t|" " {} // whitespace
. {yyerror("syntax error\n"); return ERR;}
%%
