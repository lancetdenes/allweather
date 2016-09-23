#!/bin/bash

for year in {1973..2016}
do
    files=/ufrc/zoo6927/share/PS1.3/data/$year/*.txt
    for f in $files
    do
	maxTemp=`cat $f | cut -f2 -d',' | sort -nr | head -n1` 
	printf $f'\t'$maxTemp'\n'
    done > hightemp$year.txt
    augustmax=`cat hightemp$year.txt | cut -f2 | sort -nr | head -n1`
    printf $year'\t'$augustmax'\n'
done > augusthighs.txt

rm hightemp*

echo Five highest-temp years: > finaloutput.txt
cat augusthighs.txt | sort -k2nr | head -n5 >> finaloutput.txt
echo  >> finaloutput.txt
echo Five lowest-temp years: >> finaloutput.txt
cat augusthighs.txt | sort -k2n | head -n5 >> finaloutput.txt

