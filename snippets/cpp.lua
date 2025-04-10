local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("maintana", {
    t({
      "#include <iostream>",
      "int main() {",
      "\t"
    }),
    i(1, "// code here"),
    t({
      "",
      "\treturn 0;",
      "}"
    })
  }),  -- This comma was missing
  
  s("solvet", {
    t({
      "#include<iostream>",
      "\nvoid solve(){",
      "\t"
    }),
    i(1, "// your solution here"),
    t({
      "}\n",
      "int main(){",
      "\tint t; std::cin >> t;",
      "\twhile(t--) solve();",
      "\treturn 0;",  -- Added return statement for good practice
      "}"
    })
  })
}
