%{
int count = 0;
%}

%%

[A-Z] { 
	printf("Capital Letter: %s\n",yytext);
	count++;
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
	printf("\ncount = %d",count);
	return 0;
}
