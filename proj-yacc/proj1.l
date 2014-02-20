comment \/\*([^*]|\*[^/])*\*+\/
and "&&"
or "||"
not "!"

%pointer

%option noyywrap
%option yylineno

%{
  /* put C declarations here */
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <ctype.h>
%}

%%
{comment} {yylval=*yytext;
		return COMMENT;}
if				{return IF;}
else				{return ELSE;}
while				{return WHILE;}
int				{return INT;}
float				{return FLOAT;}
[A-Za-z_][A-Za-z0-9_]*		{return ID;}
[0-9]+	 			{return ICONST;}
[0-9]*\.[0-9]+			{return FCONST;}
"!="				{return NE;}
"+"  				{return PLUS;}
"-"				{return MINUS;}
"*"				{return MULT;}
"/"				{return DIV;}
"="				{return ASSIGN;}
"<"				{return LT;}
">"				{return GT;}
"<="				{return LE;}
">="				{return GE;}
"=="				{return EQ;}
";"				{return SEMICOLON;}
"("				{return LPAREN;}	
")"				{return RPAREN;}
","				{return COMMA;}
"{"				{return LBRACE;}
"}"				{return RBRACE;}
"["				{return LBRACKET;}
"]"				{return RBRACKET;}
[ \t\n\r]+   			{}
.        			{ return ERROR; }

