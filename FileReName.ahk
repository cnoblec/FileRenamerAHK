#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; initial code left
canceled = false
InputBox, fileDestination, Setup, Please type the name of the artist to make an additional copy in their folder. If you press cancel no additional copy will be made, 
if ErrorLevel
{
    MsgBox, CANCEL was pressed. the program will fill a default songs folder
	canceled = false
}
InputBox, inputDel, Setup, Please eneter the number of characters at the start of the file you wish to remove (as an ineger no spaces) then select and Crtl-C a song in the folder you wish to move,
if ErrorLevel
{
    MsgBox, CANCEL was pressed. the program will exit
	return
}

clipboard =

clipWait

characters := StrLen(clipboard)

StringGetPos, position, clipboard, \, L5 ; fifth \ from the left

characters -= position
characters -= 1

StringTrimRight, clipboard, clipboard, characters

Loop, Files, %clipboard%*.mp3
{
	StringTrimLeft, newFileName, A_LoopFileName, inputDel
	;MsgBox the fileName is %A_LoopFileName% will be renamed to %newFileName%
	FileCopy, %clipboard%%A_LoopFileName%, C:\Users\solra\Music\Songs Just as Names\All Songs\%newFileName% ; copy the file under its new name ©
	if canceled != true
	{	
	FileCopy, %clipboard%%A_LoopFileName%, C:\Users\solra\Music\Songs Just as Names\%fileDestination%\%newFileName%
	}
}
