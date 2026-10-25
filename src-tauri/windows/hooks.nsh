!include "LogicLib.nsh"

!macro NSIS_HOOK_PREINSTALL
  ; Windows 10 starts at build 10240.
  SetRegView 64
  ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" "CurrentBuildNumber"
  ${If} $0 == ""
    MessageBox MB_ICONSTOP "HamtiGram requires Windows 10 or later."
    Abort
  ${EndIf}
  ${If} $0 < 10240
    MessageBox MB_ICONSTOP "HamtiGram requires Windows 10 or later."
    Abort
  ${EndIf}
!macroend
