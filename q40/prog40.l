%{
#include <stdio.h>
#include <string.h>
%}

%%
[a-zA-Z]+("=="|"!="|"<"|">"|"<="|">=") {
    printf("Word: %s, Relational Operator: %s\n", yytext, yytext + strlen(yytext) - 2);
}
.|\n { }
%%

int yywrap(){
	return 1;
}

int main() {
    printf("Enter a word followed by a relational operator: \n");
    yylex();
    return 0;
}
