local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- main snippet
    s("main", {
	t({
	    "#include <bits/stdc++.h>",
	    "using namespace std;",
	    "using ll = long long;",
	    "",
	    "int main() {",
	    "    ios::sync_with_stdio(false);",
	    "    cin.tie(0);",
	    "    "
	}),
	i(1,""),
	t({
	    "",
	    "",
	    "    return 0;",
	    "}"
	})
    }),


    s("maint", {
	t({
	    "#include <bits/stdc++.h>",
	    "using namespace std;",
	    "using ll = long long;",
	    "",
	    "void solve(){",
	    "    ",
	}),
	i(1,""),
	t({
	    "",
	    "}",
	    "",
	    "int main() {",
	    "    ios::sync_with_stdio(false);",
	    "    cin.tie(0);",
	    "    ",
	    "    int T; cin >> T;",
	    "    while(T--) solve();",
	    "    ",
	    "    return 0;",
	    "}"
	}),
    }),
    -- for loop snippet
    s("fori", {
	t("for (int i = 0; i < "),
	i(1, "n"),
	t("; ++i) {"),
	t({"", "\t"}),
	i(2, "// code"),
	t({"", "}"})
    }),

    -- solve function
    s("solve", {
	t({
	    "void solve(){",
	    "    "
	}),
	i(1,"int n; std::cin >> n;"),
	t({"","    "}),
	i(2,"vector<int> a(n); for(int& i : a) cin >> i;"),
	t({
	    "",
	    "}"
	})
    }),

    s("debug", {
	t("#define deb(x) cout << #x << \" : \" << x << \"\\n\";"),
    }),
    s("Sieve", {
	t({
	    "vector<int> sieve() {",
	    "    vector<int> primes;",
	    "    bitset<N> seen;",
	    "    for( int i = 2;i<N;++i) {",
	    "        if(seen[i]) continue;",
	    "        primes.push_back(i);",
	    "        for(int j = 2*i;j<N;j+=i)",
	    "            seen[j] = true;",
	    "    }",
	    "    return primes;",
	    "}"
	}),
    }),
    s("Faster", {
	t({
	    "#pragma GCC optimize(\"Ofast,unroll-loops\")",
	    "#pragma GCC target(\"avx2,bmi,bmi2,lzcnt,popcnt\")"
	}),
    }),
    s("Barrett", {
	t({
	    "template<class T>",
	    "ull Barrett(T a){",
	    "    static ull m = -1ull / Mod;",
	    "    ull q = (__uint128_t(m) * a) >> 64;",
	    "    ull r = a - q * Mod;",
	    "    if(r >= Mod) r -= Mod;",
	    "    return r;",
	    "}",
	}),
    }),
}

