#Persistent  ; Keep this script running until the user explicitly exits it.
SetTimer, WatchPOV, 5
return

WatchPOV:
GetKeyState, POV, JoyPOV  ; Get position of the POV control.
KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).


if POV < 0
    KeyToHoldDown =
else if POV > 18000
    KeyToHoldDown = Left
else if POV > 9000
    KeyToHoldDown = Down
else if POV > 0
    KeyToHoldDown = Right
else
    KeyToHoldDown = Up

if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return

Joy1::
    Send {B down}
    KeyWait Joy8
    Send {Baa up}
return

Joy2::
    Send {A down}
    KeyWait Joy8
    Send {A up}
return

Joy8::
    Send {r down}
    KeyWait Joy8
    Send {r up}
return

Joy10::
    Send {space down}
    KeyWait Joy8
    Send {space up}
return