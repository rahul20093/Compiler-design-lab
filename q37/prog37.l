%{ 
int counter = 0; 
%} 

%%
[a-zA-Z]+ { 
	if (yyleng>counter){ 
		counter=yyleng; 
} 
}

%% 
int yywrap(){
	return 1;
}

int main() {
	FILE *fp;
	char filename[50];
	printf("Enter filename : \n");
	scanf("%s",filename);
	fp=fopen(filename,"r");
	yyin=fp;
	yylex(); 
	printf("largest: %d", counter); 
	printf("\n"); 

	return 0;
} 
