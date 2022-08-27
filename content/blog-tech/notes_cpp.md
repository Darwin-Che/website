---
title: Effective C++ Notes
description:
date: 2022-07-25
tags: ["c++"]
---
## OO Design

### 32 - Public inheritance means "is a"

### 33 - Avoid hiding inherited names

If Base Class has overloading functions, but Derived Class defines a function of same name, but doesn't define all overloading options, then the Derived Class hides the Base Class in this function name. 

But we don't want this happen, what to do? Add `using Base::fn` in the Derived Class definition (public / private) ? Public!

If in a private inheritance, then should directly call `Base::fn()` when needed. This is called "forwarding function". 

### 34 - Inheritance of interface vs implementation

Pure virtual function : inherit interface only

( able to provide implementation for pure virtual, but can only be called by forwarding function )

Simple virtual function : inherit interface and default implementation

Nonvirtual function : invariant over specialization

#### Trick 1

Provide public pure virtual interface, and a protected nonvirtual default implementation. So the Derived Class must explicitly specify what they want, only one line, so good to inline in definition. 

#### Trick 2

Provide public pure virtual interface, provide implementation for pure virtual, and let Derived Class call the forwarding function. Drawback: the implementation is public instead of protected. 

### 35 - Alternatives to virtual functions

#### Template Method Pattern via Nonvirtual Interface Idiom

#### Strategy Pattern via Function Pointers 

Check function/bind out

#### Classic Strategy Pattern

### 36 - Never Redefine an inherited nonvirtual function

### 37 - Never Redefine a function's inherited default parameter

default parameter are not dynamically bound. 

Avoid code duplication by NVI. 

### 38 - "has a" or "is implemented in" by composition

The difference between "has a" and "is a". Only inherit when "is a", in most cases, "has a" is better implemented with composition. 

### 39 - Private Inheritance : Caution!

Private inheritance vs composition: both represents is implemented in terms of a

Composition: don't want the derived class of widget to override the timer's virtual methods, reduce compilation dependency, 

private inheritance: for derived class to access protected member or needs to redefine inherited virtual functions, Empty base optimization

### 40 - Multiple Inheritance : Caution!



## Templates and Generic Programming

### 41 - Intro to Templates

### 42 - typename usage

only use it for nested dependent type, e.g. `typename C::iterator cit;`

Exception: in class inheritance list, and member initialization list : no typename

common usage `typedef typename std::iterator_traits<C>::value_type value_type`

### 43 - Access names in templatized base classes

```
templace <class T>
class Derived : public Base<T> {...}
```

It cannot call a Base's function directly. 

Option 1 : `this ->f();` 

Option 2 : `using Base<T>::f`

Option 3 : `Base<T>::f();`

### 44 - Factor parameter-independent code out of templates

