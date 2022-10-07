---
title: Projects
date: 2022-10-07
---

## Libsync

(2022-09, Now)
[Repo](https://github.com/Darwin-Che/libsync-server)
[Demo Video](https://zhaochengche.me/share/demo/libsync.mp4)

### Summary

A redis-like hashtable that supports subscription to specific keys.

Keywords: C++, POSIX TCP Socket, epoll

### Usage

When other processes wants to access the hashtable,
they can create a process-local cache for faster access.

This application provides an easy way to keep the cache in sync.

## Libfrp

(2022-06, Now)
[Repo](https://github.com/Darwin-Che/libfrp)
[Demo Link](https://zhaochengche.me:8880)

### Summary

Modify the open-source project [Fast Reverse Proxy (frp)](https://github.com/fatedier/frp)
for managable subdomain routing.

Keywords: Golang, Redis

### Usage

When you want to use the reverse proxy to access a file server behind a NAT,
but you want to be able to toggle the accessibility for better security.

When the server wants to limit the overall bandwidth by imposing a time-limit on each subdomain.

## Ray Tracer

(2022-03, 2022-04)
[Demo Video](https://zhaochengche.me/share/ray_tracer.mp4)

### Summary

Completed by the course requirement of [CS488](https://student.cs.uwaterloo.ca/~cs488/index.html).

Implemented Shadow Ray and Reflection Ray for ray tracing.
Implemented texture mapping for cubes and spheres. Used jittering for supersampling.

Keywords: C++, Ray Tracer, Texture Mapping

## RCU (Read-Copy-Update) Hash Table

(2021-10, 2021-12)
[Repo](https://github.com/Darwin-Che/rcu_hashtable)
[Demo Video](https://zhaochengche.me/share/rcu_hashtable.mp4)

### Summary

Designed and implemented concurrent hash tables on top of
the read-copy-update mechanism; analyzed its correctness;
and conducted experiments with kthread to investigate the performance.

Keywords: C, Linux Kernel Module

## Monopoly Game

(2020-06, 2020-08)
[Demo Video](https://zhaochengche.me/share/monopoly.mp4)

### Summary

Implemented Monopoly Game in a team of three; using multiple design paradigms: MVC, RAII, Template, PIMPL, Observer.

Keywords: C++, Design Patterns

## Calculator

(2020-01, 2020-02)
[Repo](https://github.com/Darwin-Che/handmade-calculator)
[Demo Video](https://zhaochengche.me/share/calculator.mp4)

### Summary

Implemented both my primitive algorithm and Shunting-yard algorithm with Reverse Polish Notation evaluation algorithm in multiple programming languages.