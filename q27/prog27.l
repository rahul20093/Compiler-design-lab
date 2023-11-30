%{
%}

header (#(.)*)

keyword int|return|void

identifier [A-Za-z_][A-Za-z0-9_]*

operator [{}()\-+*/=,;]

string \"(.)*\"

constant [0-9]+

%%

{header} {
	printf("%s header\n",yytext);
}

{keyword} {
	printf("%s keyword\n",yytext);
}

{operator} {
	printf("%s operator\n",yytext);
}

{identifier} {
	printf("%s identifier\n", yytext);
}

{string} {
	printf("%s string\n",yytext);
}

{constant} {
	printf("%s constant\n",yytext);
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
