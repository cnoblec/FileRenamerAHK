#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; initial code left

clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

;could potentially take input for filelocation from clipboard

InputBox, inputDel, Setup, Please eneter the number of characters at the start of the file you wish to remove (as an ineger no spaces) then copy the files you wish to move, 

ClipWait  ; Wait for the clipboard to contain text.

StringReplace, singleLineString, clipboard, `r`n, ©, All

StringGetPos, pos, clipboard, \, R ; Firt \ from the right

pos += inputDel
pos += 2

Loop, parse, singleLineString, ©,
{
	;MsgBox, file number %A_Index% is %A_LoopField%.
	StringMid, newFileName, A_LoopField, pos ; declare newFileName.
	FileCopy, %A_LoopField%, C:\Users\solra\Music\Songs_Without_Sorting_Numbers\%newFileName% ; copy the file under its new name ©
}

MsgBox The following File(s) was/were copied to C:\Users\*\Desktop\MySongs:`n`n%clipboard% ; used to see what the clipboard copies