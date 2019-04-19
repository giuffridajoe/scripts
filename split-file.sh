#!/bin/bash

#split into smaller files containing this many lines per file and name each file
#note: each file will be called filenameaa, filenameab etc.
split -l 15000 [insert filename here] [insert filename for split files]
#iterate over each file and prepend this text to the beginning
for file in [files to iterate over]*; do echo '[add text here]' | cat - "$file" > temp && mv temp "$file"; done
#iterate over each file and append a file extension
for file in [files to iterate over]*; do mv -- "$file" "$file.txt"; done
