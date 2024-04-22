unit FDelta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables, ComCtrls,
  MPlayer, jpeg, Grids, DBGrids, ADODB,dm;

type
  TFormDelta = class(TForm)
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
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    Image2: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    Image3: TImage;
    Timer3: TTimer;
    Button3: TButton;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit15: TEdit;
    Edit14: TEdit;
    Button4: TButton;
    Image4: TImage;
    Label8: TLabel;
    Edit17: TEdit;
    Label9: TLabel;
    Edit16: TEdit;
    RadioGroup1: TRadioGroup;
    Button5: TButton;
    Button6: TButton;
    DBGrid1: TDBGrid;
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
    procedure Timer3Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
   procedure SetLocationPEN(var X,Y:integer);
   procedure GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
  end;

var
  FormDelta: TFormDelta;                                                               //10           13                         26
implementation

uses Seting;

{$R *.DFM}
//*************************************************************************
procedure TFormDelta.ComPort1AfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TFormDelta.ComPort1AfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;
//*****************************************************************************
procedure TFormDelta.TermButtonClick(Sender: TObject);
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

procedure TFormDelta.TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
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

procedure TFormDelta.ComTerminalBarcod(Sender: TObject; Buffer: String;
  Count: Integer);
VAR   COMMAND_:STRING;
Buffer2:string;
Token1,Token2,Token3,Token4,Token5:string;
begin


edit1.Text:=Buffer;
Buffer2:=buffer;
Command_:=copy(buffer,0,6);
if command_ ='$GPGGA' then
 begin
  token2:='';token4:=''; token3:=''; token5:='';
  TokenNumberGPS(buffer2,3,Token2);
  TokenNumberGPS(buffer2,4,Token4);
  TokenNumberGPS(buffer2,5,Token3);
  TokenNumberGPS(buffer2,6,Token5);
//  if (token2<>'' ) and(token4<>'' ) and (token3<>'' ) and (token5<>'' ) then
  begin
   edit2.Text:=Token2;
   edit4.Text:=Token4;
   edit3.Text:=Token3;
   edit5.Text:=Token5;
  end;
 end;
//Memo4.text:=Memo4.text+'#'+Buffer;
end;
//*****************************************************************************
procedure TFormDelta.ComTerminalChar(Sender: TObject; Ch: Char);
begin
//Memo3.text:=Memo3.text+ch;
end;
//**************************************************************************
procedure TFormDelta.WriteStr(Mes_:String);
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
procedure TFormDelta.WriteStrTerm(Mes_:String);
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
procedure TFormDelta.Button7Click(Sender: TObject);
begin


end;
//**************************************************************************
procedure TFormDelta.FormShow(Sender: TObject);
begin
//   ComTerminal.Connected := Not ComTerminal.Connected ;
   dm1.ADOTableDelta.open;
   dm1.TSeting.open;
   ComPort1.port:=dm1.TSetingPortG.asstring;
 //  ComTerminal.Connected := Not ComTerminal.Connected ;
    kk:=1;
end;

procedure TFormDelta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Timer3.Enabled:=false;
   ComTerminal.Connected := Not ComTerminal.Connected ;
   dm1.TSeting.close;
   dm1.ADOTableDelta.close;

end;

procedure TFormDelta.Button1Click(Sender: TObject);
begin
FSeting.ShowModal
end;

procedure TFormDelta.Button2Click(Sender: TObject);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
end;

procedure TFormDelta.GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
begin
 LoDeg:=strtofloat(copy(Lo,1,3))+(strtofloat(copy(Lo,4,7))/ 60);
 LaDeg:=strtofloat(copy(La,1,2))+(strtofloat(copy(La,3,7))/ 60);
end;

procedure TFormDelta.SetLocationPEN(var X,Y:integer);
var LoDeg,LaDeg:real;
DeltaLo1_3,DeltaLa1_3:real;
Y3,X3,DeltaX1_3,DeltaY1_3:integer;
begin
if (length(edit3.Text) = 10) and (length(edit2.Text)=9) then
begin
 GPSToDeg(Edit3.text,edit2.Text,LoDeg,LaDeg);

 DeltaLo1_3:=abs( Dm1.ADOTableDeltaLo1Deg.AsFloat  - LoDeg )* 1000;
 DeltaLa1_3:=abs( Dm1.ADOTableDeltaLa1Deg.AsFloat  - LaDeg )* 1000;
 DeltaX1_3:= Round((round(DeltaLo1_3) * Dm1.ADOTableDeltaDX.Asinteger)/ round(Dm1.ADOTableDeltaDLo.AsFloat*1000));
 DeltaY1_3:= Round((round(DeltaLa1_3) * Dm1.ADOTableDeltaDY.Asinteger)/ round(Dm1.ADOTableDeltaDLa.AsFloat*1000));
 if Dm1.ADOTableDeltaLo1Deg.AsFloat  < LoDeg then
     X3:=Dm1.ADOTableDeltaX1.Asinteger + DeltaX1_3
 else X3:=Dm1.ADOTableDeltaX1.Asinteger - DeltaX1_3;

  if Dm1.ADOTableDeltaLa1Deg.AsFloat  < LaDeg then
     Y3:=Dm1.ADOTableDeltaY1.Asinteger - DeltaY1_3
 else Y3:=Dm1.ADOTableDeltaY1.Asinteger + DeltaY1_3 ;
 X:=X3;
 Y:=Y3;

{X:= Round(((LoDeg *1000) * Dm1.ADOTableDeltaX1.Asinteger)/ (Dm1.ADOTableDeltaLo1Deg.AsFloat*1000));
 Y:= Round(((LaDeg *1000) * Dm1.ADOTableDeltaY1.Asinteger)/ (Dm1.ADOTableDeltaLa1Deg.AsFloat*1000));
}

