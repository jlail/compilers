default:
	bison -d ex1.y
	flex ex1.l
	g++ -o mycalc ex1.tab.c lex.yy.c