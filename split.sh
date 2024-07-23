#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Scripta prejem en argument <datoteka>\n"
  exit 0
fi

if [ $# -ge 2 ]; then
  echo "Scripta prejem en argument <datoteka>\n"
  exit 0
fi

for ((i=800; i<=35000000;i=i*2)) do

	cat "../test/dna.50MB" | head "-c $i" >> "../test/dna.50MB.$i.txt"
done
