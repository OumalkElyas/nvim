local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
  -- main snippet
  parse("main", [[
#include <stdio.h>

int main() {

    $1

    return 0;
}
]]),

  parse("flex", [[
%{
#include<stdio.h>
%}

CHIFFRE [0-9]
LETTRE  [a-zA-Z]

%%
.		{ printf("Def: %s\n", yytext); }

%%


int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
]]),

}
