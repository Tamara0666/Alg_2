#!/bin/bash

g++ -o program radix_sort.cpp || exit 1

output=$(echo "5 3 8 1 2" | ./program)

expected="1 2 3 5 8"

if [ "$output" != "$expected" ]; then
  echo "FAIL"
  echo "Got: $output"
  exit 1
fi

echo "PASS"
