%{
int a = 0;
int b = 0;
%}

num (-?)[0-9]+
add {num}"+"{num}
sub {num}"-"{num}
mul {num}"*"{num}
div {num}"/"{num} 

%%

{add} {
	sscanf(yytext,"%d+%d",&a,&b);
	printf("%d + %d = %d\n",a,b,a+b);
}

{sub} {
	sscanf(yytext,"%d-%d",&a,&b);
	printf("%d - %d = %d\n",a,b,a-b);
}

{mul} {
	sscanf(yytext,"%d*%d",&a,&b);
	printf("%d * %d = %d\n",a,b,a*b);
}

{div} {
	sscanf(yytext,"%d/%d",&a,&b);
	printf("%d / %d = %d\n",a,b,a/b);
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