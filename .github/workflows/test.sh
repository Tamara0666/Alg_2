#!/bin/bash

rm -f out.txt napaka.txt

g++ -o program radix_sort.cpp || { echo "COMPILATION ERROR" > napaka.txt; exit 1; }

./program vhod.txt || { echo "RUNTIME ERROR" > napaka.txt; exit 1; }

result=$(cat out.txt | xargs)
sorted=$(echo "$result" | tr ' ' '\n' | sort -n | xargs)

if [ "$result" != "$sorted" ]; then
    echo "NOT SORTED" > napaka.txt
    exit 1
fi

echo "" > napaka.txt
echo "OK"
