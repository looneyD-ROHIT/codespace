%{
#include <stdio.h>
#include <stdlib.h>
%}

%token BINARY_NUM OCTAL_NUM EOL

%%

input:
    /* empty */
    | input line
    ;

line:
    number EOL {
        printf("Decimal equivalent: %d\n", $1);
    }
    | error EOL {
        fprintf(stderr, "Error: Invalid input\n");
    }
    ;

number:
    BINARY_NUM {
        $$ = $1;
    }
    | OCTAL_NUM {
        $$ = $1;
    }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
