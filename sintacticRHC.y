%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
extern int yylex(void);
extern FILE *yyin;
extern int yylineno;
extern char* yytext;
void yyerror(const char *s);
extern int colum;
extern char *lineptr;
//extern YYSTYPE yylval;
//#define YYERROR_VERBOSE 1
%}

%union {
 char *idval;
}

%token<idval> VINT DEC VCHA STR LTI VOI IFF ELS LON SWI BRE CAS RET SHO CON FOR SIZ DEF STA SHI DOO DOU INT CHA INC SCA PRI COU CIN  ASS PLS AST MIN SLS MTQ MET GTQ GEQ EQL NQL OPP CPP OCB CCB OBK CBK SMC COM IDE WHI CMM CHARAT

%token <idval> STR_TOKEN

%define parse.error verbose

%%

sentencias 	:
	        | YYEOF {printf("Fin del archivo\n");}
		| sentencias sentencia {printf("Sentencia con sentencias\n");}


sentencia 	: decvar {printf("sentencia if\n");}
		| cond {printf("decvar sentencia\n");}
		| initvar {printf("initvar sentencia\n");}
		| asigvar {printf("asigvar sentencia\n");}
	   	| ifsim {printf("cond sentencia\n");}

ifsim 		: IFF OPP cond CPP OCB  CCB {printf("ifsim\n");}
//		| error {printf("Hubo un error %d\n", yylineno); return 0;}


cond 		: IDE ASS IDE {printf("asig");}
       		| IDE MTQ IDE {printf("mayor");}
       		| IDE MET IDE {printf("mayor o igual");}
       		| IDE GTQ IDE {printf("menor");}
       		| IDE GEQ IDE {printf("menor o igual");}
       		| IDE EQL IDE {printf("igual");}
       		| IDE NQL IDE {printf("diferente");}
//		| error {printf("Hubo un error en la condición del if\n"); return 0;}

decvar 		: INT IDE SMC
	 	| CHA IDE SMC
	 	| DOU IDE SMC    
	 	| LON IDE SMC
		| SHO IDE SMC
	 	| CHA IDE OBK CBK SMC
	 	| CHA IDE OBK VINT CBK SMC
//		| error {printf("Hubo un error en la declaración de la variable\n"); return 0;}

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

//		| error {printf("Hubo un error en la init  de la variable\n"); return 0;}

asigvar 	: IDE ASS VINT SMC
	 	| IDE ASS VCHA SMC
		| IDE ASS DEC SMC
		| IDE ASS STR SMC
//		;

%%

bool isNumber(const char* string) {
	int length = strlen(string);
    	for (int i = 0; i < length; i++) {
        	if (!isdigit(string[i])) {
            		return false;
        	}
	    }
    	return true;
}

bool isCharacter(const char* string) {
	int length = strlen(string);
    	if (length == 3 && string[0] == '\'' && string[2] == '\'') {
        	return true;
    	}
    	return false;
}

bool isString(const char* string) {
	int length = strlen(string);
   	 if (length >= 2 && string[0] == '"' && string[length - 1] == '"') {
        	return true;
    	}
    	return false;
}

bool isDecimal(const char* string) {
	int length = strlen(string);
  	bool puntoEncontrado = false;
    	for (int i = 0; i < length; i++) {
       		if (!isdigit(string[i])) {
           		if (string[i] == '.' && !puntoEncontrado) {
                		puntoEncontrado = true;
            		} else {
                		return false;
            		}
        	}
    	}
    	return puntoEncontrado;
}

void getElements(char string[], char* elementList[], int* counter){
	char* delimiter = " ";
	char* token = strtok(string, delimiter);
	while(token != NULL && *counter < 15){
		elementList[*counter] = token;
		(*counter)++;
		token = strtok(NULL, delimiter);
	}

	if (*counter ==15 && token != NULL) {
		printf("Error: Se superó el número de elementos en una línea\n");
	}
	
}

int validarExpresion(const char *cadena) {
    int i = 0;
    char c;

    while ((c = cadena[i]) != '\0') {
        if (!isalnum(c)) {
            return 0;  
        }
        i++;
    }

    return 1;  
}

