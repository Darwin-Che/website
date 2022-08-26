---
title: My voyage in the Open-Source world
description: Extending a fast reverse proxy
date: 2022-08-25
tags: ["go","open-source","libfrp","rfrp"]
---
# My voyage in the Open-Source world

## [libfrp](https://github.com/Darwin-Che/libfrp)

[Fast Reverse Proxy (frp)](https://github.com/fatedier/frp) is an open-source project on GitHub by fatedier.

Frp contains a server and clients.
The requests to the server can be redirected to the client even though the clients are behind a NAT.

My intention is to add a more flexible router based on the domain.
Each client is associated with a subdomain. For example, the server's domain is 'libfrp.com'.
The original project provides a subdomain router so that we can separate traffic to
'test.libfrp.com' and 'blog.libfrp.com' to different clients.

I want manage the router dynamically.
1. Disable/enable a subdomain
2. Limit the bandwidth on a subdomain
3. Separate encryption between subdomains

Therefore, I forked frp to [libfrp](https://github.com/Darwin-Che/libfrp).
Created a test/deploy environment with docker in [rfrp](https://github.com/Michael-CStorm/RFRP).
The environment is created to manage any database and expose the API to control the router.

### Stage 1

Read the original source code.

I spent about 4 months on and off in this stage. The main goal is to 
1) learn the go programming language,
2) figure out how the reverse proxy works,
3) identify where my extension should come in.

I start by reading the proxy server entry point code, and my first major improvement comes
after I learned about `defer` and `select`. After this I began to understand the pattern of
the server receiving messages from the client and sending messages back.

The second major breakthrough is when I start to use debug breakpoint provided by vscode.
By analyzing the call stack, I was able to finally pin down the router code.

### Stage 2

Prototyping approaches and measure performance.

#### Router Filter

My first and easiest approach is to add a router filter which only let the enabled subdomain pass.
The router filter is called with every lookup in the routing table.
I choose the Redis Hashtable as the router filter. The table is written by an external controller,
and the table is read by the router filter.

A prototype was built and hosted on my website.

The major concern is the performance.

1) The router filter is called with every lookup in the routing table.
In the case where the filter doesn't change often, the overhead is very wasteful.

2) When the routing table is huge, but only a small part of the subdomains are enabled.
The routing lookup is wasteful, we only need a routing lookup on the small subset of enabled subdomains.

#### Stateful Router

