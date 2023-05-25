%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void);
extern FILE *yyin;
extern int yylineno;
void yyerror(char *s);
//extern YYSTYPE yylval
%}

%union {
 char *idval;
}

%token VINT DEC VCHA STR LTI VOI IFF ELS LON SWI BRE CAS RET SHO CON FOR SIZ DEF STA SHI DOO DOU INT CHA INC SCA PRI COU CIN  ASS PLS AST MIN SLS MTQ MET GTQ GEQ EQL NQL OPP CPP OCB CCB OBK CBK SMC COM IDE WHI CMM CHARAT

%token <idval> STR_TOKEN

%define parse.error verbose

%%

sentencias 	:
	    	| sentencia {printf("Sentencia\n");}
		| sentencias sentencia {printf("Sentencia con sentencias\n");}

sentencia 	: ifsim {printf("sentencia if\n");}
	   	| cond {printf("cond sentencia\n");}
		| decvar {printf("decvar sentencia\n");}
		| initvar {printf("initvar sentencia\n");}
		| asigvar {printf("asigvar sentencia\n");}

ifsim 		: IFF OPP cond CPP OCB sentencias CCB {printf("ifsim\n");}
		//| error {printf("Hubo un error %d\n", yylineno); return 0;}

cond 		: IDE ASS IDE {printf("asig");}
       		| IDE MTQ IDE {printf("mayor");}
       		| IDE MET IDE {printf("mayor o igual");}
       		| IDE GTQ IDE {printf("menor");}
       		| IDE GEQ IDE {printf("menor o igual");}
       		| IDE EQL IDE {printf("igual");}
       		| IDE NQL IDE {printf("diferente");}
		| error {printf("Hubo un error en la condición del if\n"); return 0;}

decvar 		: INT IDE SMC
	 	| CHA IDE SMC
	 	| DOU IDE SMC
	 	| LON IDE SMC
		| SHO IDE SMC
	 	| CHA IDE OBK CBK SMC
	 	| CHA IDE OBK VINT CBK SMC
		| error {printf("Hubo un error en la declaración de la variable\n"); return 0;}

initvar		: INT IDE ASS VINT SMC
	 	| CHA IDE ASS VCHA SMC
		| DOU IDE ASS DEC SMC 
		| CHA IDE OBK CBK ASS STR SMC
		| CHA IDE OBK VINT CBK ASS STR SMC
		| LON IDE ASS VINT SMC
		| SHO IDE ASS DEC SMC
		| CON INT IDE ASS VINT SMC
		| CON CHA IDE ASS VCHA SMC
		| CON DOU IDE ASS DEC  SMC
		| CON CHA IDE OBK CBK ASS STR SMC
		| CON CHA IDE OBK VINT CBK  ASS STR SMC
		| CON LON IDE ASS VINT SMC
		| CON SHO IDE ASS DEC SMC
		| INT IDE ASS IDE SMC
		| CHA IDE ASS IDE SMC
		| DOU IDE ASS IDE SMC
		| CHA IDE OBK CBK ASS IDE SMC
		| CHA IDE OBK VINT CBK IDE SMC		
		| LON IDE ASS IDE SMC
		| SHO IDE ASS IDE SMC
		| CON INT IDE ASS IDE SMC
		| CON CHA IDE ASS IDE SMC
		| CON DOU IDE ASS IDE SMC
		| CON CHA IDE OBK CBK ASS IDE SMC
		| CON CHA IDE OBK VINT CBK IDE SMC
		| CON LON IDE ASS IDE SMC
		| CON SHO IDE ASS IDE SMC	
		;

asigvar 	: IDE ASS VINT SMC
	 	| IDE ASS VCHA SMC
		| IDE ASS DEC SMC
		| IDE ASS STR SMC
		;

%%

void yyerror(char *s) {
    printf("Error sintáctico en la línea %d: %s\n", yylineno, s);
}

int main(int argc, char **argv){
        if(argc > 1)
                yyin=fopen(argv[1], "rt");
        else
                yyin=stdin;
        yyparse();
        return 0;
}

