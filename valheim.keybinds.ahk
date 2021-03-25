#include valheim.operations

; bind some equipment keys closer to movement keys
; by default these are bound to autorun, use, hide/show weapon
; ~Q::slot("6")
; ~E::slot("7")
; ~R::slot("8")

; slowly auto clicks left mouse button for crafting 
; second keypress or left mouse button disables
~PgUp::autoMouseClick()
~LButton::disableAutoClick()

; tilde will press the move forward key 
; disabled when another movement key or tilde is pressed
~`::autoRun("E")
; any movement key will disable autorun
~W::disableAutoRun()
~A::disableAutoRun()
~S::disableAutoRun()
~D::disableAutoRun()

; bind another key to use (side mouse button)
~XButton1::v

; "long press" use (default: E) key activates 25 rapid use key presses
; useful for filling up kilns and forges 
~XButton1::repeatUseKey("E",25)
~E::repeatUseKey("E",25)

; F9 key will disable and enable this script (for typing in game)
#SuspendExempt
F9::Suspend -1