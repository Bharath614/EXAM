%{ int nchar, nword, nline; 
%} 
%% 
\n { nline++; nchar++; } 
[^ \t\n]+ { nword++, nchar += yyleng; } 
. { nchar++; } 
%% 
int yywrap(void) { return 1; 
} 
int main(int argc, char *argv[]) { yyin = fopen(argv[1], "r"); yylex(); 
printf("Number of characters = %d\n", nchar); printf("Number of words = %d\n", nword); printf("Number of lines = %d\n", nline); fclose(yyin); 
} 
