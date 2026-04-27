#!/bin/bash

set -x

rm -f out.txt napaka.txt

g++ -o program radix_sort.cpp || { echo "COMPILATION ERROR" > napaka.txt; exit 1; }

./program vhod.txt || { echo "RUNTIME ERROR" > napaka.txt; exit 1; }

# PRAVILNA KONTROLA SORTA
sorted=$(tr ' ' '\n' < out.txt | sort -n | tr '\n' ' ')
result=$(cat out.txt)

# odstrani zadnji space
sorted=${sorted% }

if [ "$result" != "$sorted" ]; then
    echo "NOT SORTED" > napaka.txt
    exit 1
fi

echo "" > napaka.txt
echo "OK"

echo "OUT:"
cat out.txt || true
