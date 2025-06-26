[Setup]
AppName=Sistema de Check-in AR Total Eventos
AppVersion=1.0.0
AppPublisher=AR Total Eventos
AppPublisherURL=https://artotaleventos.com.br
AppSupportURL=https://artotaleventos.com.br/suporte
AppUpdatesURL=https://artotaleventos.com.br/updates
DefaultDirName={autopf}\CheckinAR
DefaultGroupName=Sistema de Check-in AR
AllowNoIcons=yes
LicenseFile=..\LICENSE.txt
InfoBeforeFile=..\README.txt
OutputDir=..\build
OutputBaseFilename=CheckinAR-Setup-v1.0.0
SetupIconFile=..\frontend\public\icon-512x512.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1
Name: "startupicon"; Description: "Iniciar automaticamente com o Windows"; GroupDescription: "Opções de inicialização"; Flags: unchecked

[Files]
Source: "..\dist\checkin-ar-backend-win.exe"; DestDir: "{app}"; DestName: "CheckinAR.exe"; Flags: ignoreversion
Source: "..\backend\database\*"; DestDir: "{app}\database"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\backend\uploads\*"; DestDir: "{app}\uploads"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\scripts\start-checkin-ar.bat"; DestDir: "{app}"; DestName: "Iniciar.bat"; Flags: ignoreversion
Source: "..\README.md"; DestDir: "{app}"; DestName: "LEIAME.txt"; Flags: ignoreversion
Source: "..\frontend\public\icon-*.png"; DestDir: "{app}\assets"; Flags: ignoreversion

[Icons]
Name: "{group}\Sistema de Check-in AR Total Eventos - Cadastro"; Filename: "{app}\CheckinAR.exe"; WorkingDir: "{app}"; IconFilename: "{app}\assets\icon-512x512.png"
Name: "{group}\Iniciar Sistema"; Filename: "{app}\Iniciar.bat"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,Sistema de Check-in AR}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Sistema de Check-in AR Total Eventos - Cadastro"; Filename: "{app}\CheckinAR.exe"; WorkingDir: "{app}"; IconFilename: "{app}\assets\icon-512x512.png"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Sistema de Check-in AR"; Filename: "{app}\CheckinAR.exe"; WorkingDir: "{app}"; Tasks: quicklaunchicon

[Registry]
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "CheckinAR"; ValueData: "{app}\CheckinAR.exe"; Flags: uninsdeletevalue; Tasks: startupicon

[Run]
Filename: "{app}\CheckinAR.exe"; Description: "{cm:LaunchProgram,Sistema de Check-in AR}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}\database"
Type: filesandordirs; Name: "{app}\uploads"
Type: filesandordirs; Name: "{app}\logs"

[Code]
function GetUninstallString(): String;
var
  sUnInstPath: String;
  sUnInstallString: String;
begin
  sUnInstPath := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#SetupSetting("AppId")}_is1');
  sUnInstallString := '';
  if not RegQueryStringValue(HKLM, sUnInstPath, 'UninstallString', sUnInstallString) then
    RegQueryStringValue(HKCU, sUnInstPath, 'UninstallString', sUnInstallString);
  Result := sUnInstallString;
end;

function IsUpgrade(): Boolean;
begin
  Result := (GetUninstallString() <> '');
end;

function UnInstallOldVersion(): Integer;
var
  sUnInstallString: String;
  iResultCode: Integer;
begin
  Result := 0;
  sUnInstallString := GetUninstallString();
  if sUnInstallString <> '' then begin
    sUnInstallString := RemoveQuotes(sUnInstallString);
    if Exec(sUnInstallString, '/SILENT /NORESTART /SUPPRESSMSGBOXES','', SW_HIDE, ewWaitUntilTerminated, iResultCode) then
      Result := 3
    else
      Result := 2;
  end else
    Result := 1;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep=ssInstall) then
  begin
    if (IsUpgrade()) then
    begin
      UnInstallOldVersion();
    end;
  end;
end;

