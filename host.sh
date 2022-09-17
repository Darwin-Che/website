#!/bin/bash

PORT=8080
BIND=0.0.0.0
REMOTE=localhost

############################################################
## Read in PORT and REMOTE

read -p "PORT = " PORT_RDVAL
if [[ ${PORT_RDVAL} != '' ]]; then
	PORT=${PORT_RDVAL}
fi

read -p "REMOTE = " REMOTE_RDVAL
if [[ ${REMOTE_RDVAL} != '' ]]; then
	REMOTE="\/\/${REMOTE_RDVAL}"
fi

############################################################
## Install Theme

if [[ ! -d themes ]]; then
	mkdir themes
	pushd themes
	git clone https://github.com/athul/archie.git
	popd themes
	
fi


############################################################
## config.toml.pub -> config.toml

function configTomlGen {
	sed "s/%REMOTE/\"${REMOTE}\"/g" config.toml.pub > config.toml
}

configTomlGen

############################################################
## Start hosting

read -p "Generate public/ = " IF_PUBLIC

if [[ ${IF_PUBLIC} == 'y' ]]; then
       hugo -s . -d ./public
else
       hugo server -D --bind $BIND -b $REMOTE -p $PORT
fi
