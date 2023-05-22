%{i
extern char *yytext;
extern FILE *yyin;
%}

int		-?[0-9]+
decimal		-?[0-9](\.[0-9])+
char		\'[^(\n|\')]{1}\'
string		\"[^(\n|\")]*\"
identifier 	[a-zA-Z0-9]+
libToImport	\<([a-zA-Z0-9_-]+\.h)\>
comment		\/\*[^(\n)]*\*\/

%%

{int}		{printf("num integer\n");}
{decimal}	{printf("num decimal\n");}
{char}		{printf("char\n");}
{string}	{printf("string\n");}
{libToImport}	{printf("import\n");}
"void" 		{printf("void\n");}
"if" 		{printf("if\n");}
"else" 		{printf("else\n");}
"long" 		{printf("long\n"); }
"switch" 	{printf("switch\n"); }
"break" 	{printf("break\n"); }
"case" 		{printf("case\n"); }
"return" 	{printf("return\n");}
"short" 	{printf("short\n"); }
"const" 	{printf("const\n"); }
"for" 		{printf("for\n"); }
"sizeof" 	{printf("sizeof\n");}
"default" 	{printf("default\n"); }
"static" 	{printf("static\n"); }
"while" 	{printf("while\n"); }
"do" 		{printf("do\n"); }
"double" 	{printf("double\n"); }
"int"	 	{printf("integer\n"); }
"char" 		{printf("char\n"); }
"#include" 	{printf("include\n"); }
"scanf" 	{printf("scanf\n"); }
"printf" 	{printf("printf\n"); }
"cout" 		{printf("cout\n"); }
"cin" 		{printf("cin\n"); }
","		{printf("comma\n");}
=		{printf("asig\n"); }
\+		{printf("plus\n"); }
\*		{printf("asterisc\n"); }
\-		{printf("minus\n"); }
\/		{printf("division\n"); }
"<"             {printf("minor than\n"); }
"<="            {printf("minor equals than\n"); }
">"             {printf("grater than\n"); }
">="            {printf("grater equals than\n"); }
"=="            {printf("equals\n"); }
"!="            {printf("different\n"); }
"("             {printf("open parenthesis\n"); }
")"		{printf("close parenthesis\n"); }
"{" 		{printf("open curlybrackets\n"); }
"}" 		{printf("close curlybrackets\n"); }
"[" 		{printf("open [\n"); }
"]" 		{printf("close ]\n"); }
";"		{printf("semicolon\n"); }
{comment}	{printf("comment\n");}
{identifier} 	{printf("identifier\n"); }
[ \t\n]		{/*Ignore spaces*/}
.		{printf("lexical error\n"); }

%%

int yywrap(){return 1;}

int main(int argc, char **argv){
	printf("Inicio del programa: \n");
	if(argc>1)
		yyin=fopen(argv[1],"rt");
	else
		yyin=stdin;
	yylex();
return 0;
}
