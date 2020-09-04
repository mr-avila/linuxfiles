﻿; UTF-8 with BOM

; --- sublime stata editor no admin --------------------------------------------------------------------
#IfWinActive ahk_exe sublime_text.exe
^+Enter::
    WinGet, winid
    if WinExist("Do-file Editor - stata_temp.do") {
        SendInput, ^c
        Sleep, 55
        stata_do() 
    }
    else {
        MsgBox, , Error, Do-File Editor with stata_temp not found
    }
Return

#IfWinActive ahk_exe sublime_text.exe
^+r:: ;just like above, but runs quietly
    WinGet, winid
    if WinExist("Do-file Editor - stata_temp.do") {
        SendInput, ^c
        Sleep, 55
        stata_run() 
    }
    else {
        MsgBox, , Error, Do-File Editor with stata_temp not found
    }
Return

stata_do() {
    WinActivate,
    Sleep, 55
    Send, {CtrlDown}{Sleep, 22}{a}{Sleep, 22}v{Sleep, 22}d{CtrlUp}{CtrlUp}{Ctrl}
    Sleep, 55
    WinActivate, ahk_exe sublime_text.exe
    ;WinActivate, ^Stata/SE 15.1 
}

stata_run() {
    WinActivate,
    Sleep, 55
    Send, {CtrlDown}{Sleep, 22}{a}{Sleep, 22}v{Sleep, 22}r{CtrlUp}{CtrlUp}{Ctrl}
    Sleep, 55
    WinActivate, ahk_exe sublime_text.exe
    ;WinActivate, ^Stata/SE 15.1 
}
#IfWinActive
; --- Stata --------------------------------------------------------------------

#IfWinActive, ^Do-file Editor
    ; define some sane shortcuts for statas editor
    ^w::SendInput, !f{Sleep 33}c
    ^PgUp::SendInput, ^+{TAB}
    ^PgDn::SendInput, ^{TAB}

    LShift & WheelUp::SendInput, {HOME}
    LShift & WheelDown::SendInput, {END}
#IfWinActive

#IfWinActive, ^Data Editor (Browse)*
    LShift & WheelUp::SendInput, +{Left 3}
    LShift & WheelDown::SendInput, +{Right 3}
    
    !WheelUp::SendInput, +{Left 5}
    !WheelDown::SendInput, +{Right 5}
    
    ; changes Behaviour of Stata Browser scrollwheel

    +WheelDown::SendInput, +{Right}
    +WheelUp::SendInput, +{Left}

    ^+WheelDown::SendInput, +{Right 5}
    ^+WheelUp::SendInput, +{Left 5}

    ^WheelDown::SendInput, {WheelDown 10}
    ^WheelUp::SendInput, {WheelUp 10}

    ; changes Behaviour of Stata Browser arrows
    !Right::SendInput, {Right 5}
    +!Right::SendInput, +{Right 5}

    !Left::SendInput, {Left 5}
    +!Left::SendInput, +{Left 5}

    !Down::SendInput, {Down 10}
    !Up::SendInput, {Up 10}

#IfWinActive

; --- Stata Markdown --------------------------------------------------------------------
#IfWinActive, ^.stmd 
^+i::SendInput, ````````````{Left 3}{{}s{}}{Enter 2}{Up}
#IfWinActive
