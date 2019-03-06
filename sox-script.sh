#! /bin/bash
#sox first.mp3 second.mp3 third.mp3 result.mp3
while IFS="," read column1 column2 column3; do
sox $column1 $column2 /opt/rai/remote/voice/English/joe/$column3;
done < joe/sox-wavs.txt
