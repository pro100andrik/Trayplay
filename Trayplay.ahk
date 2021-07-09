#Persistent 
#NoEnv
#SingleInstance Force
detectHiddenWindows on
SetWorkingDir %A_ScriptDir%

Menu, Tray, NoIcon

IfNotExist, %A_ScriptDir%\config.ini    
{
default:
PlayPauseEnable := 1
NextEnable := 1
PreviousEnable := 1
DarkTheme := 0

IniWrite, %PlayPauseEnable%, %A_ScriptDir%\config.ini, keys, PlayPauseEnable
IniWrite, %NextEnable%, %A_ScriptDir%\config.ini, keys, NextEnable
IniWrite, %PreviousEnable%, %A_ScriptDir%\config.ini, keys, PreviousEnable
IniWrite, %DarkTheme%, %A_ScriptDir%\config.ini, keys, DarkTheme
sleep 500
}

IniRead, PlayPauseEnable, %A_ScriptDir%\config.ini, keys, PlayPauseEnable
IniRead, NextEnable, %A_ScriptDir%\config.ini, keys, NextEnable
IniRead, PreviousEnable, %A_ScriptDir%\config.ini, keys, PreviousEnable
IniRead, DarkTheme, %A_ScriptDir%\config.ini, keys, DarkTheme

if (PlayPauseEnable = 0){
	Process, Exist, PlayPause.exe ; check to see if AutoHotkey.exe is running
		If errorLevel
			{
			SendMessage, 0x4001,0,,, ahk_exe PlayPause.exe  ;exit 
			}
}
if (PreviousEnable = 0){
	Process, Exist, PreviousTrack.exe ; check to see if AutoHotkey.exe is running
		If errorLevel
			{
			SendMessage, 0x4001,0,,, ahk_exe PreviousTrack.exe  ;exit
			}
}
if (NextEnable = 0){
	Process, Exist, NextTrack.exe ; check to see if AutoHotkey.exe is running
		If errorLevel
			{
			SendMessage, 0x4001,0,,, ahk_exe NextTrack.exe  ;exit
			}
}

if (PlayPauseEnable = 1){
	Process, Exist, PlayPause.exe ; check to see if AutoHotkey.exe is running
		If ! errorLevel
			{
			    IfExist, %A_ScriptDir%\PlayPause.exe
                Run, %A_ScriptDir%\PlayPause.exe
			}
            else
            {
                SendMessage, 0x4002,0,,, ahk_exe PlayPause.exe  ;reload
            }
}
if (PreviousEnable = 1){
	Process, Exist, PreviousTrack.exe ; check to see if AutoHotkey.exe is running
		If ! errorLevel
			{
			    IfExist, %A_ScriptDir%\PreviousTrack.exe
                Run, %A_ScriptDir%\PreviousTrack.exe
			}
            else
            {
                SendMessage, 0x4002,0,,, ahk_exe PreviousTrack.exe  ;reload
            }
}
if (NextEnable = 1){
	Process, Exist, NextTrack.exe ; check to see if AutoHotkey.exe is running
		If ! errorLevel
			{
			    IfExist, %A_ScriptDir%\NextTrack.exe
                Run, %A_ScriptDir%\NextTrack.exe
			}
            else
            {
                SendMessage, 0x4002,0,,, ahk_exe NextTrack.exe  ;reload
            }
}

exitapp