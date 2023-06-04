unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, ShellAPI, IniFiles;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;
    Button4: TButton;
    GroupBox4: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Button5: TButton;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label7: TLabel;
    Button8: TButton;
    Button9: TButton;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    GroupBox5: TGroupBox;
    CheckBox10: TCheckBox;
    Button10: TButton;
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    procedure OnProcStart;
    procedure CheckConflict;
    procedure ConfigRead;
    procedure ConfigWrite;
  public
    { Public declarations }
  end;
  WaitForEnd = class(TThread)
  private
    procedure OnProcEnd;
    procedure Update;
    procedure CustomProc;
  protected
    procedure Execute; override;
  end;

var
  Form1: TForm1;
  exeinf: TShellExecuteInfo;
  isActive: Boolean;
  pfn, pdn: PChar;
  pr, aff: Dword;

implementation

{$R *.dfm}

procedure WaitForEnd.Execute;
begin
  if ShellExecuteEx(@exeinf) then
  begin
    isActive:=true;
    Synchronize(Update);
    Synchronize(CustomProc);
    WaitforSingleObject(exeinf.hProcess, INFINITE);
    CloseHandle(exeinf.hProcess);
    isActive:=false;
    Synchronize(Update);
    Synchronize(OnProcEnd);
  end;
end;

procedure WaitForEnd.Update;
begin
  if isactive then
    Form1.Button5.Caption:='Break'
  else
    Form1.Button5.Caption:='Launch';
end;

procedure WaitForEnd.OnProcEnd;
var
  reg: TRegistry;
begin
  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    reg.DeleteKey('Software\Microsoft\Direct3D\Application0');
  finally
    reg.Free;
  end;
  FreeMem(pfn);
  FreeMem(pdn);
end;

procedure WaitForEnd.CustomProc;
begin
  if Form1.CheckBox3.Checked then
  begin
    SetPriorityClass(exeinf.hProcess, pr);
    SetProcessAffinityMask(exeinf.hProcess, aff);
  end;
end;

procedure TForm1.OnProcStart;
var
  fn, dn: AnsiString;
  fll, dflu: Integer;
  reg: TRegistry;
  cpuset: set of 0..31;
begin
  fn:=Edit1.Text;
  GetMem(pfn, Length(fn) + 1);
  StrPLCopy(pfn, fn, Length(fn) + 1);
  dn:=Edit2.Text;
  GetMem(pdn, Length(dn) + 1);
  StrPLCopy(pdn, dn, Length(dn) + 1);
  if CheckBox1.Checked = true then
  begin
    case ComboBox1.ItemIndex of
      0:fll:=0;
      1:fll:=StrToInt('$9100');
      2:fll:=StrToInt('$9200');
      3:fll:=StrToInt('$9300');
      4:fll:=StrToInt('$a000');
      5:fll:=StrToInt('$a100');
      6:fll:=StrToInt('$b000');
      7:fll:=StrToInt('$b100');
    else
      fll:=0;
    end;
    if CheckBox2.Checked then
      dflu:=1
    else
      dflu:=0;
    reg:=TRegistry.Create;
    try
      reg.RootKey:=HKEY_CURRENT_USER;
      reg.OpenKey('Software\Microsoft\Direct3D\Application0', true);
      reg.WriteString('Name', fn);
      reg.WriteString('D3DBehaviors', 'FeatureLevelLimit='+IntToStr(fll)+';ForceWARP=1;DisableFLUpgrade='+IntToStr(dflu));
    finally
      reg.Free;
    end;
  end;
    FillChar(exeinf,SizeOf(exeinf), 0);
    with exeinf do
    begin
      cbSize:=SizeOf(exeinf);
      fMask:=SEE_MASK_NOCLOSEPROCESS;
      lpFile:=pfn;
      lpDirectory:=pdn;
      nShow:=SW_SHOWNORMAL;
    end;
    if CheckBox3.Checked then
    begin
      case Combobox2.ItemIndex of
        0:pr:=$00000100;
        1:pr:=$00000080;
        2:pr:=$00008000;
        3:pr:=$00000020;
        4:pr:=$00004000;
        5:pr:=$00000040;
      else
        pr:=$00000020;
      end;
      cpuset:=[];
      if CheckBox11.Checked then
        include(cpuset,0);
      if CheckBox12.Checked then
        include(cpuset,1);
      if CheckBox13.Checked then
        include(cpuset,2);
      if CheckBox14.Checked then
        include(cpuset,3);
      if CheckBox15.Checked then
        include(cpuset,4);
      if CheckBox16.Checked then
        include(cpuset,5);
      if CheckBox17.Checked then
        include(cpuset,6);
      if CheckBox18.Checked then
        include(cpuset,7);
      aff:=Dword(cpuset);
    end;
  WaitForEnd.Create(false);
end;

procedure TForm1.CheckConflict;
begin
  Button1.Enabled:=true;
  Button2.Enabled:=true;
  Button6.Enabled:=true;
  Button7.Enabled:=true;
  Button8.Enabled:=true;
  Button9.Enabled:=true;
  if FileExists('wined3d.dll') then
  begin
    Button1.Enabled:=false;
    Button2.Enabled:=false;
    Button8.Enabled:=false;
    Button9.Enabled:=false;
  end;
  if (FileExists('d3d8.dll') or FileExists('d3d9.dll')) and not FileExists('wined3d.dll') then
  begin
    Button6.Enabled:=false;
    Button7.Enabled:=false;
  end;
end;

procedure TForm1.ConfigRead;
var
  ini: Tinifile;
