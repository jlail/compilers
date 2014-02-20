%token SEMICOLON 
%token INT 
%token ID
%token ASSIGN
%token ICONST

%{
 /* put your c declarations here */

#define YYDEBUG 1
%}

%%
expr : INT ID SEMICOLON
%%
    #include "./lex.yy.c"