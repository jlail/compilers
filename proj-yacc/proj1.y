%token ERROR AND OR NOT
%token SEMICOLON LPAREN RPAREN COMMA LBRACE RBRACE LBRACKET RBRACKET
%token ASSIGN LT GT LE GE EQ NE
%token INT FLOAT IF ELSE WHILE
%token ID ICONST FCONST
%left  PLUS
%left  MINUS
%left  DIV
%left  MULT
%token COMMENT

%{
 /* put youir c declarations here */
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#define YYDEBUG 1
%}

%%
program : line program | line
line : expr SEMICOLON
expr : expr PLUS expr | ID ASSIGN expr | ICONST
%%
    #include "./lex.yy.c"

