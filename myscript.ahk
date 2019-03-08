^+::
	if GetKeyState("CapsLock", "T") = 1
		SetCapsLockState, Off
	else if GetKeyState("CapsLock", "T") = 0
		SetCapsLockState, On
return

^Escape::
	Send !{f4}
return

#c::
	Run C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico -
return

+Escape::
	Send, ~
return

#g::
	Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
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