end
else
  begin
   x:=0;
   y:=0;
  end; 
end;

procedure TFormDelta.Timer3Timer(Sender: TObject);
var X,Y:integer;
begin

 SetLocationPEN(X,Y);
 Image3.Top:=Y;
 Image3.Left:=X;
 Image3.Visible:= not Image3.Visible;
end;

procedure TFormDelta.Button3Click(Sender: TObject);
begin
Panel2.Visible:=true;
edit12.Text:=edit2.Text;
edit14.Text:=edit4.Text;
edit13.Text:=edit3.Text;
edit15.Text:=edit5.Text;

loadkeyboardlayout('00000429',klf_activate);
end;

procedure TFormDelta.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
edit16.Text:=inttostr(x);
edit17.Text:=inttostr(Y);
end;

procedure TFormDelta.Button4Click(Sender: TObject);
begin

// tool

dm1.ADOTableDelta.edit;
case RadioGroup1.ItemIndex of
0: begin
{     dm1.ADOTableDeltaLo1.Asstring:=Edit13.text;
     dm1.ADOTableDeltaLa1.Asstring:=edit12.Text;
}
     dm1.ADOTableDeltaX1.Asinteger:=strtoint(Edit16.text);
     dm1.ADOTableDeltaY1.Asinteger:=strtoint(edit17.Text);

   end;
1: begin
{     dm1.ADOTableDeltaLo2.Asstring:=Edit13.text;
     dm1.ADOTableDeltaLa2.Asstring:=edit12.Text;
}
     dm1.ADOTableDeltaX2.Asinteger:=strtoint(Edit16.text);
     dm1.ADOTableDeltaY2.Asinteger:=strtoint(edit17.Text);

   end;
2: begin
     dm1.ADOTableDeltaMapLo1.Asstring:=Edit13.text;
     dm1.ADOTableDeltaMapLa1.Asstring:=edit12.Text;
     dm1.ADOTableDeltaMapX1.Asinteger:=strtoint(Edit16.text);
     dm1.ADOTableDeltaMapY1.Asinteger:=strtoint(edit17.Text);

   end;
3: begin
     dm1.ADOTableDeltaMapLo2.Asstring:=Edit13.text;
     dm1.ADOTableDeltaMapLa2.Asstring:=edit12.Text;
     dm1.ADOTableDeltaMapX2.Asinteger:=strtoint(Edit16.text);
     dm1.ADOTableDeltaMapY2.Asinteger:=strtoint(edit17.Text);

   end;
end;
dm1.ADOTableDelta.Post;

Panel2.Visible:=false;

end;

procedure TFormDelta.Button5Click(Sender: TObject);
begin
Panel2.Visible:=false;
end;

procedure TFormDelta.Button6Click(Sender: TObject);
var k:string;
begin

dm1.ADOTableDelta.edit;

k:=dm1.ADOTableDeltaLo1.AsString;
dm1.ADOTableDeltaLo1Deg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);
k:=dm1.ADOTableDeltaLa1.AsString;
dm1.ADOTableDeltaLa1Deg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);
k:=dm1.ADOTableDeltaLo2.AsString;
dm1.ADOTableDeltaLo2Deg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);
k:=dm1.ADOTableDeltaLa2.AsString;
dm1.ADOTableDeltaLa2Deg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);

k:=dm1.ADOTableDeltaMapLo1.AsString;
dm1.ADOTableDeltaMapLo1Deg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);
k:=dm1.ADOTableDeltaMapLa1.AsString;
dm1.ADOTableDeltaMapLa1Deg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);
k:=dm1.ADOTableDeltaMapLo2.AsString;
dm1.ADOTableDeltaMapLo2Deg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);
k:=dm1.ADOTableDeltaMapLa2.AsString;
dm1.ADOTableDeltaMapLa2Deg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);


Dm1.ADOTableDeltaDLo.AsFloat:=  abs( Dm1.ADOTableDeltaLo1Deg.AsFloat  - Dm1.ADOTableDeltaLo2Deg.AsFloat );
Dm1.ADOTableDeltaDLa.AsFloat:=  abs( Dm1.ADOTableDeltaLa1Deg.AsFloat  - Dm1.ADOTableDeltaLa2Deg.AsFloat );

Dm1.ADOTableDeltaDX.AsFloat:=  abs( Dm1.ADOTableDeltaX1.Asinteger  - Dm1.ADOTableDeltaX2.Asinteger );
Dm1.ADOTableDeltaDY.AsFloat:=  abs( Dm1.ADOTableDeltaY1.Asinteger  - Dm1.ADOTableDeltaY2.Asinteger );


Dm1.ADOTableDeltaMapDLo.AsFloat:=  abs( Dm1.ADOTableDeltaMapLo1.AsFloat  - Dm1.ADOTableDeltaMapLo2.AsFloat );
Dm1.ADOTableDeltaMapDLa.AsFloat:=  abs( Dm1.ADOTableDeltaMapLa1.AsFloat  - Dm1.ADOTableDeltaMapLa2.AsFloat );

Dm1.ADOTableDeltaMapDX.AsFloat:=  abs( Dm1.ADOTableDeltaMapX1.AsFloat  - Dm1.ADOTableDeltaMapX2.AsFloat );
Dm1.ADOTableDeltaMapDY.AsFloat:=  abs( Dm1.ADOTableDeltaMapY1.AsFloat  - Dm1.ADOTableDeltaMapY2.AsFloat );

dm1.ADOTableDelta.Post;
end;

end.
