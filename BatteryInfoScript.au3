#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Documents\GitHub\alvonellos.com\src\main\resources\static\assets\img\favicon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; Install all files into the packed binary executable
;#RequireAdmin
#FileInstall("BatteryInfoView.exe", @ScriptDir & "\BatteryInfoView.exe")
#FileInstall("BatteryInfoView.cfg", @ScriptDir & "\BatteryInfoView.cfg")

Local $bFileInstall = True ; Change to True and ammend the file paths accordingly.

; This will install the file C:\Test.bmp to the script location.
If $bFileInstall Then FileInstall("BatteryInfoView.exe", @ScriptDir & "\BatteryInfoView.exe")
If $bFileInstall Then FileInstall("BatteryInfoView.cfg", @ScriptDir & "\BatteryInfoView.cfg")


; We want to run the battery info view program
Run(@ScriptDir & "\BatteryInfoView.exe")
ProcessWait("BatteryInfoView.exe")

WinActivate("BatteryInfoView")
WinWaitActive("BatteryInfoView")

;Send("!")
;Send("v")
;Send("h")

; MsgBox(0, "I'll wait for you", "Let me know when you're done")

;$hFile = FileOpen(EnvGet("TEMP") & "\report.html")
;If -1 = $hFile Then
;	Beep(440, 250)
;	Beep(494, 250)
;	Beep(587, 250)
;EndIf

MsgBox(0, "I'll wait for you", "Let me know when you're done")

;FileMove(@ScriptDir & "\report.html", EnvGet("UserProfile") & "\Desktop\BatteryInfoView.html")
WinClose("BatteryInfoView")

Self_Destruct()

Func Self_Destruct()
	Run(@ComSpec & ' /c ping 127.0.0.1 -n 5 && del /F /Q "' & @ScriptDir & '\BatteryInfoView.cfg"')
	Run(@ComSpec & ' /c ping 127.0.0.1 -n 5 && del /F /Q "' & @ScriptDir & '\BatteryInfoView.exe"')
	Run(@ComSpec & ' /c ping 127.0.0.1 -n 5 && del /F /Q "' & @ScriptFullPath & '"', @SystemDir, @SW_HIDE)
EndFunc