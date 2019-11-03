%{
#include "romcalc.tab.h"
void yyerror(char *s);
%}

%%
"CM"[CDM]+ {yyerror("syntax error\n"); return ERR;}
"CD"[CMD]+ {yyerror("syntax error\n"); return ERR;}
"XC"[XLCMD]+ {yyerror("syntax error\n"); return ERR;}
"XL"[XLCMD]+ {yyerror("syntax error\n"); return ERR;}
"IX".+ {yyerror("syntax error\n"); return ERR;}
"IV".+ {yyerror("syntax error\n"); return ERR;}
"CM" {yylval=900; return DIGIT;}
"CD" {yylval=400; return DIGIT;}
"XC" {yylval=90; return DIGIT;}
"XL" {yylval=40; return DIGIT;}
"IX" {yylval=9; return DIGIT;}
"IV" {yylval=4; return DIGIT;}
"M" {yylval=1000; return DIGIT;}
"D" {yylval=500; return DIGIT;}
"C" {yylval=100; return DIGIT;}
"L" {yylval=50; return DIGIT;}
"X" {yylval=10; return DIGIT;}
"V" {yylval=5; return DIGIT;}
"I" {yylval=1; return DIGIT;}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"{" {return RB;}
"}" {return LB;}
\n {return EOL;}
\t|" " {} // whitespace
. {yyerror("syntax error\n"); return ERR;}
%%
