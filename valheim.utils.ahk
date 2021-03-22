#maxthreadsperhotkey 2
#MaxHotkeysPerInterval 500
#HotkeyInterval 1000
global Toggle := false
global EDown := false
global Sprint := false

; Move 6,7,8 equpiment keys closer to movement keys
~Q::
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send "{6}"
	}
}

~W::
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send "{7}"
	}
}

~R::
{
	if(WinActive("ahk_exe valheim.exe"))
	{
		Send "{8}"
	}
}

; PgUp activates slow auto click for crafting
~PgUp::
{
	if (!Toggle)
	{
		Toggle := true
		while (Toggle and WinActive("ahk_exe valheim.exe"))
		{
		Sleep 2500
		Click 
		}	
	}	
	else
	{
		Toggle := false
	}
}

; Tilde toggles auto-run that
~`::
{
	if (!EDown and WinActive("ahk_exe valheim.exe"))
	{
		Send "{E down}"
		EDown := true
	}
	else if (EDown)
	{
		Send "{E up}"
		EDown := false
	}
}

; Spam click V (use)
~XButton1::v
~XButton1::
~v::
{
	pressed := 0
	use := 0
	while (getkeystate("v","p") and WinActive("ahk_exe valheim.exe"))
	{
		pressed++
		sleep 10
		if (pressed > 15 and WinActive("ahk_exe valheim.exe"))
		{			
			while (use < 30)
			{
				use++
				sleep 10			
				Send "{v down}"			
				sleep 10	
				Send "{v up}"
			}	
			return		
		}
	}	
	return
}

;---------------------------------------
; misc utlity

; Any movement key will disable auto-run
~E::
~D::
~S::
~F::
{
	if (EDown)
	{
		Send "{E up}"
		EDown := false
	}
}

;Left mouse button disables any auto
~LButton::
{
	if(Toggle)
	{
		Toggle := false
	}
}

; F9 key will enable or disable this script (for typing in game)
#SuspendExempt
F9::Suspend -1