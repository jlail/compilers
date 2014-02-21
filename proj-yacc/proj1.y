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
					| LBRACE input RBRACE
					| LBRACE input RBRACE input

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

equality :			math EQ math 
					| math NE math 
					| math GE math 
					| math LE math 
					| math GT math 
					| math LT math 
					| math



block :				statement block
					| statement

statement :			declaration 
					| assign 

declaration :		type id SEMICOLON
					| type id multidec SEMICOLON

assign :			id ASSIGN math SEMICOLON

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

math :				variable operator math
					| PLUS math
					| MINUS math					
					| LPAREN variable operator math RPAREN 
					| LPAREN PLUS math RPAREN
					| LPAREN MINUS math	RPAREN
					| LPAREN variable operator math RPAREN operator math 
					| LPAREN PLUS math RPAREN math 
					| LPAREN MINUS math	RPAREN math
					| variable

operator :			PLUS
					| MINUS
					| DIV
					| MULT

variable :        	id
					| number

%%

    #include "./lex.yy.c"
