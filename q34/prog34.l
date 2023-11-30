%{
%}

DIGIT [0-9]

%%
{DIGIT} {
    printf("Input is a digit: %s\n", yytext);
}
.|\n {
    printf("Input is not a digit: %s\n", yytext);
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input to check if it's a digit or not: \n");
    yylex();
    return 0;
}
