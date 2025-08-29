local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
  -- main snippet
  parse("main", [[
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
using ii = pair<int,int>;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);

    $1

    return 0;
}
]]),

  parse("maint", [[
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
using ii = pair<int,int>;

void solve(){
    $1
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);

    int T; cin >> T;
    while(T--) solve();

    return 0;
}
]]),

  parse("fori", [[
for (int i = 0; i < $1; ++i) {
    $2
}
]]),

  parse("solve", [[
void solve(){
    $1
    $2
}
]]),

  parse("debug", [[
#define deb(x) cerr << #x << " : " << x << "\n";
]]),

  parse("Sieve", [[
vector<int> sieve() {
    vector<int> primes;
    bitset<N> seen;
    for (int i = 2; i < N; ++i) {
        if(seen[i]) continue;
        primes.push_back(i);
        for(int j = 2*i; j < N; j += i)
            seen[j] = true;
    }
    return primes;
}
]]),

  parse("Faster", [[
#pragma GCC optimize("Ofast,unroll-loops")
#pragma GCC target("avx2,bmi,bmi2,lzcnt,popcnt")
]]),

  parse("Barrett", [[
template<class T>
ull Barrett(T a){
    static ull m = -1ull / Mod;
    ull q = (__uint128_t(m) * a) >> 64;
    ull r = a - q * Mod;
    if(r >= Mod) r -= Mod;
    return r;
}
]]),

parse("ReadOnFile", [[
freopen("input","r",stdin);
freopen("output","w",stdout);
]]),

  parse("Matrix", [[
struct matrix {
    ll mat[2][2];
    matrix friend operator *(const matrix &a,const matrix &b) {
        matrix c;
        for(int i = 0;i<2;++i) {
            for(int j = 0;j<2;++j) {
                c.mat[i][j] = 0;
                for(int k=0;k<2;++k) {
                    c.mat[i][j] += a.mat[i][k] * b.mat[k][j];
                }
            }
        }
        return c;
    }
    matrix friend operator %(const matrix &a,ll M) {
        matrix res;
        for(int i = 0;i<2;++i) {
            for(int j = 0;j<2;++j) {
                res.mat[i][j] = a.mat[i][j] % M;
            }
        }
        return res;
    }
};
]]),
  parse("matpow", [[
matrix matpow(matrix base,ll n) {
    matrix ans = {{ 
	{1,0},
	{0,1}
    }};
    while(n) {
	if(n&1) ans = (ans * base) % Mod;
	base = (base * base) % Mod;
	n>>=1;
    }
    return ans;
}
]]),
}
