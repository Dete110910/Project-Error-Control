/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SINTACTICRHC_TAB_H_INCLUDED
# define YY_YY_SINTACTICRHC_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    VINT = 258,                    /* VINT  */
    DEC = 259,                     /* DEC  */
    VCHA = 260,                    /* VCHA  */
    STR = 261,                     /* STR  */
    LTI = 262,                     /* LTI  */
    VOI = 263,                     /* VOI  */
    IFF = 264,                     /* IFF  */
    ELS = 265,                     /* ELS  */
    LON = 266,                     /* LON  */
    RET = 267,                     /* RET  */
    SHO = 268,                     /* SHO  */
    FOR = 269,                     /* FOR  */
    DOU = 270,                     /* DOU  */
    INT = 271,                     /* INT  */
    CHA = 272,                     /* CHA  */
    INC = 273,                     /* INC  */
    SCA = 274,                     /* SCA  */
    COU = 275,                     /* COU  */
    CIN = 276,                     /* CIN  */
    ASS = 277,                     /* ASS  */
    PLS = 278,                     /* PLS  */
    AST = 279,                     /* AST  */
    MIN = 280,                     /* MIN  */
    SLS = 281,                     /* SLS  */
    MTQ = 282,                     /* MTQ  */
    MET = 283,                     /* MET  */
    GTQ = 284,                     /* GTQ  */
    GEQ = 285,                     /* GEQ  */
    EQL = 286,                     /* EQL  */
    NQL = 287,                     /* NQL  */
    OPP = 288,                     /* OPP  */
    CPP = 289,                     /* CPP  */
    OCB = 290,                     /* OCB  */
    CCB = 291,                     /* CCB  */
    OBK = 292,                     /* OBK  */
    CBK = 293,                     /* CBK  */
    SMC = 294,                     /* SMC  */
    COM = 295,                     /* COM  */
    IDE = 296,                     /* IDE  */
    WHI = 297,                     /* WHI  */
    MMN = 298,                     /* MMN  */
    MMQ = 299,                     /* MMQ  */
    PPP = 300,                     /* PPP  */
    MMM = 301                      /* MMM  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 16 "sintacticRHC.y"

 char *idval;

#line 114 "sintacticRHC.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SINTACTICRHC_TAB_H_INCLUDED  */
