/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    LOWER_THAN_ELSE = 258,
    ELSE = 259,
    IDENTIFIER = 260,
    I_CONSTANT = 261,
    F_CONSTANT = 262,
    STRING_LITERAL = 263,
    FUNC_NAME = 264,
    SIZEOF = 265,
    PTR_OP = 266,
    INC_OP = 267,
    DEC_OP = 268,
    LEFT_OP = 269,
    RIGHT_OP = 270,
    LE_OP = 271,
    GE_OP = 272,
    EQ_OP = 273,
    NE_OP = 274,
    AND_OP = 275,
    OR_OP = 276,
    MUL_ASSIGN = 277,
    DIV_ASSIGN = 278,
    MOD_ASSIGN = 279,
    ADD_ASSIGN = 280,
    SUB_ASSIGN = 281,
    LEFT_ASSIGN = 282,
    RIGHT_ASSIGN = 283,
    AND_ASSIGN = 284,
    XOR_ASSIGN = 285,
    OR_ASSIGN = 286,
    TYPEDEF_NAME = 287,
    ENUMERATION_CONSTANT = 288,
    TYPEDEF = 289,
    EXTERN = 290,
    STATIC = 291,
    AUTO = 292,
    REGISTER = 293,
    INLINE = 294,
    CONST = 295,
    RESTRICT = 296,
    VOLATILE = 297,
    BOOL = 298,
    CHAR = 299,
    SHORT = 300,
    INT = 301,
    LONG = 302,
    SIGNED = 303,
    UNSIGNED = 304,
    FLOAT = 305,
    DOUBLE = 306,
    VOID = 307,
    COMPLEX = 308,
    IMAGINARY = 309,
    STRUCT = 310,
    UNION = 311,
    ENUM = 312,
    ELLIPSIS = 313,
    CASE = 314,
    DEFAULT = 315,
    IF = 316,
    SWITCH = 317,
    WHILE = 318,
    DO = 319,
    FOR = 320,
    GOTO = 321,
    CONTINUE = 322,
    BREAK = 323,
    RETURN = 324,
    ALIGNAS = 325,
    ALIGNOF = 326,
    ATOMIC = 327,
    GENERIC = 328,
    NORETURN = 329,
    STATIC_ASSERT = 330,
    THREAD_LOCAL = 331
  };
#endif
/* Tokens.  */
#define LOWER_THAN_ELSE 258
#define ELSE 259
#define IDENTIFIER 260
#define I_CONSTANT 261
#define F_CONSTANT 262
#define STRING_LITERAL 263
#define FUNC_NAME 264
#define SIZEOF 265
#define PTR_OP 266
#define INC_OP 267
#define DEC_OP 268
#define LEFT_OP 269
#define RIGHT_OP 270
#define LE_OP 271
#define GE_OP 272
#define EQ_OP 273
#define NE_OP 274
#define AND_OP 275
#define OR_OP 276
#define MUL_ASSIGN 277
#define DIV_ASSIGN 278
#define MOD_ASSIGN 279
#define ADD_ASSIGN 280
#define SUB_ASSIGN 281
#define LEFT_ASSIGN 282
#define RIGHT_ASSIGN 283
#define AND_ASSIGN 284
#define XOR_ASSIGN 285
#define OR_ASSIGN 286
#define TYPEDEF_NAME 287
#define ENUMERATION_CONSTANT 288
#define TYPEDEF 289
#define EXTERN 290
#define STATIC 291
#define AUTO 292
#define REGISTER 293
#define INLINE 294
#define CONST 295
#define RESTRICT 296
#define VOLATILE 297
#define BOOL 298
#define CHAR 299
#define SHORT 300
#define INT 301
#define LONG 302
#define SIGNED 303
#define UNSIGNED 304
#define FLOAT 305
#define DOUBLE 306
#define VOID 307
#define COMPLEX 308
#define IMAGINARY 309
#define STRUCT 310
#define UNION 311
#define ENUM 312
#define ELLIPSIS 313
#define CASE 314
#define DEFAULT 315
#define IF 316
#define SWITCH 317
#define WHILE 318
#define DO 319
#define FOR 320
#define GOTO 321
#define CONTINUE 322
#define BREAK 323
#define RETURN 324
#define ALIGNAS 325
#define ALIGNOF 326
#define ATOMIC 327
#define GENERIC 328
#define NORETURN 329
#define STATIC_ASSERT 330
#define THREAD_LOCAL 331

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
