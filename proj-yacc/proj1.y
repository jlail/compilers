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
input :			statement input
				| statement

statement :		declaration
				| assign
				| iteration			
				| conditional
				| LBRACE statement RBRACE

declaration :	type id multidec SEMICOLON

assign :		id ASSIGN number SEMICOLON
				| id ASSIGN number math SEMICOLON
				| id ASSIGN id SEMICOLON
				| id ASSIGN id math SEMICOLON

iteration :		while statement

conditional :	if statement ELSE statement
				| if statement

if :			IF eqparens

while :			WHILE eqparens

eqparens :		LPAREN equality RPAREN
				| LPAREN NOT eqparens RPAREN
				| LPAREN eqparens RPAREN
				| LPAREN NOT equality RPAREN
				| LPAREN and RPAREN
				| LPAREN or RPAREN

and :			equality AND equality
				| equality AND and
				| equality AND or

or :			equality OR equality
				| equality OR or
				| equality OR and				

equality :		id EQ id 
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
				| NOT id 
				| NOT number
				| id
				| number
				
id :			ID arraydec
				| ID

type :			INT
				| FLOAT

multidec :		COMMA id multidec
				| epsilon

number :		ICONST
				| FCONST

math :			PLUS number
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

arraydec :		LBRACKET ICONST RBRACKET
				| LBRACKET ICONST RBRACKET arraydec	
epsilon :
%%
    #include "./lex.yy.c"
