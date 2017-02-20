SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

name = 61

ClipWait  ; Wait for the clipboard to contain text.

StringMid, newFileName, clipboard, name ; declare newFileName.
StringReplace, singleLineString, clipboard, `r`n, ©, All

;FileCopy, %clipboard%, C:\Users\solra\Desktop\MySongs\%newFileName% ; copy the file under its new name ©

MsgBox The following File was copied to MySongs:`n`n%singleLineString%