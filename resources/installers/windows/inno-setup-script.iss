; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Project Islam Platform"
#define MyAppVersion "0.1"
#define MyAppPublisher "Project Islam Authors"
#define MyAppURL "http://www.icplusplus.com/"
#define MyAppExeName "project-islam.exe"
#define BaseLocation "C:\Users\Majid\Desktop\build\release"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{F4F3E6A2-5FD5-49B7-ABB6-BDA48BEDA15A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "{#BaseLocation}\project-islam.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\icudt51.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\icudt51.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\icuin51.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\icuuc51.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\libEGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\libGLESv2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Multimedia.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Network.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Sql.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\project-islam.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\upgrade-lc-now.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseLocation}\extensions\*"; DestDir: "{app}\extensions"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BaseLocation}\plugins\*"; DestDir: "{app}\plugins\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BaseLocation}\msvcp110.dll"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

