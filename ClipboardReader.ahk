﻿; this wound up being where all the testing was done the offcial renamer is "FileReName.ahk"

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; initial code left

InputBox, inputDel, Setup, Please eneter the number of characters at the start of the file you wish to remove (as an ineger no spaces) then copy the files you wish to move, 
if ErrorLevel
{
    MsgBox, CANCEL was pressed. the program will exit
	return
}

clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

ClipWait  ; Wait for the clipboard to contain text.

StringReplace, singleLineString, clipboard, `r`n, ©, All

StringGetPos, pos, clipboard, \, R ; Firt \ from the right

pos += inputDel
pos += 1

Loop, parse, singleLineString, ©,
{
	MsgBox, file number %A_Index% is %A_LoopField%.
	StringTrimLeft, newFileName, A_LoopField, pos ; declare newFileName.
	FileCopy, %A_LoopField%, C:\Users\solra\Desktop\MySongs\%newFileName% ; copy the file under its new name ©
}

MsgBox The following File was copied to MySongs:`n`n%clipboard% ; used to see what the clipboard copies