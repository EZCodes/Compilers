%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token EOL
%token DIGIT
%token ERR
%token RB
%token LB
%token ADD SUB MUL DIV

%%

calc:
 | calc exp EOL { 
	if($2 == 0) {
		printf("Z\n");
	}
	else {
		if($2 < 0) {
			printf("-");
			$2 = 0 - $2;
		}
		int digits[13] = {1000,900,500,400,100,90,50,40,10,9,5,4,1};
		int index = 0;
		while(index != 13) {
			if($2 >= digits[index]) {
				$2 = $2 - digits[index];
				switch (digits[index]) 
				{
					case 1000: printf("M");break;
					case 900: printf("CM");break;
					case 500: printf("D");break;
					case 400: printf("CD");break;
					case 100: printf("C");break;
					case 90: printf("XC");break;
					case 50: printf("L");break;
					case 40: printf("XL");break;
					case 10: printf("X");break;
					case 9: printf("IX");break;
					case 5: printf("V");break;
					case 4: printf("IV");break;
					case 1: printf("I");break;	
					default: break;	
				}
			}
			else {
				index++;
			}
		}
		printf("\n");
	}
}
 | calc ERR {return 0;}
 ;
 
exp: hp_exp
 | exp ADD hp_exp { $$ = $1 + $3;}
 | exp SUB hp_exp { $$ = $1 - $3;}
 ;

hp_exp : term 
 | hp_exp MUL term { $$ = $1 * $3;}
 | hp_exp DIV term { $$ = $1 / $3;}
 ;
 
term : number
 | RB exp LB { $$ = $2;}
 ;

number : DIGIT
 | number DIGIT { $$ = $1 + $2;}
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
