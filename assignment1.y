
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%union
{
	int NUMBER;
	char *string;
}

%start S1
%token KEY1 KEY2 KEY3 KEY4 KEY5 KEY6 KEY7 Type FOB FCB OB CB COMMA SC symbol increment decrement equals minus OSB CSB quotes specifiers ampersand NL
%token <string> ID
%token <NUMBER> digit
%token <NUMBER> x
%type <NUMBER> t

%%

S1: KEY1 KEY2 OB CB NL FOB statement FCB {printf("Valid syntax \n");exit(0);}
statement: if_stmt statement
|forloop statement
|whileloop statement
|arithmetic_evaluation statement
|array statement
|print_stmt statement
|scan_stmt statement
|declaring_var statement
|

if_stmt: KEY3 OB ID CB NL FOB NL declaring_var FCB NL {printf("valid syntax for if statement;\n");}  /*syntax for the control staement if*/

declaring_var: Type L SC NL {printf("valid declaration \n");}  /*syntax to declare a variable*/

L: ID COMMA L		{printf("valid declaration1 \n");}       
|ID			{printf("valid declaration2 \n");}

forloop: KEY4 OB Type ID equals digit SC ID symbol ID SC ID operation CB NL FOB NL declaring_var FCB NL  {printf("valid for loop syntax;\n");} /*syntax for the for loop*/

/*20ETCS002080*/

operation: increment  /*increment or decrement operation*/
|decrement

whileloop: KEY5 OB ID symbol ID CB NL FOB NL statement FCB NL {printf("valid syntax for while loop;\n");}    /*syntax for the while loop*/

arithmetic_evaluation : ID equals t SC NL  {printf("Printing %s %d\n", $1, $3);} 

t: digit minus digit {$$ = $1-$3;}  /*syntax for subtraction*/

array: Type ID OB size CB SC NL	{printf("valid syntax for array statement;\n");}	 /*syntax for array declaration*/

size: digit                       
| 

print_stmt: KEY6 OB quotes ID quotes CB SC NL {printf("valid syntax for print statement;\n");}  /*syntax for printf i.e, output statement*/

scan_stmt: KEY7 OB quotes specifiers quotes COMMA ampersand ID CB SC NL {printf("valid syntax for scan statement;\n");}   /*syntax for scanf i.e, input statement*/
;

%%

int yywrap()
{
	return 1;
}

int yyerror(char *msg)
{
	printf("Invalid syntax");
}

int main(int argc, char*argv[])
{
	if(argc!=2)
	{		
		printf("Use: a.exe input.txt \n");
		exit(0);
	}
	yyin=fopen(argv[1],"r");
	yyparse();
}

