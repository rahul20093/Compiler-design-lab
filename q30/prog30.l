%{
%}

%%
[A-Za-z]* {
	printf("%s is a word",yytext);
}
[0-9]+ {
	printf("%s is a number",yytext);
}
%%

int yywrap(){
	return 1;
}
int main(){
	FILE *fp;
	char filename[50];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
	yylex();
	return 0;
}