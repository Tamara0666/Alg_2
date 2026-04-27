#!/bin/bash

set -e

rm -f out.txt

echo "BUILD..."
g++ -o program radix_sort.cpp || exit 1

echo "RUN..."
./program vhod.txt || exit 1

echo "CHECK..."

# preberi output
result=$(cat out.txt | xargs)

# preveri, če je sortiran
sorted=$(echo "$result" | tr ' ' '\n' | sort -n | xargs)

if [ "$result" != "$sorted" ]; then
  echo "FAIL: array is not sorted"
  echo "Got: $result"
  exit 1
fi

echo "PASS: correctly sorted"
