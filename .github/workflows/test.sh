#!/bin/bash

set -e

rm -f out.txt input.txt

echo "BUILD..."
g++ -o program radix_sort.cpp || { echo "BUILD FAILED"; exit 1; }

echo "RUN..."
echo "5 3 8 1 2" > input.txt

./program input.txt || { echo "RUNTIME FAILED"; exit 1; }

echo "OUTPUT FILE:"
cat out.txt

output=$(cat out.txt | xargs)
echo "NORMALIZED OUTPUT: $output"

expected="1 2 3 5 8"

if [ "$output" != "$expected" ]; then
  echo "❌ WRONG RESULT"
  echo "EXPECTED: $expected"
  echo "GOT: $output"
  exit 1
fi

echo "✅ PASS"
