#!/bin/sh
# Author: Andres Ponce
COMP=gcc
SRC=sample
SHARED=logger
HASFLAG=0
CMD=""
OOPT=""
POPT=./logger.so
TARGFLAGS="-shared -fPIC  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
function compSrc(){
	$COMP -o $SRC -Wall -g $SRC.c
}
function compTarget(){
	#$COMP -o $SHARED.so -shared -fPIC $SHARED.c -ldl
	$COMP -o $SHARED.so -g $TARGFLAGS $SHARED.c -ldl
}
function usage(){
	echo "usage: ./logger.sh [-o file] [-p sopath] [--] cmd [cmd args ...]"	
	echo -e "\t-p: set the path to logger.so, default = ./logger.so"
	echo -e "\t-o: print output to file, print to \"stderr\" if no file specified."
	echo -e "\t--: separate the arguments for logger and for the command"
	exit 1
}


if [ $# -eq 0 ]
then 
	echo "no command given."
	exit 1
fi

while getopts o:p: flag
do
	case "${flag}" in
		o)
			OOPT="$OPTARG"
			HASFLAG=1
		;;
		p)
			POPT="$OPTARG"
			HASFLAG=1
		;;
		*)
			#echo -e "Invalid option -- '$flag'"
			usage
		;;
	esac
done
compTarget
# Get the command to execute along with args
if [ $HASFLAG -eq 1 ]
then
	CMD=$(echo $@ | awk -F '--' '{print $2}')
else
	CMD=$@
fi
	
# Only if certain arg redirect stderr to file
if [ ! -z "$OOPT" ]
then 
(
LD_PRELOAD=$POPT $CMD 
) 2> $OOPT
fi

