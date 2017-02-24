#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

clipboard =

clipWait

characters := StrLen(clipboard)

StringGetPos, position, clipboard, \, L5 ; fifth \ from the left

characters -= position
characters -= 1

StringTrimRight, clipboard, clipboard, characters

MsgBox %clipboard%

Loop, Files, %clipboard%*.mp3
{
	
	StringTrimLeft, newFileName, A_LoopFileName, 5
	MsgBox the fileName is %A_LoopFileName% will be renamed to %newFileName%
	FileCopy, %clipboard%%A_LoopFileName%, C:\Users\solra\Desktop\MySongs\%newFileName% ; copy the file under its new name ©

}