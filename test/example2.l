%{
#include <stdio.h>
%}

%%
[0-9]+		printf("NUMBER\n");
[a-zA-Z]+	printf("LETTER(S)\n");
%%

