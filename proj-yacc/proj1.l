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
"+"									{ return PLUS; }
"-"									{ return MINUS; }
"*"									{ return MULT; }
"/"									{ return DIV; }
"while"								{ return WHILE; }
"if"								{ return IF; }
"else"								{ return ELSE; }
"int"								{ return INT; }
"float"								{ return FLOAT; }
"<"									{ return LT; }
">"									{ return GT; }
"<="								{ return LE; }
">="								{ return GE; }
"=="								{ return EQ; }
"!="								{ return NE; }
"="									{ return ASSIGN; }
";"									{ return SEMICOLON; }
","									{ return COMMA; }
"&&"								{ return AND; }
"||"								{ return OR; }
"!"									{ return NOT; }
"("									{ return RPAREN; }
")"									{ return LPAREN; }
"{"									{ return RBRACE; }
"}"									{ return LBRACE; }
"["									{ return LBRACKET; }
"]"									{ return RBRACKET; }
[A-Za-z_][A-Za-z_0-9]*	 			{ return ID; }
[ \t\n\r]+  						{}
.        							{ return ERROR; }

