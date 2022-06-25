%option noyywrap

%{
  #include <math.h>
  int function = 0;
  float a, b;
  void digit();
%}
  
digits [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
multi "*"
div "/"
power "^"
sine "sin"
cosine "cos"
tangent "tan"
squareRoot "sqrt"
cubicRoot "cbrt"
%%
  
{digits} {digit();} 
{add} {function=1;}
{sub} {function=2;}
{multi} {function=3;}
{div} {function=4;}
{power} {function=5;}
{sine} {function=6;}
{cosine} {function=7;}
{tangent} {function=8;}
{squareRoot} {function=9;}
{cubicRoot} {function=10;}
[\n] {
printf("\n Result is =%f\n\n",a);
}
  
%%

void digit()
{
 if(function==0)
  
 a=atof(yytext); //The function returns the converted floating point number as a double value. If no valid conversion can be performed, the function returns zero (0.0).
  
 else
 {
 b=atof(yytext);
  
 switch(function)
 {
   case 1:
   a=a+b;
   break;
  
   case 2:
   a=a-b;
   break;
   
   case 3:
   a=a*b;
   break;
   
   case 4:
   a=a/b;
   break;
   
   case 5:
   a = pow(a,b);
   break;
   
   case 6:
   b = b * (M_PI / 180.0); // converting degrees to radians

   a=sin(b);
   break;
   
   case 7:
   b = b * (M_PI / 180.0); // converting degrees to radians

   a=cos(b);
   break;
   
   case 8:
   b = b * (M_PI / 180.0);  // converting degrees to radians

   a=tan(b);
   break;
   
   case 9:
   a=sqrt(b);
   break;
   
   case 10:
   a=cbrt(b);
   break;
  }
 function=0;
 }
}
  
int main(void)
{
 yylex();
 return 0;
}
