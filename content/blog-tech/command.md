---
title: Commands Summary
description: Frequently used code snippet for installation and configuration.
date: 2022-07-25
tags: ["linux","config"]
---

## ShadowSocks configuration

```
$ pip3 -m install setuptools
$ pip3 -m install git+https://github.com/shadowsocks/shadowsocks.git@master
// config file begin
{
  "server": "0.0.0.0",
  "port_password": {
    "10325": "******1",
    "10326": "******2"
  },
  "timeout": 300,
  "method": "rc4-md5"
}
/ config file end
$ ssserver -c configfile -d start/stop/restart
```

## SSH key-gen

```
# local
# ~/.ssh/config

# Host alias
#     HostName 12.23.34.45
#     Port 22
#     User root
# Host alias2
#     ....

ssh-keygen -t rsa

ssh-copy-id alias

ssh alias
```

## Ubuntu Firewall

```
ufw status
ufw allow 22
ufw deny 22
ufw reload
ufw enable
```

## Git

```
# save credentials
git config --global credential.helper store

# Undo 'git commit --amend'
git reset --soft HEAD@{1}
```

## Python and envs

```
$ brew install zlib sqlite
$ export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
$ export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"

$ brew install pyenv 
$ pyenv install 3.7.3
$ pyenv global 3.7.3
$ pyenv version

// include these in the bash config file
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
// end

$ python -m pip install --user ...
$ python -m pip install virtualenvwrapper

// include these in the bash config file 
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
. ~/.pyenv/versions/3.7.3/bin/virtualenvwrapper.sh
// end

$ mkvirtualenv test1
$ ls $WORKON_HOME
$ workon
$ deactivate
$ rmvirtualenv test1

// source from 
// https://opensource.com/article/19/5/python-3-default-mac
// https://opensource.com/article/19/6/python-virtual-environments-mac
```


