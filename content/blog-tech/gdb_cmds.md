---
title: GDB Commands
description:
date: 2022-07-25
tags: ["gdb"]
---
# GDB Commands

## Graphical UI

```
gdb -q -tui ...
```

```
// repaint
ref

// choose panel (asm, register, src code)
layout
```

## Commands

```
// print out assembly isntructions
x/i $pc
x/10i $pc

// print hex and binary
p/x
p/t

// print string
x/s <addr>

// print array
// n : num units
// f : format x,d,u,c,s
// u : unit
x/nfu 

// printf function location
x/i function

// see assembly
disassemble <function>

// see register value
info register

// go to the end of function
finish

// multi thread
i threads


```

## Config

```
// turn on off pretty print
set print pretty on|off
show print pretty


```

## Misc

### Execute a gdb script on command line 

```
gdb -x script ...
```

### valgrind support

```
valgrind -vgdb=yes -vgdb-error=0 <program>

// connect gdb
$ gdb <program>
(gdb) target remote | vgdb
```

