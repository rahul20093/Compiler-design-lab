%{
#include <stdio.h>
%}

DIGIT [0-9]
DATE (([0-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-([0-9][0-9][0-9][0-9]))

%%
{DATE} {
    printf("Valid Date of Birth: %s\n", yytext);
}
.|\n {
    
}
%%

int yywrap() {
	return 1;
}

int main() {
    printf("Enter date of birth (DD-MM-YYYY format): \n");
    yylex();
	return 0;
}