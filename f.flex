%{
#include <stdio.h>
#include "b.tab.h"
%}
blanc	[ \t]+	
chiffre	[0-9]	
entier	{chiffre}+ 
exposant	[eE]{+-}?{entier}
reel	{entier}("."{entier})?{exposant} 
lettre	[a-zA-Z]
id	{lettre}({lettre}|{chiffre})*
nombre	{entier}|{chiffre}
commentaire	"(*"({id}|{blanc})*"*)"
%%
blanc	{}
chiffre	{return (CHIFFRE);}
";"	{return (POINTVIRG);}
":"	{return (DEUXPOINTS);}
","	{return (VIRG);}
"+"	{return (PLUS);} 
"-"	{return (MOINS);} 
"or"	{return (OR);} 
"*"	{return (FOIS);} 
"/"	{return (DIV);} 
"div"	{return (QUOTIENT);} 
"mod"	{return (RESTE);} 
"and"	{return (AND);} 
"<"	{return (INF);} 
">"	{return (SUP);} 
"="	{return (EGAL);}
"<>"	{return (DIFFERENT);} 
"<="	{return (INFEG);} 
">="	{return (SUPEG);} 
"("	{return (PO);} 
")"	{return (PF);} 
"{"	{return (AO);}
"}"	{return (AF);}
":="	{return (AFFECT);} 
"**"	{return (PUISSANCE);}  
"Int"	{return (INT_INT);} 
"LongInt"	{return (LONG_INT);} 
"var"	{return (VAR);} 
"func"	{return (FONCTION);} 
"proc"	{return (PROCEDURE);} 
"if"	{return (IF);} 
"then"	{return (THEN);} 
"else"	{return (ELSE);} 
"repeat"	{return (REPEAT);} 
"until"	{return (UNTIL);} 
"while"	{return (WHILE);} 
"do"	{return (DO);} 
"for"	{return (FOR);} 
"to"	{return (TO);}
"not"	{return (NOT);}
"read"	{return (READ);}
"write"	{return (WRITE);}
"program"	{return (PROGRAM);}
"end"	{return (FIN);}
"."	{return (FIN);}
"begin" {return (BEGUN);}
"boolean"	{return (BOOLEAN);}
{id} 	{return (IDENTIFIANT);}
{nombre}	{yylval= atof(yytext) ;return (NOMBRE);}
{commentaire}	{return (COMMENTAIRE);}
%%

