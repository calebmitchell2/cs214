%{
#include <stdio.h>
%}

%%
[0123456789]+           printf("NUMBER\n");
[_a-zA-Z][a-zA-Z0-9_]*    printf("WORD\n");
%%
