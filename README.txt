To execute the project type the command : 
flex f.flex
bison -d b.y
gcc lex.yy.c b.tab.c -o projet -ll
./projet fich
