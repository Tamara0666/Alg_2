#!/bin/bash

set -x

rm -f out.txt napaka.txt

g++ -o program radix_sort.cpp
if [ $? -ne 0 ]; then
  echo "COMPILATION ERROR" > napaka.txt
  exit 1
fi

./program ./vhod.txt
if [ $? -ne 0 ]; then
  echo "RUNTIME ERROR" > napaka.txt
  exit 1
fi

if [ ! -f out.txt ]; then
  echo "NO OUTPUT FILE" > napaka.txt
  exit 1
fi

echo "OUTPUT:"
cat out.txt

result=$(tr -s ' ' < out.txt | xargs)
sorted=$(echo "$result" | tr ' ' '\n' | sort -n | xargs)

if [ "$result" != "$sorted" ]; then
  echo "NOT SORTED" > napaka.txt
  exit 1
fi

echo "" > napaka.txt
echo "TEST PASSED"
