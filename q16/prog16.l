%{
int word_count = 0;
int char_count = 0;
int line_count = 0;
int buf = 0;

%}




%%

[\n] { line_count++; }

. {
	if (yytext[0]==' '){
		if (buf == 1){
			word_count++;
			buf = 0;
		}
		 
	} else {
		buf = 1;
		char_count++;
	}
}
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
	printf("%d words \n%d characters \n%d lines",word_count,char_count,line_count+1);
	return 0;
}