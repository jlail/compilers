/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ERROR = 258,
     SEMICOLON = 259,
     LPAREN = 260,
     RPAREN = 261,
     COMMA = 262,
     LBRACE = 263,
     RBRACE = 264,
     LBRACKET = 265,
     RBRACKET = 266,
     ASSIGN = 267,
     LT = 268,
     GT = 269,
     LE = 270,
     GE = 271,
     EQ = 272,
     NE = 273,
     INT = 274,
     FLOAT = 275,
     IF = 276,
     ELSE = 277,
     WHILE = 278,
     ID = 279,
     ICONST = 280,
     FCONST = 281,
     PLUS = 282,
     MINUS = 283,
     DIV = 284,
     MULT = 285,
     COMMENT = 286
   };
#endif
/* Tokens.  */
#define ERROR 258
#define SEMICOLON 259
#define LPAREN 260
#define RPAREN 261
#define COMMA 262
#define LBRACE 263
#define RBRACE 264
#define LBRACKET 265
#define RBRACKET 266
#define ASSIGN 267
#define LT 268
#define GT 269
#define LE 270
#define GE 271
#define EQ 272
#define NE 273
#define INT 274
#define FLOAT 275
#define IF 276
#define ELSE 277
#define WHILE 278
#define ID 279
#define ICONST 280
#define FCONST 281
#define PLUS 282
#define MINUS 283
#define DIV 284
#define MULT 285
#define COMMENT 286




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


