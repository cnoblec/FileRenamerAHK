SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

nameWNum = 56
name = 61

ClipWait  ; Wait for the clipboard to contain text.

StringMid, fileName, clipboard, nameWNum ; declare fileName.

StringMid, newFileName, clipboard, name ; declare newFileName.

length := StrLen(clipboard)

FileCopy, %clipboard%, C:\Users\solra\Desktop\MySongs\%newFileName%

MsgBox The following File was copied to MySongs:`n`n%fileName%