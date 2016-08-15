!include "MUI2.nsh"

!define FXVERSION "0.3"

Name "Futurix Photo Renamer"
OutFile "output\futurixrenamer.exe"
CRCCheck on
SetCompressor /SOLID lzma
RequestExecutionLevel highest
ShowInstDetails nevershow
ShowUninstDetails nevershow

BrandingText "Futurix Photo Renamer ${FXVERSION}"

InstallDir "$PROGRAMFILES\Futurix Photo Renamer"

!define MUI_WELCOMEPAGE_TITLE "Futurix Photo Renamer ${FXVERSION}"
!define MUI_WELCOMEPAGE_TEXT "This wizard will guide you through the installation of Futurix Photo Renamer.$\r$\n$\r$\n$_CLICK"

!define MUI_COMPONENTSPAGE_NODESC
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-r.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall-r.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
  
!insertmacro MUI_LANGUAGE "English"


Section "-Core"
  SectionIn RO
  SetDetailsPrint none
  
  SetOutPath "$INSTDIR"
  File "..\bin\FuturixRenamer.exe"
  
  CreateShortCut "$SMPROGRAMS\Futurix Photo Renamer.lnk" "$INSTDIR\FuturixRenamer.exe"
SectionEnd

