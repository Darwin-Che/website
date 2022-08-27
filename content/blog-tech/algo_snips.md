---
title: Algo Snippet
description: My own algorithm code snippets.
date: 2022-07-25
tags: ["algo"]
---
# Algebra

## Sieve of Primes

```cpp
vector<int> pr;

vector<int> allprimes(int n) { // O(N log log N)
    vector<bool> is_prime(n+1, true);
    is_prime[0] = is_prime[1] = false;
    for (int i = 2; i * i <= n; i++) {
    	if (is_prime[i]) {
        	for (int j = i * i; j <= n; j += i)
        		is_prime[j] = false;
        }
    }
    for (int i = 2; i <= n; ++i) {
        if (is_prime[i]) 
            pr.push_back(i);
    }
}
```

## Get All Factorization

```cpp
vector<int> spf;
vector<int> pr;

void sieve(int n) { // O(N)
    spf.resize(n+1);
    pr.clear();
    for (int i = 2; i <= n; ++i)
        spf[i] = i;

    for (int i = 2; i * i <= n; i++) {
        if (spf[i] != i) continue; 
        pr.push_back(i);
        for (int j = 0; j < pr.size() && pr[j] <= spf[i] && i*pr[j] <= n; ++j) {
            spf[i * pr[j]] = pr[j];
        }
    }
}

vector<int> getFactors(int n) { // O(logN)
    vector<int> factors;
    while (n > 1) {
        factors.push_back(spf[n]);
        n /= spf[n];
    }
    return factors;
}
```



# Data Structure

## Sparse Table

```cpp
class SparseTable {
    using llong = long long;
    llong ** ST; 
    llong * LOG;
    llong N, K;
    SparseTable(llong n, llong * array) {
        N = n;
        // compute log
        LOG = new llong[N+1];
        LOG[1] = 0;
        for (llong i = 2; i <= MAXN; i++)
            LOG[i] = LOG[i/2] + 1;
        K = LOG[N] + 1;
        ST = new llong*[N+1];
        for (llong i = 0; i <= N; ++i)
            ST[i] = new llong*[K];
        // precompute
        for (llong i = 0; i < N; i++)
		    ST[i][0] = f(array[i]);   // change f
        for (llong j = 1; j <= K; j++)
    		for (llong i = 0; i + (1 << j) <= N; i++)
        		ST[i][j] = f(ST[i][j-1], ST[i + (1 << (j - 1))][j - 1]);
    }
    llong ranQ(llong L, llong R) {
        llong ans = 0; // change initial
        for (llong j = K; j >= 0; j--) {
            if ((1 << j) <= R - L + 1) {
                ans = f( ans, ST[L][j] ); // change f
                L += 1 << j;
            }
        }
        return ans;
    }
    llong ranQfast(llong L, llong R) {
        llong j = LOG[R - L + 1];
        return f( st[L][j], st[R - (1 << j) + 1][j] ); // change f
    }
};
```



```cpp
long long st[N+1][K]; // take K >= log_2 N

// precompute
for (int i = 0; i < N; i++)
    st[i][0] = f(array[i]);

for (int j = 1; j <= K; j++)
    for (int i = 0; i + (1 << j) <= N; i++)
        st[i][j] = f(st[i][j-1], st[i + (1 << (j - 1))][j - 1]);

int log[MAXN+1];
log[1] = 0;
for (int i = 2; i <= MAXN; i++)
    log[i] = log[i/2] + 1;

// range query for log n
long long sum = 0;
for (int j = K; j >= 0; j--) {
    if ((1 << j) <= R - L + 1) {
        sum += st[L][j];
        L += 1 << j;
    }
}

// range query for O(1)
int j = log[R - L + 1];
int minimum = min(st[L][j], st[R - (1 << j) + 1][j]);
```

## Union Find

```cpp
class UnionFind {
    vector<int> parent, size;
public:
    UnionFind(int n) {
        parent.resize(n); size.resize(n);
        for (int i = 0; i < n; i++) {
            parent[i] = i; size[i] = 1;
        }
    }
    int find(int x) {
        if (x == parent[x]) return x;
        return parent[x] = find(parent[x]); 
    }
    bool Union(int u, int v) {
        int pu = find(u), pv = find(v);
        if (pu == pv) return false; // Return False if u and v are already union
        if (size[pu] > size[pv]) { // Union by larger size
            size[pu] += size[pv];
            parent[pv] = pu;
        } else {
            size[pv] += size[pu];
            parent[pu] = pv;
        }
        return true;
    }
};
```
