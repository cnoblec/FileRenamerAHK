#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; initial code left

InputBox, fileDestination, Setup, Please paste the detination of your files to copy., 
if ErrorLevel
    MsgBox, CANCEL was pressed.
	return

InputBox, inputDel, Setup, Please eneter the number of characters at the start of the file you wish to remove (as an ineger no spaces) then select and Crtl-C the files you wish to move,
if ErrorLevel
    MsgBox, CANCEL was pressed.'
	return

clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

ClipWait  ; Wait for the clipboard to contain text.

StringReplace, singleLineString, clipboard, `r`n, ©, All

StringGetPos, pos, singleLineString, \, L5 ; fifth \ from the left

pos += inputDel
pos += 1

Loop, parse, singleLineString, ©,
{
	;MsgBox, file number %A_Index% is %A_LoopField%.
	singleFile = A_LoopField
	StringTrimLeft, newFileName, singleFile, pos ; declare newFileName.
	MsgBox, file number %A_Index% is %A_LoopField% its new name is %newFileName%.
	FileCopy, %A_LoopField%, %fileDestination%\%newFileName% ; copy the file under its new name ©
}

MsgBox The following File(s) was/were copied to C:\Users\*\Desktop\MySongs:`n`n%clipboard% ; used to see what the clipboard copies