%{
int count = 0;

%}

%%

([0-9]+)|([0-9]+"."[0-9]+) { printf("%s constant\n",yytext);count++;}

.|\n { }
%%


int yywrap(){}

int main(){
	FILE *fp;
	char filename[50];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
	yylex();
	printf("\nTotal constants: %d\n",count);
	return 0;
}