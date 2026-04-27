#!/bin/bash

set -e
set -x

# pobriši stare datoteke
rm -f out.txt napaka.txt

# kompilacija
g++ -o program radix_sort.cpp || { echo "COMPILATION ERROR" > napaka.txt; exit 1; }

# zagon programa
./program ./vhod.txt || { echo "RUNTIME ERROR" > napaka.txt; exit 1; }

# preveri če obstaja output
if [ ! -f out.txt ]; then
  echo "NO OUTPUT FILE" > napaka.txt
  exit 1
fi

echo "OUTPUT:"
cat out.txt

# normalizacija (odstrani odvečne presledke)
result=$(tr -s ' ' < out.txt | xargs)

# sortirana verzija
sorted=$(echo "$result" | tr ' ' '\n' | sort -n | xargs)

echo "RESULT: $result"
echo "SORTED: $sorted"

# primerjava
if [ "$result" != "$sorted" ]; then
  echo "NOT SORTED" > napaka.txt
  exit 1
fi

# če pride sem → OK
echo "" > napaka.txt
echo "TEST PASSED"
