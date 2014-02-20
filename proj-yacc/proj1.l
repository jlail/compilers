%pointer

%option noyywrap
%option yylineno

%{
  /* put C declarations here*/
%}

%%
[0-9]+ 								{ return ICONST; }
[0-9]+"."[0-9]+						{ return FCONST; }
\/\*([^*]|\*[^/])*\*+\/|\/\/.*		{ return COMMENT; }
"+"  								{ return PLUS; }
"int"								{ return INT; }
"float"								{ return FLOAT; }
"="									{ return ASSIGN; }
";"									{ return SEMICOLON; }
","									{ return COMMA; }
"("									{ return RPAREN; }
")"									{ return LPAREN; }
"{"									{ return RBRACE; }
"}"									{ return LBRACE; }
"["									{ return LBRACKET; }
"]"									{ return RBRACKET; }
[A-Za-z_][A-Za-z_0-9]*	 			{ return ID; }
[ \t\n\r]+  						{}
.        							{ return ERROR; }