void structureIf(char* ifSentence[]){
	if (strcmp(ifSentence[1], "(")!=0) {
		printf ("La cadena %s no pertenece a la estructura del if\n", ifSentence[1]);
		printf ("Hace falta el paréntesis de apertura para identificar donde empieza la condición.\n");
	} else if (strcmp (ifSentence[5], ")")!=0) {
		printf ("La cadena %s no pertenece a la estructura del if\n", ifSentence[5]);
		printf ("Hace falta el paréntesis de cierre para identificar donde finaliza la condición.\n");
	} else if (strcmp (ifSentence[6], "{")!=0) {
                printf ("La cadena %s no pertenece a la estructura del if\n", ifSentence[6]);
                printf ("Hace falta el corcherte de apertura para identificar las sentencias. \n");
      	}
	printf("La estructura del if es:if ( condición ) {\n}\n");

}

void structureAss(char* assSentence[]){
        if (strcmp(assSentence[1], "=")!=0) {
                printf ("La cadena %s no pertenece a la estructura de asignación o no se encuentra en el orden correcto.\n", assSentence[1]);
                printf ("Hace falta el símbolo '=' que hace referencia a lo que se va asignar.\n");
        } else if (!isNumber(assSentence[2]) || !isCharacter(assSentence[2]) || !isString(assSentence[2]) || !isDecimal(assSentence[2])){
                printf ("La cadena %s no pertenece a la estructura de asignación o no se encuentra en el orden correcto.\n", assSentence[2]);
                printf ("No se está escribiendo correctamente el parámetro a asignar.\n");
        } else if (strcmp (assSentence[3], ";")!=0) {
                printf ("La cadena %s no pertenece a la estructura de asignación o no se encuentra en el orden correcto.\n", assSentence[3]);
                printf ("Hace falta el punto y coma ';'.\n");
	}
}

void structureDecVar(char* decSentence[]){
        if (!validarExpresion(decSentence[1])) {
                printf ("La cadena %s no pertenece a la estructura de declaración de variable o no se encuentra en el orden correcto.\n", decSentence[1]);
                printf ("No se está escribiendo correctamente el identificador de la variable.\n");
        } else if (strcmp (decSentence[3], ";")!=0) {
                printf ("La cadena %s no pertenece a la estructura de asignación o no se encuentra en el orden correcto.\n", decSentence[3]);
                printf ("Hace falta el punto y coma ';'.\n");
        }
}


void identifyStructure(char* elementList[]) {
	if (strcmp(elementList[0], "if")==0) {
		structureIf(elementList);
	} else if ((strcmp(elementList[0], "int")==0) || (strcmp(elementList[0], "char")==0) || (strcmp(elementList[0], "double")==0) || (strcmp(elementList[0], "long")==0) || (strcmp(elementList[0], "short")==0)){
		structureDecVar(elementList);
	}  else if (validarExpresion(elementList[0])) {   //Tiene que ir en los últimos
		structureAss(elementList);
	
	}
}		



void yyerror(const char *s) {
	char s2[sizeof(lineptr)];
	strcpy(s2, lineptr); 
	char* elementList[15];
	int counter = 0;
	getElements(s2, elementList, &counter);
	printf("Error sintáctico en la línea %d columna %d: no se esperaba: %s\n", yylineno,colum, yytext); 
	fprintf(stderr,"error: %s in line %d, column %d\n", s, yylineno, colum);
	fprintf(stderr,"%s", lineptr);
	for(int i = 0; i < colum - 1; i++)
        	fprintf(stderr,"_");
	fprintf(stderr,"^\n");
	
	/*for (int i = 0; i < counter; i++) {
       	 printf("%s ", elementList[i]);
    	}*/
        identifyStructure(elementList);
}





int main(int argc, char **argv){

        if(argc > 1)
                yyin=fopen(argv[1], "rt");
        else
                yyin=stdin;

        yyparse();
	free(lineptr);
        return 0;
}

