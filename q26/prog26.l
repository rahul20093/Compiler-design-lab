%{
%}

%%

("+"[0-9]{1,3})?(0?)([0-9]{10}) { 
	printf("Found Phone number: %s\n",yytext);
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
