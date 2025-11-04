-- modmul
-- main
-- maint
-- Barrett
-- Matrix
-- matpow
-- isPrime
-- Faster
-- Sieve
-- fori
-- lca
-- lazysegtree
-- oset
-- fenwick
local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
  -- main snippet
  parse("main", [[
#include <bits/stdc++.h>
using namespace std;
using ll = long long;

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
#ifdef OE
#define deb(x) cout << #x << ": " << x << "\n";
#else
#define deb(x) (void)0
#endif
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

parse("ReadFromFile", [[
freopen(".in","r",stdin);
freopen(".out","w",stdout);
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
  parse("isPrime", [[
bool isPrime(unsigned long long n) {
    if(n<2 || n % 6 % 4 != 1) return (n | 1) == 3;
    unsigned long long A[] = {2,325,9375,28178,450775,9780504,1795265022},
		       s = __builtin_ctzll(n-1),
		       d = n >> s;
    for(ull a : A) { // count trailing zeros
	ull p = MP(a%n,d,n),i=s;
	while(p != 1 && p!=n-1 && a%n && i--) 
	    p = modmul(p,p,n);
	if(p != n-1 && i!=s) return false;
    }
    return true;
}
]]),
  parse("modmul", [[
ull modmul(ull a,ull b,ull M) {
    return (__uint128_t)a*b % M;
} 
]]),
  parse("custom_hash", [[
struct custom_hash {
    static uint64_t splitmix64(uint64_t x) {
	x += 0x9e3779b97f4a7c15;
	x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;
	x = (x ^ (x >> 27)) * 0x94d049bb133111eb;
	return x ^ (x >> 31);
    }

    size_t operator()(uint64_t x) const {
	static const uint64_t FIXED_RANDOM = chrono::steady_clock::now().time_since_epoch().count();
	return splitmix64(x + FIXED_RANDOM);
    }
};
]]),
  parse("lca", [[
auto lca = [&](int u,int v) {
    if(d[u] < d[v])
	swap(u,v);
    for(int i = 19; ~i; --i)
	if(d[u] - (1<<i)>=d[v])
	    u = anc[u][i];
    if(u==v) return u;
    for(int i = 19; ~i; --i)
	if(anc[u][i]^anc[v][i])
	    u = anc[u][i], v = anc[v][i];
    return anc[u][0];
};
]]),
  parse("lazysegtree", [[
class lazysegtree {
    int n;
    vector<ll> tr;
    vector<ll> lz;
public: 
    lazysegtree(const vector<ll> &a) {
	n = a.size();
	tr.resize(4*n,0);
	lz.resize(4*n,0);
	build(1,0,n-1,a);
    }
    void build(int x,int l,int r,const vector<ll> &a) {
	if(r < l) return ;
	if(l == r) {
	    tr[x] = a[l];
	    return ;
	}
	int m = (l+r)/2;
	build(2*x,l,m,a);
	build(2*x+1,m+1,r,a);
	tr[x] = max(tr[2*x],tr[2*x+1]);
    }
    void push(int x) {
	if(lz[x] == 0) return ;
	tr[2*x] += lz[x];
	tr[2*x+1] += lz[x];
	lz[2*x] += lz[x];
	lz[2*x+1] += lz[x];
	lz[x] = 0;
    }
    void upd(int x,int l,int r,int a,int b,ll val) {
	if(a>r || b<l) return ;
	if(a<=l && b>=r) {
	    tr[x] += val;
	    lz[x] += val;
	    return;
	} 
	push(x);
	int m = (l+r)/2;
	upd(2*x,l,m,a,b,val);
	upd(2*x+1,m+1,r,a,b,val);
	tr[x] = max(tr[2*x],tr[2*x+1]);
    }
    long long qry(int x,int l,int r,int a,int b) {
	if(a>r || b<l) return -Inf;
	else if(a<=l && b>=r) {
	    return tr[x];
	} 
	push(x);
	int m = (l+r)/2;
	ll lm = qry(2*x,l,m,a,b);
	ll rm = qry(2*x+1,m+1,r,a,b);
	return max(lm,rm);
    }
};
]]),
  parse("oset", [[
#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;
template<class T> 
using oset = tree<T,null_type,less<T>,rb_tree_tag,tree_order_statistics_node_update>;
]]),
  parse("fenwick", [[
template<class T> 
class fenwick {
    int n;
    vector<T> bit;
public:
    fenwick(int sz) {
	this->n = sz;
	bit.resize(n+1,0);
    }
    void add(int idx,T val) {
	assert(idx>0 && idx<n+1);
	for(;idx<=n; idx += (idx&-idx))   
	    bit[idx] += val;
    }
    T qry(int r) {
	assert(r>0 && r<n+1);
	T s = 0;
	for(; r>0; r-=(r&-r))
	    s += bit[r];
	return s;
    }
    T rqry(int l,int r) {
	return qry(r) - qry(l-1);
    }
};
]]),
}