begin
  ini:=TiniFile.Create(extractfilepath(paramstr(0))+'L-play\conf.ini');
  Edit1.Text:=ini.ReadString('Main', 'FileName', 'DELTARUNE.exe');
  Edit2.Text:=ini.ReadString('Main', 'WorkDirectory', GetCurrentDir);
  CheckBox1.Checked:=ini.ReadBool('WARP', 'Enable', false);
  ComboBox1.ItemIndex:=ini.ReadInteger('WARP', 'FeatureLevelLimit', 0);
  CheckBox2.Checked:=ini.ReadBool('WARP', 'DisableFeatureLevelUpgrade', false);
  CheckBox3.Checked:=ini.ReadBool('CPU', 'Enable', false);
  ComboBox2.ItemIndex:=ini.ReadInteger('CPU', 'Priority', 3);
  CheckBox11.Checked:=ini.ReadBool('CPU', 'Core0', true);
  CheckBox12.Checked:=ini.ReadBool('CPU', 'Core1', true);
  CheckBox13.Checked:=ini.ReadBool('CPU', 'Core2', true);
  CheckBox14.Checked:=ini.ReadBool('CPU', 'Core3', true);
  CheckBox15.Checked:=ini.ReadBool('CPU', 'Core4', true);
  CheckBox16.Checked:=ini.ReadBool('CPU', 'Core5', true);
  CheckBox17.Checked:=ini.ReadBool('CPU', 'Core6', true);
  CheckBox18.Checked:=ini.ReadBool('CPU', 'Core7', true);
  ini.Free;
end;

procedure TForm1.ConfigWrite;
var
  ini: TIniFile;
begin
  ini:=TiniFile.Create(extractfilepath(paramstr(0))+'L-play\conf.ini');
  ini.WriteString('Main', 'FileName', Edit1.Text);
  ini.WriteString('Main', 'WorkDirectory', Edit2.Text);
  ini.WriteBool('WARP', 'Enable', CheckBox1.Checked);
  ini.WriteInteger('WARP', 'FeatureLevelLimit', ComboBox1.ItemIndex);
  ini.WriteBool('WARP', 'DisableFeatureLevelUpgrade', CheckBox2.Checked);
  ini.WriteBool('CPU', 'Enable', CheckBox3.Checked);
  ini.WriteInteger('CPU', 'Priority', ComboBox2.ItemIndex);
  ini.WriteBool('CPU', 'Core0', CheckBox11.Checked);
  ini.WriteBool('CPU', 'Core1', CheckBox12.Checked);
  ini.WriteBool('CPU', 'Core2', CheckBox13.Checked);
  ini.WriteBool('CPU', 'Core3', CheckBox14.Checked);
  ini.WriteBool('CPU', 'Core4', CheckBox15.Checked);
  ini.WriteBool('CPU', 'Core5', CheckBox16.Checked);
  ini.WriteBool('CPU', 'Core6', CheckBox17.Checked);
  ini.WriteBool('CPU', 'Core7', CheckBox18.Checked);
  ini.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if isActive then
    TerminateProcess(exeinf.hProcess, 0)
  else
  begin
    OnProcStart;
    ConfigWrite;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ConfigRead;
  CheckConflict;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not CopyFile('L-play\SwiftShader\d3d9.dll', 'd3d9.dll', false) then
    ShowMessage('Error!');
  CheckConflict;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DeleteFile('d3d9.dll');
  CheckConflict;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if not CopyFile('L-play\D3D8to9\d3d8.dll', 'd3d8.dll', false) then
    ShowMessage('Error!');
  CheckConflict
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  DeleteFile('d3d8.dll');
  CheckConflict
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if not CopyFile('L-play\WineD3D\wined3d.dll', 'wined3d.dll', false) then
    ShowMessage('Error!');
  if CheckBox4.Checked then
    if not CopyFile('L-play\WineD3D\dxgi.dll', 'dxgi.dll', false) then
      ShowMessage('Error!');
  if CheckBox5.Checked then
    if not CopyFile('L-play\WineD3D\ddraw.dll', 'ddraw.dll', false) then
      ShowMessage('Error!');
  if CheckBox6.Checked then
    if not CopyFile('L-play\WineD3D\d3d8.dll', 'd3d8.dll', false) then
      ShowMessage('Error!');
  if CheckBox7.Checked then
    if not CopyFile('L-play\WineD3D\d3d9.dll', 'd3d9.dll', false) then
      ShowMessage('Error!');
  if CheckBox8.Checked then
  begin
    if not CopyFile('L-play\WineD3D\d3d10.dll', 'd3d10.dll', false) then
      ShowMessage('Error!');
    if not CopyFile('L-play\WineD3D\d3d10core.dll', 'd3d10core.dll', false) then
      ShowMessage('Error!');
    if not CopyFile('L-play\WineD3D\d3d10_1.dll', 'd3d10_1.dll', false) then
      ShowMessage('Error!');
  end;
  if CheckBox9.Checked then
    if not CopyFile('L-play\WineD3D\d3d11.dll', 'd3d11.dll', false) then
      ShowMessage('Error!');
  CheckConflict
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  DeleteFile('wined3d.dll');
  DeleteFile('dxgi.dll');
  DeleteFile('ddraw.dll');
  DeleteFile('d3d8.dll');
  DeleteFile('d3d9.dll');
  DeleteFile('d3d10.dll');
  DeleteFile('d3d10core.dll');
  DeleteFile('d3d10_1.dll');
  DeleteFile('d3d11.dll');
  CheckConflict;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not CopyFile('L-play\Mesa3D\opengl32.dll', 'opengl32.dll', false) then
    ShowMessage('Error!');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DeleteFile('opengl32.dll');
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  min: Integer;
begin
  if CheckBox10.Checked then
    min:=11
  else
    min:=1;
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(ParamStr(0))+'L-play\MemReduct\memreduct.exe'), nil, nil, min);
end;

end.
