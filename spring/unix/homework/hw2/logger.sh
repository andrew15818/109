#!/bin/sh
# Author: Andres Ponce
COMP=gcc
SRC=sample
SHARED=logger
DELIM="--"
CMD=""
OOPT=/dev/tty
POPT=./logger.so
#function compSrc(){
#	$COMP -o $SRC -Wall -g $SRC.c
#}
#function compTarget(){
#	$COMP -o $SHARED.so -shared -fPIC $SHARED.c -ldl
#}

while getopts o:p: flag
do
	case "${flag}" in
		o)
			OOPT="$OPTARG"
		;;
		p)
			POPT="$OPTARG"
		;;

	esac
done
# Get the command to execute along with args
CMD=$(echo $@ | awk -F '--' '{print $2}')

LD_PRELOAD=$POPT $CMD > "$OOPT"
