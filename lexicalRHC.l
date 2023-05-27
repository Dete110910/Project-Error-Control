%{
#include "sintacticRHC.tab.h"
extern char* yytext;
extern FILE *yyin;

static int next_colum = 1;
int colum = 1;

#define HANDLE_COLUM colum = next_colum; next_colum += strlen(yytext)


char *lineptr = NULL;
size_t n = 0;
size_t consumed = 0;
size_t available = 0;

size_t min(size_t a, size_t b);
    #define YY_INPUT(buf,result,max_size) {\
        if(available <= 0) {\
            consumed = 0;\
            available = getline(&lineptr, &n, yyin);\
            if (available < 0) {\
                if (ferror(yyin)) { perror("read error:"); }\
                    available = 0;\
                }\
        }\
        result = min(available, max_size);\
        strncpy(buf, lineptr + consumed, result);\
        consumed += result;\
        available -= result;\
    }

%}

%option noyywrap noinput nounput yylineno


int		-?[0-9]+
decimal		-?[0-9](\.[0-9])+
char		\'[^(\n|\')]{1}\'
string		\"[^(\n|\")]*\"
identifier 	[a-zA-Z0-9]+
libToImport	\<([a-zA-Z0-9_-]+\.h)\>
comment		\/\*[^(\n)]*\*\/


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
=		{HANDLE_COLUM; return ASS;}
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
";"		{HANDLE_COLUM; return SMC;}
{comment}	{return CMM;}
{identifier}	{HANDLE_COLUM; return IDE;}
[ \t]+		{HANDLE_COLUM;}	
[\n]		{HANDLE_COLUM; next_colum=1; return '\n';}
.		{printf("lexical error\n");}

%% 

//int yywrap(){return 1;}

size_t min(size_t a, size_t b) {
    return b < a ? b : a;
}

