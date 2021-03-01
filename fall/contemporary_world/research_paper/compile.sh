#!/bin/bash
FILE=$1
ENGINE="xelatex"
BIBENGINE="bibtex"

$ENGINE $FILE.tex
$BIBENGINE $FILE
$ENGINE $FILE.tex
$ENGINE $FILE.tex
