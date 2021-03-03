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
	Run C:\Program Files\WindowsApps\CanonicalGroupLimited.UbuntuonWindows_2004.2021.222.0_x64__79rhkp1fndgsc\ubuntu.exe
return

+Escape::
	Send, ~
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

#b::	
	Run C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe
return
