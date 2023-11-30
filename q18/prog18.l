%{
int head_count = 0;
int macro_count = 0;

%}

%%

"#include"(.)* { head_count++;}

"#define"(.)* { macro_count++;}

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
	printf("\nTotal headers: %d\nTotal macros: %d",head_count,macro_count);
	return 0;
}