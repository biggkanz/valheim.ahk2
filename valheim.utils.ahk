#maxthreadsperhotkey 2
#MaxHotkeysPerInterval 500
#HotkeyInterval 1000
global AutoClickIsEnabled := false
global RunIsEnabled := false
global Sprint := false

; bind equipment slots to additional keys only while valheim is active
slot(slotNumber)
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send "{" slotNumber "}"
	}
}

; activates slow auto click for crafting
autoMouseClick()
{
	if (!AutoClickIsEnabled)
	{
		AutoClickIsEnabled := true
		while (AutoClickIsEnabled and WinActive("ahk_exe valheim.exe"))
		{
		Sleep 2500
		Click 
		}	
	}	
	else
	{
		AutoClickIsEnabled := false
	}
}

; enables auto run by holding down run key
autoRun()
{
	if (!RunIsEnabled and WinActive("ahk_exe valheim.exe"))
	{
		Send "{E down}"
		RunIsEnabled := true
	}
	else if (RunIsEnabled)
	{
		Send "{E up}"
		RunIsEnabled := false
	}
}

; Spam click use on long press 30 times
repeatUseKey(useKey)
{
	pressed := 0
	use := 0
	while (getkeystate(useKey,"p") and WinActive("ahk_exe valheim.exe"))
	{
		pressed++
		sleep 10
		if (pressed > 15 and WinActive("ahk_exe valheim.exe"))
		{			
			while (use < 30)
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

; utility functions
disableAutoRun()
{
	if (RunIsEnabled)
	{
		Send "{E up}"
		RunIsEnabled := false
	}
}

disableAutoClick()
{
	if(AutoClickIsEnabled)
	{
		AutoClickIsEnabled := false
	}
}

; bind hotkeys to functions
~PgUp::autoMouseClick()
~Q::slot("6")
~W::slot("7")
~R::slot("8")
~`::autoRun()

~XButton1::v
~XButton1::repeatUseKey("v")
~v::repeatUseKey("v")

; Any movement key will disable auto-run
~E::disableAutoRun()
~D::disableAutoRun()
~S::disableAutoRun()
~F::disableAutoRun()

~LButton::disableAutoClick()

; F9 key will enable or disable this script (for typing in game)
#SuspendExempt
F9::Suspend -1