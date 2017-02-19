#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
clipboard =
send ^c
ClipWait
StringMid, clipboard, clipboard, 59, 0, L
MsgBox Control-C copied the following contents to the clipboard:`n`n%clipboard%
Return