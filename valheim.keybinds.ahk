#include valheim.operations

; bind some equipment keys closer to movement keys
~Q::slot("6")
~W::slot("7")
~R::slot("8")

; slowly auto clicks left mouse button for crafting 
; second keypress or left mouse button disables
~PgUp::autoMouseClick()
~LButton::disableAutoClick()

; tilde will press the move forward key 
; disabled when another movement key or tilde is pressed
~`::autoRun("E")
; any movement key will disable autorun
~E::disableAutoRun()
~D::disableAutoRun()
~S::disableAutoRun()
~F::disableAutoRun()

; bind another key to use (side mouse button)
~XButton1::v

; "long press" use key to rapidly activates 25 use key presses
; useful for filling up kilns and forges 
~XButton1::repeatUseKey("v",25)
~v::repeatUseKey("v",25)

; F9 key will disable and enable this script (for typing in game)
#SuspendExempt
F9::Suspend -1