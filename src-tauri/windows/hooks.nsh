!include "LogicLib.nsh"

!macro NSIS_HOOK_PREINSTALL
  ; Windows 10 начинается со сборки 10240.
  SetRegView 64
  ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" "CurrentBuildNumber"
  ${If} $0 == ""
    MessageBox MB_ICONSTOP "Для работы HamtiGram требуется Windows 10 или новее."
    Abort
  ${EndIf}
  ${If} $0 < 10240
    MessageBox MB_ICONSTOP "Для работы HamtiGram требуется Windows 10 или новее."
    Abort
  ${EndIf}
!macroend
