#!/bin/bash
# Created By:	Richard L. Jackson
# Date:		17.08.2019

option="${1}"

if [ -e "settings.conf" ];then
	source "settings.conf"
else
	printf "\033[35mError:\t\033[31mNo Settings Configuration was defined.\033[0m\n"
	echo 1
fi

error(){
	printf "\033[35mError:\t\033[31m${1}\033[0m\n"
}

compile(){
	printf "Compiling -> ${progname}\n" 
	if [ -f "${progname}.java" ];
	then
		javac ${progname}.java > /dev/null && echo "Done!"
	else
		error "Unable to find Class \'${progname}.java\'."
	fi
}

run(){
	[ -f "${progname}.class" ] && java ${progname} || error "No program was found for ${progname}."
}

help_menu(){
	printf "\033[036mJCrow \033[33mJava Compiler Runtime OpenJDK Wrapper\033[0m\n"
	printf "\033[32mCompile\t\033[32m[ -c, -compile, --compile ]\n"
	printf "\033[32mRun\t\033[32m[ -r, -run, --run ]\n"
}

case $option in
	-c|-compile|--compile) compile;;
	-r|-run|--run) run;;
	-h|-help|--help) help_menu;;
	*) error "Missing or invalid parameter was given.";;
esac
