#!/bin/bash
FILE=$1
ENGINE="xelatex"
BIBENGINE="biber"

$ENGINE $FILE.tex
$BIBENGINE $FILE
$ENGINE $FILE.tex
