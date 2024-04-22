unit TestForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables, ComCtrls,
  MPlayer, jpeg;

type
  TFormTestform1 = class(TForm)
    Panel: TPanel;
    TermButton: TButton;
    DataSource1: TDataSource;
    Table1: TTable;
    ComPort1: TComPort;
    ComTerminal: TComTerminal;
    Table1Sender: TStringField;
    Table1ComperData: TIntegerField;
    Table1Reception: TStringField;
    Table1CalCenter: TStringField;
    Table1Format: TIntegerField;
    Table1Porotocol: TIntegerField;
    Table1User: TStringField;
    Table1PassWord: TStringField;
    Table1MaxlineActive: TIntegerField;
    Table1LogFileOn: TStringField;
    Table1Port1: TStringField;
    Table1Port2: TStringField;
    Table1Port3: TStringField;
    Table1Port4: TStringField;
    Table1Port5: TStringField;
    Table1Port6: TStringField;
    Table1Port7: TStringField;
    Table1Port8: TStringField;
    Table1Port9: TStringField;
    Table1Port10: TStringField;
    Table1Port11: TStringField;
    Table1Port12: TStringField;
    Table1Port13: TStringField;
    Table1Port14: TStringField;
    Table1Port15: TStringField;
    Table1Port16: TStringField;
    Table1NoPort: TStringField;
    Table1CarierExplor: TIntegerField;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    Image2: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure TermButtonClick(Sender: TObject);
    procedure ComTerminalBarcod(Sender: TObject; Buffer: String;
      Count: Integer);
    procedure ComTerminalChar(Sender: TObject; Ch: Char);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
   { Public declarations }
   kk:integer;
   bitSize:integer;
   inpString:string;
   phoneNumber:string;
   Mes_SMS1:string;
   Mes_SMS2:string;
   FlagOkeyOpen:Boolean;
   procedure WriteStr(Mes_:String);
   procedure WriteStrTerm(Mes_:String);
   procedure TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
  end;

var
  FormTestform1: TFormTestform1;                                                               //10           13                         26
implementation

uses Seting;

{$R *.DFM}
//*************************************************************************
procedure TFormTestform1.ComPort1AfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TFormTestform1.ComPort1AfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;
//*****************************************************************************
procedure TFormTestform1.TermButtonClick(Sender: TObject);
begin
 ComTerminal.ShowSetupDialog;
end;
//*****************************************************************************
//*****************************************************************************
//*****************************************************************************
//****************************************************************************
//*************************************************************************
//**************************************************************************
//*************************************************************************
//**************************************************************************
//************************************************************
//*****************************************************************************

procedure TFormTestform1.TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
var ii,i:integer;
begin
ii:=0;
i:=1;
while (ii< ContToken - 1 ) and (buffer[i]<>chr(13))do
  begin
    if buffer[i]=',' then
     inc(ii);
     inc(i);
  end;
  Token:='';
  if (buffer[i]<>chr(13)) then
  while (buffer[i]<>',') and (buffer[i]<>chr(13))do
  begin
    Token:=Token+ buffer[i];
     inc(i);
  end;

end;

procedure TFormTestform1.ComTerminalBarcod(Sender: TObject; Buffer: String;
  Count: Integer);
VAR   COMMAND_:STRING;
Buffer2:string;
Token:string;
begin


edit1.Text:=Buffer;
Buffer2:=buffer;
Command_:=copy(buffer,0,6);
if command_ ='$GPGGA' then
 begin
  TokenNumberGPS(buffer2,3,Token);
  edit2.Text:=Token;
  TokenNumberGPS(buffer2,4,Token);
  edit4.Text:=Token;
  TokenNumberGPS(buffer2,5,Token);
  edit3.Text:=Token;
  TokenNumberGPS(buffer2,6,Token);
  edit5.Text:=Token;

 end;
//Memo4.text:=Memo4.text+'#'+Buffer;
end;
//*****************************************************************************
procedure TFormTestform1.ComTerminalChar(Sender: TObject; Ch: Char);
begin
//Memo3.text:=Memo3.text+ch;
end;
//**************************************************************************
procedure TFormTestform1.WriteStr(Mes_:String);
var i,k:integer;
begin
i:=1;
k:=length(Mes_);
while i<=k do
begin
  ComTerminal.KeyPress2(Mes_[i]);
  inc(i);
end;
ComTerminal.KeyPress2(chr(13));
//ComTerminal.KeyPress2(chr(10));
Sleep(100);
end;
//**************************************************************************
procedure TFormTestform1.WriteStrTerm(Mes_:String);
var i,k:integer;
begin
i:=1;
k:=length(Mes_);
while i<=k do
begin
  ComTerminal.KeyPress2(Mes_[i]);
  inc(i);
end;
ComTerminal.KeyPress2(chr(26));
//ComTerminal.KeyPress2(chr(13));
//ComTerminal.KeyPress2(chr(10));
Sleep(100);
end;
//**************************************************************************
procedure TFormTestform1.Button7Click(Sender: TObject);
begin

end;
//**************************************************************************
procedure TFormTestform1.FormShow(Sender: TObject);
begin
   Table1.open;
   ComPort1.port:=Table1port1.asstring;
 //  ComTerminal.Connected := Not ComTerminal.Connected ;
    kk:=1;
end;

procedure TFormTestform1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
   Table1.close;
end;

procedure TFormTestform1.Button1Click(Sender: TObject);
begin
FSeting.ShowModal
end;

procedure TFormTestform1.Button2Click(Sender: TObject);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
end;

procedure TFormTestform1.Timer1Timer(Sender: TObject);
begin
//MediaPlayer1.Play
end;

end.
