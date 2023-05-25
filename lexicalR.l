%{
#include "sintactic.tab.h"
extern char* yytext;
extern FILE *yyin;
%}

int		-?[0-9]+
decimal		-?[0-9](\.[0-9])+
char		\'[^(\n|\')]{1}\'
string		\"[^(\n|\")]*\"
identifier 	[a-zA-Z0-9]+
libToImport	\<([a-zA-Z0-9_-]+\.h)\>
comment		\/\*[^(\n)]*\*\/

%option yylineno

%%

{int}           {return VINT;}
{decimal}       {return DEC;}
{char}          {return VCHA;}
{string}        {return STR;}
{libToImport}   {return LTI;}
"char*"		{return CHARAT;}
"void"          {return VOI;}
"if"            {return IFF;}
"else"          {return ELS;}
"long"          {return LON;}
"switch"        {return SWI;}
"break"         {return BRE;}
"case"          {return CAS;}
"return"        {return RET;}
"short"        	{return SHO;}
"const"         {return CON;}
"for"           {return FOR;}
"sizeof"        {return SIZ;}
"default"       {return DEF;}
"static"        {return STA;}
"while"		{return WHI;}
"do"            {return DOO;}
"double"        {return DOU;}
"int"           {return INT;}
"char"          {return CHA;}
"#include"      {return INC;}
"scanf" 	{return SCA;}
"printf" 	{return PRI;}
"cout" 		{return COU;}
"cin" 		{return CIN;}
","		{return COM;}
=		{return ASS;}
\+		{return PLS;}
\*		{return AST;}
\-		{return MIN;}
\/		{return SLS;}
"<"             {return MTQ;}
"<="            {return MET;}
">"             {return GTQ;}
">="            {return GEQ;}
"=="            {return EQL;}
"!="            {return NQL;}
"("             {return OPP;}
")"		{return CPP;}
"{" 		{return OCB;}
"}" 		{return CCB;}
"[" 		{return OBK;}
"]" 		{return CBK;}
";"		{return SMC;}
{comment}	{return CMM;}
{identifier}	{return IDE;}
[ \t]		{}	
[\n]		{yyset_lineno(yylineno + 1);}
.		{printf("lexical error\n");}

%% 

int yywrap(){return 1;}

