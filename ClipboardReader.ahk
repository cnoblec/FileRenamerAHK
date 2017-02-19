SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
newClipboard = 
ClipWait  ; Wait for the clipboard to contain text.

clipboard := StringChop(clipboard,clipboard,56)

MsgBox Control-C copied the following contents to the clipboard:`n%clipboard%

StringChop(inputVar,outputVar,chop)
{
StringMid, inputVar, outputVar, chop
return outputVar
}