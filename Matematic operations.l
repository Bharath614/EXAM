%{ 
#undef yywrap #define yywrap() 1  int f1=0,f2=0; char oper; float op1=0,op2=0,ans=0; void eval(); 
%} 
 
DIGIT [0-9] 
NUM {DIGIT}+(\.{DIGIT}+)? 
OP [*/+-] 
 
%% 
 
{NUM} { 
 	if(f1==0) 
 	{ 
 	 	op1=atof(yytext); 
 	 	f1=1; 
 	} 
 
 	else if(f2==-1) 
 	{ 
 	 	op2=atof(yytext); 
 	 	f2=1; 
 	} 
 
 	if((f1==1) && (f2==1)) 
 	{ 
 	 	eval();  	 	f1=0;  	 	f2=0; 
 
