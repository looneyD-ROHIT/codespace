%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

[01]+b   { yylval.num = strtol(yytext, NULL, 2); return BINARY_NUM; }
[0-7]+o  { yylval.num = strtol(yytext, NULL, 8); return OCTAL_NUM; }
\n       { return EOL; }
.        { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
