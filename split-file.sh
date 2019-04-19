#!/bin/bash

#split into smaller files containing this many lines per file and name each file
#note: each file will be called filenameaa, filenameab etc.
split -l 15000 $1 test-test 
#iterate over each new file and prepend this text to the beginning
for file in test*; do echo 'add text here' | cat - "$file" > temp && mv temp "$file"; done
#iterate over each new file and append a file extension
for file in test*; do mv -- "$file" "$file.txt"; done
