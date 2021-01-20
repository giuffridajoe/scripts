# A collection of shell scripts

*__sox-script.sh__* - 
Uses the sox command line utility to concatenate multiple audio files into one file. It reads two columns from a file, concatenates them together and gives it a name equal to whatever is in the third column. Then it saves it somewhere. 

```
   #! /bin/bash
   #sox first.mp3 second.mp3 third.mp3 result.mp3

   while IFS="," read column1 column2 column3; do
   sox $column1 $column2 /path to file/$column3;
   done < /directory to save new file/sox-wavs.txt
```
<br><br>

*__split-file.sh__* - 
Takes a file as an argument and break it up into smaller ones. Records per file and the name of smaller files is passed into the split command.

```
   #!/bin/bash
   #split into smaller files containing this many lines per file and name each file
   #note: each file will be called filenameaa, filenameab etc.
   
   split -l 15000 $1 test-test
   
   #iterate over each new file and prepend this text to the beginning
   for file in test*; do echo 'add text here' | cat - "$file" > temp && mv temp "$file"; done
   
   #iterate over each new file and append a file extension
   for file in test*; do mv -- "$file" "$file.txt"; done
```
<br><br>

*__myscript.ahk__* - 
Remaps keyboard keys to have other functions. Needs the AutoHotKey app to run

*__reanme.sh__* - 
Renames a specified piece of a file to something else
