#!/bin/bash

rm -f pubs_tex.md
sed 's/{% reference \(.*\) %}/\\fullcite{\1}/' pubs.inp > pubs_tex.md
pandoc pubs_tex.md -o pubs.tex
pandoc -f markdown activities.inp -o activities.tex

rm -f activities.md 
sed 's/ {-}//' activities.inp > activities.md

rm -f pubs.md
sed 's/ {-}//' pubs.inp > pubs.md

latexrun --bibtex-cmd biber vita.tex
