%{
%}

vowel [aeiouAEIOU]

%%

{vowel} {
	printf("%s vowel\n",yytext);
}

[a-zA-Z] {
	printf("%s consonant\n",yytext);
}

.|\n { }
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
