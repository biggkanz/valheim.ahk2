; Valheim utilities
; quality of life functions for valhleim
; AutoHotkey_2.0-beta.3
#maxthreadsperhotkey 2 ; allow one extra thread to break out of loops
A_MaxHotkeysPerInterval := 500
A_HotkeyInterval := 1000

global AutoClickIsEnabled := false
global RunIsEnabled := false

; KEYBINDS

; bind some equipment keys closer to movement keys
; by default these are bound to autorun, use, hide/show weapon
 ~Q::slot("6")
 ~W::slot("7")
 ~R::slot("8")

; slowly auto clicks left mouse button for crafting 
; second keypress or left mouse button disables
~PgUp::autoMouseClick()
~LButton::disableAutoClick()

; tilde will press the move forward key (defualt: W)
; disabled when another movement key or tilde is pressed
~`::autoRun("E")
; any movement key will disable autorun
~E::disableAutoRun("E")
~S::disableAutoRun("E")
~D::disableAutoRun("E")
~F::disableAutoRun("E")

; bind 4th mouse button to use key (default: E) 
~XButton1::sendKey("v")

; "long press" use (default: E) key activates 25 rapid use key presses
; useful for filling up kilns and forges 
;~XButton1::repeatUseKey("V",25)
~V::repeatUseKey("V",25)

; F9 key will (toggle) suspend this script (for typing in game)
#SuspendExempt
F9::Suspend -1
#SuspendExempt False 

; OPERATIONS

; Additional Keybinds
; bind equipment slots to additional keys while valheim is active
slot(slotNumber)
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send "{" slotNumber "}"
	}
}

; Autoclick for crafting
; activates slow auto click for crafting
autoMouseClick()
{
	if (!AutoClickIsEnabled)
	{
		global AutoClickIsEnabled := true
		while (AutoClickIsEnabled and WinActive("ahk_exe valheim.exe"))
		{
		Sleep 2500
		Click 
		}	
	}	
	else
	{
		global AutoClickIsEnabled := false
	}
}

; Autorun
; enables auto run by holding down run key
autoRun(runKey)
{
	if (!RunIsEnabled and WinActive("ahk_exe valheim.exe"))
	{
		Send "{" runKey " down}"
		global RunIsEnabled := true
	}
	else if (RunIsEnabled)
	{
		Send "{" runKey " up}"
		global RunIsEnabled := false
	}
}

; Use button repeater
; spam click use on long press (150 ms) [repeats] times
repeatUseKey(useKey,repeats)
{
	pressed := 0
	use := 0
	while (getkeystate(useKey,"p") and WinActive("ahk_exe valheim.exe"))
	{
		pressed++
		sleep 10
		if (pressed > 15 and WinActive("ahk_exe valheim.exe"))
		{			
			while (use < repeats)
			{
				use++
				sleep 10			
				Send "{" useKey " down}"			
				sleep 10	
				Send "{" useKey " up}"
			}	
			return		
		}
	}	
	return
}

; disable functions
disableAutoRun(runKey)
{
	if (RunIsEnabled)
	{
		Send "{" runKey " up}"
		global RunIsEnabled := false
	}
}

disableAutoClick()
{
	if(AutoClickIsEnabled)
	{
		global AutoClickIsEnabled := false
	}
}

; send key if valheim is active
sendKey(key)
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send key
	}
}
