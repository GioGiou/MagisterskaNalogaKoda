#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Scripta prejem en argument <datoteka>\n"
  exit 0
fi

if [ $# -ge 2 ]; then
  echo "Scripta prejem en argument <datoteka>\n"
  exit 0
fi
cat "../test/dna.50MB" | head "-c 80" >> "../test/dna.50MB.80.txt"
for ((i=800; i<=35000000;i=i*2)) do

	cat "$1" | head "-c $i" >> "$1.$i.txt"
done
