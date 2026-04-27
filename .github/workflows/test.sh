#!/bin/bash

set -e

rm -f out.txt input.txt

echo "BUILD..."
g++ -o program radix_sort.cpp

echo "RUN..."
echo "5 3 8 1 2" > input.txt

./program input.txt

echo "OUTPUT:"
cat out.txt

echo "DONE"
