%pointer

%option noyywrap
%option yylineno

%{
  /* put C declarations here */

%}

%%

"int"					{return INT;}
[A-Za-z_][A-Za-z0-9_]*	{return ID;}
[0-9]+					{return ICONST;}
;						{return SEMICOLON;}
=						{return ASSIGN;}
[ \t\n\r]+  			{/*eat whitespace*/}
.        				{return ERROR;}

