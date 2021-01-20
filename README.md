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

```
   ^+::
      if GetKeyState("CapsLock", "T") = 1
         SetCapsLockState, Off
      else if GetKeyState("CapsLock", "T") = 0
         SetCapsLockState, On
   return

   ^Escape::
      Send !{f4}
   return

   #u::
      Run C:\Program Files\WindowsApps\CanonicalGroupLimited.UbuntuonWindows_2004.2020.812.0_x64__79rhkp1fndgsc\ubuntu.exe
   return

   +Escape::
      Send, ~
   return

   #f::
      Run C:\Program Files\Mozilla Firefox\firefox.exe
   return

   ^t:: 
   { 

      BlockInput, on 

      prevClipboard = %clipboard% 

      clipboard = 

      Send, ^c 

      BlockInput, off 

      ClipWait, 2 

      if ErrorLevel = 0 

      { 

         searchQuery=%clipboard%

         GoSub, CPSearch 

      } 

      clipboard = %prevClipboard% 

      return 

   } 



   CPSearch: 

      StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 

      Loop 

      { 

         noExtraSpaces=1 

         StringLeft, leftMost, searchQuery, 1 

         IfInString, leftMost, %A_Space% 

         { 

            StringTrimLeft, searchQuery, searchQuery, 1 

            noExtraSpaces=0

         } 

         StringRight, rightMost, searchQuery, 1 

         IfInString, rightMost, %A_Space% 

         { 

            StringTrimRight, searchQuery, searchQuery, 1 

            noExtraSpaces=0 

         } 

         If (noExtraSpaces=1) 

            break 

         } 


   StringReplace, searchQuery, searchQuery, `%, `%25, All 

   StringReplace, searchQuery, searchQuery, &, `%26, All 

   StringReplace, searchQuery, searchQuery, \, `%5C, All 

   StringReplace, searchQuery, searchQuery, %A_Space%, +, All 

   StringReplace, searchQuery, searchQuery,<,  , All 

   StringReplace, searchQuery, searchQuery,>,  , All 

   StringReplace, searchQuery, searchQuery,.,`%2E, All 

   IfInString, searchQuery, . 

   { 

      IfInString, searchQuery, + 

         Run https://cp.talksoftonline.com/index.php/admin/edit/%searchQuery% 

      else 

         Run %searchQuery% 

      } 

   else 

      Run https://cp.talksoftonline.com/index.php/admin/edit/%searchQuery% 

   return



   ^g:: 
   { 
      BlockInput, on 
      prevClipboard = %clipboard% 
      clipboard = 
      Send, ^c 
      BlockInput, off 
      ClipWait, 2 
      if ErrorLevel = 0 
      { 
         searchQuery=%clipboard%
         GoSub, GoogleSearch 
      } 
      clipboard = %prevClipboard% 
      return 
   } 

   GoogleSearch: 
      StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
      Loop 
      { 
         noExtraSpaces=1 
         StringLeft, leftMost, searchQuery, 1 
         IfInString, leftMost, %A_Space% 
         { 
            StringTrimLeft, searchQuery, searchQuery, 1 
            noExtraSpaces=0
         } 
         StringRight, rightMost, searchQuery, 1 
         IfInString, rightMost, %A_Space% 
         { 
            StringTrimRight, searchQuery, searchQuery, 1 
            noExtraSpaces=0 
         } 
         If (noExtraSpaces=1) 
            break 
      } 

      StringReplace, searchQuery, searchQuery, `%, `%25, All 
      StringReplace, searchQuery, searchQuery, &, `%26, All 
      StringReplace, searchQuery, searchQuery, \, `%5C, All 
      StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
      StringReplace, searchQuery, searchQuery,<,  , All 
      StringReplace, searchQuery, searchQuery,>,  , All 
      StringReplace, searchQuery, searchQuery,.,`%2E, All 
      IfInString, searchQuery, . 
      { 
         IfInString, searchQuery, + 
            Run http://www.google.com/search?hl=en&q=%searchQuery% 
         else 
            Run %searchQuery% 
      } 
      else 
         Run http://www.google.com/search?hl=en&q=%searchQuery% 
   return

   !e::
      ClipSaved := ClipboardAll
      Send ^c
      ClipWait
      FullPath := Clipboard
      Run C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE %FullPath%
      Clipboard := ClipSaved
      ClipSaved =
   return

   #b::
      Run C:\Program Files\Git\git-bash.exe
   return
```

*__reanme.sh__* - 
Renames a specified piece of a file to something else

```
   #!/bin/bash
   for file in *.wav
   do
       mv -i "${file}" "${file/711154/711501}"
   done
```
