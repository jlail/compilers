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

input : 			iteration input
					| conditional input
					| iteration
					| conditional

iteration :			while block
					| while LBRACE input RBRACE
					| block

conditional :		if block
					| if block else block
					| if LBRACE block RBRACE
					| if LBRACE block RBRACE else LBRACE block RBRACE
					| if block else LBRACE block 
					| if LBRACE block RBRACE else block 

if :				IF eqparens

else :				ELSE

while :				WHILE eqparens

eqparens :			LPAREN equality RPAREN
					| LPAREN eqparens RPAREN
					| LPAREN NOT equality RPAREN
					| LPAREN NOT eqparens RPAREN
					| LPAREN and RPAREN
					| LPAREN or RPAREN

and :				equality AND equality
					| equality AND and
					| equality AND OR

or :				equality OR equality
					| equality OR or
					| equality OR and	

equality :			id EQ id 
					| id EQ number 
					| id NE id 
					| id NE number 	
					| id GE id 
					| id GE number 
					| id LE id 
					| id LE number 		
					| id GT id 
					| id GT number 
					| id LT id 
					| id LT number 
					| id
					| number
	

block :				statement block
					| statement

statement :			declaration 
					| assign 

declaration :		type id SEMICOLON
					| type id multidec SEMICOLON

assign :			id ASSIGN number SEMICOLON
					| id ASSIGN id SEMICOLON
					| id ASSIGN number math SEMICOLON
					| id ASSIGN id math SEMICOLON
					| id ASSIGN PLUS number SEMICOLON
					| id ASSIGN MINUS number SEMICOLON
					
arraydec :			LBRACKET ICONST RBRACKET
					| LBRACKET ICONST RBRACKET arraydec	
					| LBRACKET ID RBRACKET
					| LBRACKET ID RBRACKET arraydec	

multidec :			COMMA id 
					| COMMA id multidec

type :				INT
					| FLOAT

id :				ID
					| ID arraydec

number :			ICONST
					| FCONST

math :				PLUS number
					| MINUS number
					| DIV number
					| MULT number
					| PLUS number math
					| MINUS number math
					| DIV number math
					| MULT number math
					| PLUS id
					| MINUS id
					| DIV id
					| MULT id
					| PLUS id math
					| MINUS id math
					| DIV id math
					| MULT id math


%%

    #include "./lex.yy.c"
