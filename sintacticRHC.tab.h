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
    SWI = 267,                     /* SWI  */
    BRE = 268,                     /* BRE  */
    CAS = 269,                     /* CAS  */
    RET = 270,                     /* RET  */
    SHO = 271,                     /* SHO  */
    CON = 272,                     /* CON  */
    FOR = 273,                     /* FOR  */
    SIZ = 274,                     /* SIZ  */
    DEF = 275,                     /* DEF  */
    STA = 276,                     /* STA  */
    SHI = 277,                     /* SHI  */
    DOO = 278,                     /* DOO  */
    DOU = 279,                     /* DOU  */
    INT = 280,                     /* INT  */
    CHA = 281,                     /* CHA  */
    INC = 282,                     /* INC  */
    SCA = 283,                     /* SCA  */
    PRI = 284,                     /* PRI  */
    COU = 285,                     /* COU  */
    CIN = 286,                     /* CIN  */
    ASS = 287,                     /* ASS  */
    PLS = 288,                     /* PLS  */
    AST = 289,                     /* AST  */
    MIN = 290,                     /* MIN  */
    SLS = 291,                     /* SLS  */
    MTQ = 292,                     /* MTQ  */
    MET = 293,                     /* MET  */
    GTQ = 294,                     /* GTQ  */
    GEQ = 295,                     /* GEQ  */
    EQL = 296,                     /* EQL  */
    NQL = 297,                     /* NQL  */
    OPP = 298,                     /* OPP  */
    CPP = 299,                     /* CPP  */
    OCB = 300,                     /* OCB  */
    CCB = 301,                     /* CCB  */
    OBK = 302,                     /* OBK  */
    CBK = 303,                     /* CBK  */
    SMC = 304,                     /* SMC  */
    COM = 305,                     /* COM  */
    IDE = 306,                     /* IDE  */
    WHI = 307,                     /* WHI  */
    CMM = 308,                     /* CMM  */
    CHARAT = 309,                  /* CHARAT  */
    STR_TOKEN = 310                /* STR_TOKEN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 16 "sintacticRHC.y"

 char *idval;

#line 123 "sintacticRHC.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SINTACTICRHC_TAB_H_INCLUDED  */
