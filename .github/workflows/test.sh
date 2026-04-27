#!/bin/bash

g++ -o program radix_sort.cpp || exit 1

# naredi input file
echo "5 3 8 1 2" > input.txt

# zaženi program
./program input.txt || exit 1

# preberi output
output=$(cat out.txt | tr -d '\n')

expected="1 2 3 5 8"

if [ "$output" != "$expected" ]; then
  echo "FAIL"
  echo "Got: $output"
  exit 1
fi

echo "PASS"
