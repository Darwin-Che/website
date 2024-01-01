---
title: Rust Learning Notes
description:
date: 2024-01-01
tags: ["rust"]
---

## Books

[Programming Rust](https://www.oreilly.com/library/view/programming-rust-2nd/9781492052586/) Good introduction

[Learn Rust With Entirely Too Many Linked Lists](https://rust-unofficial.github.io/too-many-lists/) Good intermediate book for rust memory model, fun to read

[The Rustonomicon](https://doc.rust-lang.org/nightly/nomicon/intro.html) Reading this now

## Misc

1. Trait Object vs Generics
2. AsRef, AsMut for standard library
3. Borrow for HashMap
4. ToOwned

### Iterator Sources

```
std::ops::{Range, RangeFrom, RangeInclusive}
Option<T>.iter()
Result<T,E>.iter()
{Vec<T>, &[T]}.{windows(n), chunks(n), chunks_mut(n), split(fn), split_mut(fn), rsplit(fn), rsplitn(fn)}
{String, &str}.{bytes(), chars(), split_whitespace(), lines(), split(ch), matches(pt)}
std::collections::{HashMap, BTreeMap}.{keys(), values(), values_mut()}
std::collections::{HashSet, BTreeSet}.{union(s), intersection(s)}
std::sync::mpsc::Receiver.iter()
std::io::Read.{bytes(), chars()}
std::io::BufRead.{lines(), split(0)}
std::fs::read_dir(path)
std::fs::net::TcpListener.incoming()
std::iter::{empty(), once(x), repeat(x)}
```

### Iterator Methods

#### Adapters

```
map(FnMut(Item) -> B)
filter(FnMut(&Item) -> bool)
filter_map(FnMut(Item) -> Option<B>)
flat_map(FnMut(Item) -> impl IntoIterator)
flatten()
take(n)
take_while(FnMut(&Item) -> bool)
skip(n)
skip_while(FnMut(&Item) -> bool)
peekable()
fuse()
rev()
inspect(Fn(Item) -> ())
chain(IntoIterator)
enumerate()
zip(IntoIterator)
by_ref()
cloned() / copied()
cycle()
```

#### Consumers

```
count(), sum(), product()
max(), min()
max_by(FnMut(&Item, &Item) -> bool), min_by(...)
max_by_key(FnMut(&Item) -> impl Ord), min_by_key(...)
<, >, ==
any(FnMut(&Item) -> bool), all(...)
position(FnMut(&Item) -> bool), rposition(...)
fold(A, FnMut(A, Item) -> A), rfold(...)
try_fold(A, FnMut(A, Item) -> Result<A, Err>), try_rfold(...)
nth(n), nth_back(n) // doesn't take ownership
last() // next_back() for non-reversible iterator
find(FnMut(&Item) -> bool), rfind(...), find_map(FnMut(&Item) -> Option<B>)
collect() // std::iter::FromIterator trait
extend() // std::iter::Extend trait
partition(FnMut(&Item) -> bool) -> (B, B) where B: Default + Extend<Item>
for_each(FnMut(&Item) -> ())
try_for_each(FnMut(&Item) -> ())

```

