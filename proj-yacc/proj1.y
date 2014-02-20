%token ERROR
%token LT
%token GT
%token LE
%token GE
%token EQ
%token NE
%token AND
%token OR
%token NOT
%token COMMA
%token IF
%token ELSE
%token WHILE
%token SEMICOLON
%token ASSIGN
%token COMMENT
%token ID
%token INT
%token FLOAT
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token LBRACKET
%token RBRACKET
%token ICONST
%token FCONST
%left  PLUS
%left  MINUS
%left  DIV
%left  MULT

%{
 /* put your c declarations here */
#define YYDEBUG 1
%}

%%
input : 	line input 
			| comment input
			| line 
			| comment
			| epsilon

line : 		operator assign multidec semicolon comment

multidec: 	COMMA assign multidec 
			| epsilon

assign: 	ID ASSIGN number
			| ID array

array:		LBRACKET ICONST RBRACKET array 
			| LBRACKET ICONST RBRACKET
			| epsilon

operator: 	INT | FLOAT
number: 	ICONST | FCONST
comment: 	COMMENT | epsilon
semicolon:	SEMICOLON | epsilon
epsilon:
%%
    #include "./lex.yy.c"
