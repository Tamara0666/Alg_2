#!/bin/bash

g++ -o program main.cpp

output=$(./program <<< "2 3")

if [ "$output" != "5" ]; then
  echo "Test FAIL"
  exit 1
fi

echo "Test PASS"
