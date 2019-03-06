#! /bin/bash
#sox first.mp3 second.mp3 third.mp3 result.mp3
while IFS="," read column1 column2 column3; do
sox $column1 $column2 /path to file/$column3;
done < /directory to save new file/sox-wavs.txt
