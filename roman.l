%{
#include "defs.tab.h"
void yyerror(char *s);
%}

%%
"MC" {return 900;}
"CD" {return 400;}
"XC" {return 90;}
"XL" {return 40;}
"IX" {return 9;}
"IV" {return 4;}
"M" {return 1000;}
"D" {return 500;}
"C" {return 100;}
"L" {return 50;}
"X" {return 10;}
"V" {return 5;}
"I" {return 1;}
\n {return EOL;}
\t|" " {} // whitespace
. {yyerror("Unknown Character\n");}
%%
