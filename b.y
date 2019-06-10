%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>

%}
%token IDENTIFIANT POINTVIRG COMMENTAIRE VIRG AO AF DEUXPOINTS
%token PLUS MOINS FOIS DIV QUOTIENT MOD RESTE PUISSANCE
%token INF SUP EGAL DIFFERENT INFEG SUPEG AFFECT PO PF AND OR NOT
%token NOMBRE INT_INT LONG_INT BOOLEAN BEGUN VAR FONCTION PROCEDURE READ WRITE PROGRAM FIN
%token IF THEN ELSE CHIFFRE 
%token REPEAT UNTIL WHILE DO FOR TO

%left PLUS MOINS
%left FOIS DIV
%left PUISSANCE
%start programme
%%

programme :PROGRAM IDENTIFIANT POINTVIRG COMMENTAIRE declarations sousprogrammes instructionscomposes FIN {printf("le programme est correcte , bravo");}
      ;
declarations: /*epsilon*/
	|VAR declaration
	;
declaration:liste_identificateurs DEUXPOINTS type POINTVIRG declaration
	|liste_identificateurs DEUXPOINTS type POINTVIRG
	;
liste_identificateurs:IDENTIFIANT
	|liste_identificateurs VIRG IDENTIFIANT
	;
type:INT_INT
	|LONG_INT
	;
sousprogrammes:/*epsilon*/
	|sousprogramme sousprogrammes
	;
sousprogramme:fonction POINTVIRG
	|procedure POINTVIRG
	;
fonction:FONCTION IDENTIFIANT PO parametres PF DEUXPOINTS type POINTVIRG instructionscomposes
	;
procedure:PROCEDURE IDENTIFIANT PO parametres PF POINTVIRG instructionscomposes
	;
parametres:/*epsilon*/
	|liste_identificateurs DEUXPOINTS type
	|liste_identificateurs DEUXPOINTS type POINTVIRG parametres
	;
instructionscomposes:/*epsilon*/
	|AO operations AF
	;
operations:operation
	|operation IF operation THEN AO operations AF operations
	|operation REPEAT operations UNTIL operation
	;
operation:/*epsilon*/
	|AO operation AF operation
	|POINTVIRG operation
	|IDENTIFIANT operation
	|READ PO operation PF operation
	|WRITE PO operation PF operation
	|IDENTIFIANT operateur operation
	|PO operation PF operation
	|NOMBRE operation
	;
operateur:PLUS 
	|MOINS 
	|FOIS
	|INF
	|SUP
	|EGAL
	|DIFFERENT
	|INFEG 
	|SUPEG
	|AFFECT
	|AND
	|OR
	|NOT
	|DIV
	|QUOTIENT
	|MOD
	|RESTE
	|PUISSANCE
	;

%%
int yyerror (char *s) {printf("%s\n",s);}
int yywrap () {return 1;}
main( int argc, char *argv[] )
{ extern FILE *yyin;
++argv; --argc;
yyin = fopen( argv[0], "r" );
yyparse ();
}
