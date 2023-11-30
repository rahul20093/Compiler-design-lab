%{
%}

keyword1 auto|double|int|struct|break|else|long|switch|case|enum|register|typedef

keyword2 char|extern|return|union|continue|for|signed|void|do|if|static|while|default

keyword3 goto|sizeof|volatile|const|float|short|unsigned

%%

{keyword1}|{keyword2}|{keyword3} {
	printf("%s keyword\n",yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
	printf("%s identifier\n",yytext);
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
