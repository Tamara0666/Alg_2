#!/bin/bash

rm -f out.txt input.txt

g++ -o program radix_sort.cpp || exit 1

echo "5 3 8 1 2" > input.txt

./program input.txt || exit 1

output=$(cat out.txt | tr -d '\n')

expected="1 2 3 5 8"

if [ "$output" != "$expected" ]; then
  echo "FAIL"
  echo "Got: $output"
  exit 1
fi

echo "PASS"
