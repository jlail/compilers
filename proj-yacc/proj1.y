%token ERROR
%token COMMA
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

%{
 /* put your c declarations here */
#define YYDEBUG 1
%}

%%
input : 	line input 
			| comment input
			| line 
			| comment
line : 		operator assign multidec semicolon comment
			| epsilon
multidec: 	comma assign multidec 
			| epsilon
assign: 	ID ASSIGN number 
			| ID
			| ID array
comma:		COMMA
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

