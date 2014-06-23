; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!
#define ServerURL "vista.villanova.chirp.hiti.us"

[Setup]
AppName=VistA-Astronaut-TMG-CPRSChart
AppVersion=1.0.27.90
;;;;;;;;;;;;;;;; change here ;;;;;;;;;;;;;;;;;;;;;;;;;;;
OutputBaseFilename = Setup-VistA-Astronaut-TMG-CPRSChart  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AppComments=VistA-Astronaut-TMG-CPRSChart
DefaultDirName={pf}\VistA-Astronaut
DefaultGroupName=VistA-Astronaut
UninstallDisplayIcon={app}\VistA-Astronaut-TMG-CPRSChart.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:InnoSetup-Output\vista\villanova
AppPublisher=Astronaut, LLC
AppPublisherURL=http://astronautvista.com/
CreateUninstallRegKey = Yes
Uninstallable=not IsTaskSelected('portablemode')

[Dirs]
Name: "{pf}\VistA-Astronaut"

[Files]
Source: "CPRSChart.exe"; DestDir: "{app}"; BeforeInstall: CreateCPRSChartCMD()
Source: "borlndmm.dll"; DestDir: "{app}"
Source: "qtintf70.dll"; DestDir: "{app}"
;Source: "ShiftHandoffTool.exe"; DestDir: "{app}"; BeforeInstall: CreateShiftHandOffToolCMD()
Source: "CRHD.hlp"; DestDir: "{app}"

[UninstallDelete]
Type: files; Name: "{app}\CPRSChart.cmd"
;Type: files; Name: "{app}\ShiftHandoffTool.cmd"
Type: filesandordirs; Name: "{pf}\VistA-Astronaut"

[Icons]
Name: "{group}\VistA-Astronaut-TMG-CPRSChart"; Filename: "{app}\CPRSChart.cmd"; WorkingDir: "{app}"
Name: "{commondesktop}\VistA-Astronaut-TMG-CPRSChart"; Filename: "{app}\CPRSChart.cmd"; WorkingDir: "{app}"; Tasks: desktopicon
;Name: "{group}\VistA-Astronaut-ShiftHandoffTool"; Filename: "{app}\ShiftHandoffTool.cmd"; WorkingDir: "{app}"
;Name: "{commondesktop}\VistA-Astronaut-TMG-ShiftHandoffTool"; Filename: "{app}\ShiftHandoffTool.cmd"; WorkingDir: "{app}"; Tasks: desktopicon

;change here
[Messages]
BeveledLabel=Server Connection: {#ServerURL}

[CustomMessages]
CreateDesktopIcon=Create a &desktop icon

[Tasks]
Name: desktopicon; Description: "{cm:CreateDesktopIcon}"
Name: portablemode; Description: "Portable Mode"; Flags: unchecked

[Code]
const
  ServerAddress = '{#ServerURL}';
 
var
  ErrorCode: Integer;
  InsertCommand: String;
  AppPath: String;
  HITIComment: String;
  

procedure CreateCPRSChartCMD();  
begin
  AppPath := ExpandConstant('{app}\CPRSChart.cmd')
  InsertCommand := 'START CPRSChart.exe s="' + ExpandConstant(ServerAddress) + '" p=9260'
  HITIComment := ':: CPRSChart.cmd published by HIT Institute';
  SaveStringToFile(AppPath, HITIComment + #13#10 + InsertCommand + #13#10, False);
end;

procedure CreateShiftHandOffToolCMD();  
begin
  AppPath := ExpandConstant('{app}\ShiftHandoffTool.cmd')
  InsertCommand := 'START ShiftHandoffTool.exe s="' + ExpandConstant(ServerAddress) + '" p=9260'
  HITIComment := ':: ShiftHandoffTool.cmd published by HIT Institute';
  SaveStringToFile(AppPath, HITIComment + #13#10 + InsertCommand + #13#10, False);
end;
