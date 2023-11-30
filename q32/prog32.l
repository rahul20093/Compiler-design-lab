%{
#include <stdio.h>
%}

%%

"https://"|"http://"  { printf("Valid URL: %s\n", yytext); }
www\.[a-zA-Z0-9]+\.[a-zA-Z]+    { printf("Valid URL: %s\n", yytext); }
[a-zA-Z0-9]+\.[a-zA-Z]+          { printf("Valid URL: %s\n", yytext); }

%%

int yywrap (){
	return 0;
}

int main() {
    yylex();
    return 0;
}
