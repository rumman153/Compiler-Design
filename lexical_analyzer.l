%{
    int flag1=0;
    int flag2=0;
    int flag3=0;
%}

digit       [0-9]
letter      [A-Za-z]
space       [" "]

%%


auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while {
	printf("%s : Keyword\n",yytext); //yytext is of type char* and it contains the lexeme currently found
   }
{space}+ {}
;|:|, {

	printf("%s : Punctuation\n",yytext);
   }

"+"|"-"|"*"|"/"|"=" {
	printf("%s : Mathematical Operator\n",yytext);
    }	

>|>=|<|<=|==|!= {
	printf("%s : Logical Operator\n",yytext);
   }  

{digit}+ {
	printf("%s : Integer\n",yytext);
   }

({digit}*\.{digit}+) {
	printf("%s : Float\n",yytext);
  } 
 
"(" {flag1++; 
}
 
")" {flag1++;
  }

"{" {flag2++; 
}
 
"}" {flag2++;
  }

"[" {flag3++; 
}
 
"]" {flag3++;
  }
  
{letter}({letter}|{digit})*    {
	printf("%s : Identifier\n",yytext);
   }

"//"({letter}|{digit}|{space}|;|:|,)* {}

"/*"({letter}|{digit}|{space}|;|:|,)*"*/" {}

[\n] {

 if(flag1 != 0 && flag1%2==0){
   printf("() : Parenthesis\n");
 }
 if(flag2 != 0 && flag2%2==0){
   printf("{} : Parenthesis\n");
 }
 
 if(flag3 != 0 && flag3%2==0){
   printf("[] : Parenthesis\n");
 }
}
%%
int main(void) {
    yylex(); //returns a value indicating the type of token that has been obtained.
    return 0;
}
