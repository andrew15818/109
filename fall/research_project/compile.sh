#!/bin/bash
FILE=$1
ENGINE="xelatex"
BIBENGINE="biber"
$VIEWER="zathura"

$ENGINE $FILE.tex
$BIBENGINE $FILE
$ENGINE $FILE.tex
