unit FormInGPs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables, ComCtrls,
  MPlayer, jpeg, Mask, DBCtrls, Grids, DBGrids, ADODB, Buttons,DM;

type
  TFormInGp = class(TForm)
    Panel: TPanel;
    TermButton: TButton;
    ComPort1: TComPort;
    ComTerminal: TComTerminal;
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
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
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
    procedure BitBtn1Click(Sender: TObject);
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
  FormInGp: TFormInGp;                                                               //10           13                         26
implementation

uses Seting;

{$R *.DFM}
//*************************************************************************
procedure TFormInGp.ComPort1AfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TFormInGp.ComPort1AfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;
//*****************************************************************************
procedure TFormInGp.TermButtonClick(Sender: TObject);
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

procedure TFormInGp.TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
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

procedure TFormInGp.ComTerminalBarcod(Sender: TObject; Buffer: String;
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
procedure TFormInGp.ComTerminalChar(Sender: TObject; Ch: Char);
begin
//Memo3.text:=Memo3.text+ch;
end;
//**************************************************************************
procedure TFormInGp.WriteStr(Mes_:String);
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
procedure TFormInGp.WriteStrTerm(Mes_:String);
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
procedure TFormInGp.Button7Click(Sender: TObject);
begin

end;
//**************************************************************************
procedure TFormInGp.FormShow(Sender: TObject);
begin
   dm1.ADOTableSaveLocation.open;
   dm1.TSeting.open;
   ComPort1.port:=dm1.TSetingPortG.asstring;
    //  ComTerminal.Connected := Not ComTerminal.Connected ;
    kk:=1;
end;

procedure TFormInGp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
   dm1.TSeting.close;
   dm1.ADOTableSaveLocation.close;
end;

procedure TFormInGp.Button1Click(Sender: TObject);
begin
FSeting.ShowModal
end;

procedure TFormInGp.Button2Click(Sender: TObject);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
end;

procedure TFormInGp.BitBtn1Click(Sender: TObject);
begin
dm1.ADOTableSaveLocation.Insert;
dm1.ADOTableSaveLocationLongitude.AsString:=Edit3.text;
dm1.ADOTableSaveLocationEWIndicator.AsString:=edit5.Text;
dm1.ADOTableSaveLocationLatitude.AsString:=Edit2.text;
dm1.ADOTableSaveLocationNSIndicator.AsString:=edit4.Text;
dm1.ADOTableSaveLocation.Post;
end;

end.
