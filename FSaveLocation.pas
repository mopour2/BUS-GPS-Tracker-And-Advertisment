unit FSaveLocation;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables, ComCtrls,
  MPlayer, jpeg, Grids, DBGrids, ADODB,dm, DBCtrls;

type
  RecGps= record
   LO:string;
   La:string;
  end;

  TFormSaveLocation = class(TForm)
    ComPort1: TComPort;
    ComTerminal: TComTerminal;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit15: TEdit;
    Edit14: TEdit;
    Edit10: TEdit;
    Button4: TButton;
    Button5: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Panel: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Image4: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Timer3: TTimer;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    Edit8: TEdit;
    Edit9: TEdit;
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure ComTerminalBarcod(Sender: TObject; Buffer: String;
      Count: Integer);
    procedure ComTerminalChar(Sender: TObject; Ch: Char);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer3Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
   procedure FarsiEnter(Sender: TObject);
   procedure ENGlEnter(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);

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
 Lo1Deg:real;
 La1Deg:real;
 DX:integer;
 DLo:real;
 DY:integer;
 DLa:real;
 X1:integer;
 Y1:integer;
   CountShowMap:integer;
   RingList1:array [1..20] of RecGps;
   LastLo,LastLa:string;
   Qend:integer;
   procedure WriteStr(Mes_:String);
   procedure WriteStrTerm(Mes_:String);
   procedure TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
   procedure SetLocationPEN(var X,Y:integer;var LoDeg,LaDeg:real);
   procedure GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
   procedure addRing(Token3:string;Token2:string);
   procedure GetDirect(var DILo:integer;var DILa:integer);

  end;

var
  FormSaveLocation: TFormSaveLocation;                                                               //10           13                         26
implementation

uses Seting, Manu;

{$R *.DFM}
procedure TFormSaveLocation.GetDirect(var DILo:integer;var DILa:integer);
var Dlo,Dla:real;
 lo1,la1,lo2,la2:real;
 loS1,laS1,loS2,laS2:String;
begin
 if Qend<>0 then
 begin
  if Qend>5 then
   BEGIN
     loS1:=RingList1[1].LO ;
     LaS1:=RingList1[1].La ;
     loS2:=RingList1[Qend].LO;
     laS2:=RingList1[Qend].La;
   end
  else
    BEGIN
     loS1:=RingList1[9].LO ;
     LaS1:=RingList1[9].La ;
     loS2:=RingList1[Qend].LO;
     laS2:=RingList1[Qend].La;
   end;
  if (length(Los1) >= 10) and (length(LaS1)>=9) then
   GPSToDeg(LoS1,LaS1, Lo1,La1);
  if (length(Los2) >= 10) and (length(LaS2)>=9) then
   GPSToDeg(LoS2,LaS2, Lo2,La2);

   Dlo:=LO2 - LO1 ;
   Dla:=La2 - La1 ;

 if Dlo >=0 then
  DILo:=1
 Else DILo:=-1;

 if Dla >=0 then
  DILa:=1
 Else DILa:=-1;
 end
 else
  begin
    DILo:=0;
    DIla:=0;
  end
end;

procedure TFormSaveLocation.addRing(Token3:string;Token2:string);
begin
 if Qend<>0 then
 begin
   if (copy(RingList1[Qend].Lo,1,8)=copy(token3,1,8)) and (copy(RingList1[Qend].Lo,1,7)=copy(token2,1,7)) then
   exit
   else
   begin
    if QEnd < 10  then
    begin
      Qend:=Qend+1;
    end
    else Qend:=1;
    RingList1[Qend].LO:=Token3;
    RingList1[Qend].La:=Token2;
   end;
 end
 else
 begin
    if QEnd < 10  then
    begin
      Qend:=Qend+1;
    end
    else Qend:=1;
    RingList1[Qend].LO:=Token3;
    RingList1[Qend].La:=Token2;
 end;
end;
//*************************************************************************
procedure TFormSaveLocation.ComPort1AfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TFormSaveLocation.ComPort1AfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;
//*****************************************************************************
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

procedure TFormSaveLocation.TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
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

procedure TFormSaveLocation.ComTerminalBarcod(Sender: TObject; Buffer: String;
  Count: Integer);
VAR   COMMAND_:STRING;
Buffer2:string;
Token1,Token2,Token3,Token4,Token5:string;
d:tdatetime;
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

    if (token2<>'' ) and (token3<>'' ) then
     addRing(Token3,Token2);

   if CheckBox2.Checked=true then
   begin

     DM1.ADOTLogWaytest.Insert;
     DM1.ADOTLogWaytestLo.AsString:=Token3;
     DM1.ADOTLogWaytestLa.AsString:=Token2;
     DM1.ADOTLogWaytestDate1.AsString:=DateToStr(Date);
     DM1.ADOTLogWaytestTime1.asstring:=TimeToStr(Time);
     DM1.ADOTLogWaytestCodCity.AsInteger:=FMenu.MainCodCity;
     DM1.ADOTLogWaytestNumberLine.AsInteger:=1;
     DM1.ADOTLogWayTestNoCar.asstring:='0';
     DM1.ADOTLogWaytest.post;
   end;

  end;
 end;
//Memo4.text:=Memo4.text+'#'+Buffer;
end;
//*****************************************************************************
procedure TFormSaveLocation.ComTerminalChar(Sender: TObject; Ch: Char);
begin
//Memo3.text:=Memo3.text+ch;
end;
//**************************************************************************
procedure TFormSaveLocation.WriteStr(Mes_:String);
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
procedure TFormSaveLocation.WriteStrTerm(Mes_:String);
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
procedure TFormSaveLocation.Button7Click(Sender: TObject);
begin

end;
//**************************************************************************
procedure TFormSaveLocation.FormShow(Sender: TObject);
begin

  Qend:=0;

  Left:=0;
  Top:=0;
    timer3.Enabled:=true;
    kk:=1;
 dm1.ADOTLogWaytest.open;
 dm1.ADOTableDelta.open;
 dm1.ADOTableDelta.Filter:='codCity='+inttostr(FMenu.MainCodCity);
 dm1.ADOTableDelta.Filtered:=true;

 Image2.Picture.LoadFromFile(FMenu.PathMap+FMenu.MapName);
 Image2.Height:=FMenu.Wi;
 Image2.Width:=FMenu.Wi;

 dm1.ADOTableSaveLocation.open;
// DM1.ADOTableSaveLocation.IndexName:='index_X';
 dm1.ADOTableSaveLocation.filter:='codCity='+inttostr(FMenu.MainCodCity);
 dm1.ADOTableSaveLocation.Filtered:=true;

 dm1.TSeting.open;
 ComPort1.port:=dm1.TSetingPortG.asstring;

 Lo1Deg:= Dm1.ADOTableDeltaLo1Deg.AsFloat;
 La1Deg:=Dm1.ADOTableDeltaLa1Deg.AsFloat;
 DX:=Dm1.ADOTableDeltaDX.Asinteger;
 DLo:=Dm1.ADOTableDeltaDLo.AsFloat;
 DY:=Dm1.ADOTableDeltaDY.Asinteger;
 DLa:=Dm1.ADOTableDeltaDLa.AsFloat;
 X1:=Dm1.ADOTableDeltaX1.Asinteger;
 Y1:=Dm1.ADOTableDeltaY1.Asinteger;

 dm1.ADOTableDelta.close;

 ComTerminal.Connected := Not ComTerminal.Connected ;


end;

procedure TFormSaveLocation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   timer3.Enabled:=false;
   ComTerminal.Connected := Not ComTerminal.Connected ;
   dm1.TSeting.close;
   dm1.ADOTableSaveLocation.close;
   dm1.ADOTLogWaytest.close;
end;

procedure TFormSaveLocation.GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
begin
 LoDeg:=strtofloat(copy(Lo,1,3))+(strtofloat(copy(Lo,4,7))/ 60);
 LaDeg:=strtofloat(copy(La,1,2))+(strtofloat(copy(La,3,7))/ 60);
end;

procedure TFormSaveLocation.SetLocationPEN(var X,Y:integer;var LoDeg,LaDeg:real);
var DeltaLo1_3,DeltaLa1_3:real;
Y3,X3,DeltaX1_3,DeltaY1_3:integer;
begin
if (length(edit3.Text) >= 10) and (length(edit2.Text)>=9) then
begin
 GPSToDeg(Edit3.text,edit2.Text,LoDeg,LaDeg);

 DeltaLo1_3:=abs( Lo1Deg  - LoDeg )* 1000000;
 DeltaLa1_3:=abs( La1Deg  - LaDeg )* 1000000;
 DeltaX1_3:= Round((round(DeltaLo1_3) * DX)/ round(DLo * 1000000));
 DeltaY1_3:= Round((round(DeltaLa1_3) * DY)/ round(DLa * 1000000));
 if Lo1Deg  < LoDeg then
     X3:= X1 + DeltaX1_3
 else X3:= X1 - DeltaX1_3;

  if La1Deg  < LaDeg then
     Y3:= Y1 - DeltaY1_3
 else Y3:= Y1 + DeltaY1_3 ;
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

procedure TFormSaveLocation.Timer3Timer(Sender: TObject);
var X,Y:integer;
 LoDeg,LaDeg:real;
 KeyRec:integer;

  tempTime,d:tdatetime;
 temp2,Hour, Min, Sec, MSec:Word;

 begin
timer3.Enabled:=false;
if CheckBox1.Checked=true then
begin
 inc(CountShowMap);

 if CountShowMap < 1  then
  begin
    Image2.Visible:=false;
    Image3.Visible:=false;

    Image5.Visible:= not Image5.Visible;

  end
 else if (CountShowMap >= 1)  and (CountShowMap < 40) then
  begin
    Image5.Visible:=false;
    Image2.Visible:=true;

    Image3.Visible:= not Image3.Visible;

 end
 else CountShowMap:=0;



  SetLocationPEN(X,Y,LoDeg,LaDeg);

{      ScrollBox1.HorzScrollBar.Position:=x-500;
      Image3.Left:=500;
      ScrollBox1.VertScrollBar.Position:=y-300;
      Image3.Top:=300;
}

  if x > 670 then
    begin
      ScrollBox1.HorzScrollBar.Position:=x-670;
      Image3.Left:=670;
   end
  else
    begin
      ScrollBox1.HorzScrollBar.Position:=0;
      Image3.Left:=x;
    end;
  if y > 370 then
  begin
     ScrollBox1.VertScrollBar.Position:=y-370;
     Image3.Top:=370;
  end
  else
  begin
    ScrollBox1.VertScrollBar.Position:=0;
    Image3.Top:=Y;
  end;
end;
 timer3.Enabled:=true;
end;

procedure TFormSaveLocation.FarsiEnter(Sender: TObject);
begin
//LANG_FARSI   = $29;
//LANG_ARABIC  = $01;
//LANG_ENGLISH = $09;
loadkeyboardlayout('00000429',klf_activate);
end;

procedure TFormSaveLocation.ENGlEnter(Sender: TObject);
begin
loadkeyboardlayout('00000409' ,klf_activate);
end;

procedure TFormSaveLocation.Button3Click(Sender: TObject);
var DILo,DILa:integer;
begin
Panel2.Visible:=true;
edit12.Text:=edit2.Text;
edit14.Text:=edit4.Text;
edit13.Text:=edit3.Text;
edit15.Text:=edit5.Text;
edit10.SetFocus;

GetDirect(DILo,DILa);
edit8.Text:=inttostr(DILo);
edit9.Text:=inttostr(DILa);


loadkeyboardlayout('00000429',klf_activate);
end;

procedure TFormSaveLocation.Button4Click(Sender: TObject);
var k: string;
 DeltaLo1_3,DeltaLa1_3:real;
 Y3,X3,DeltaX1_3,DeltaY1_3:integer;
 X,Y:integer;
begin

if (length(edit3.Text) >= 10) and (length(edit2.Text)>=9) then
begin
// tool
dm1.ADOTableSaveLocation.Insert;
dm1.ADOTableSaveLocationCodCity.Asinteger:=FMenu.MainCodCity;
dm1.ADOTableSaveLocationLongitude.AsString:=Edit13.text;
dm1.ADOTableSaveLocationEWIndicator.AsString:=edit15.Text;
//arz
dm1.ADOTableSaveLocationLatitude.AsString:=Edit12.text;
dm1.ADOTableSaveLocationNSIndicator.AsString:=edit14.Text;
dm1.ADOTableSaveLocationDescription.AsString:=edit10.Text;

k:=dm1.ADOTableSaveLocationLongitude.AsString;
dm1.ADOTableSaveLocationLongitudeDeg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);

k:=dm1.ADOTableSaveLocationLatitude.AsString;
dm1.ADOTableSaveLocationLatitudeDeg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);

 DeltaLo1_3:=abs( Lo1Deg  - dm1.ADOTableSaveLocationLongitudeDeg.Asfloat )* 1000000;
 DeltaLa1_3:=abs( La1Deg  - dm1.ADOTableSaveLocationLatitudeDeg.Asfloat )*  1000000;
 DeltaX1_3:= Round((round(DeltaLo1_3) * DX)/ round(DLo * 1000000));
 DeltaY1_3:= Round((round(DeltaLa1_3) * DY)/ round(DLa * 1000000));

 if Lo1Deg  < dm1.ADOTableSaveLocationLongitudeDeg.Asfloat then
     X3:= X1 + DeltaX1_3
 else X3:= X1 - DeltaX1_3;

  if La1Deg  < dm1.ADOTableSaveLocationLatitudeDeg.Asfloat then
     Y3:= Y1 - DeltaY1_3
 else Y3:= Y1 + DeltaY1_3 ;
 X:=X3;
 Y:=Y3;


dm1.ADOTableSaveLocationX.Asinteger:=X;
dm1.ADOTableSaveLocationY.Asinteger:=Y;

dm1.ADOTableSaveLocationNumberStation.Asinteger:=strtoint(edit7.Text);
dm1.ADOTableSaveLocationFileNameVoic.Asstring:=edit6.Text;
dm1.ADOTableSaveLocationFlagVisibl.Asstring:='1';
if ComboBox1.ItemIndex=0 then
 dm1.ADOTableSaveLocationFlagStation_Tablig.Asstring:='1'
else
 dm1.ADOTableSaveLocationFlagStation_Tablig.Asstring:='0';
dm1.ADOTableSaveLocationDirect_Lo.AsInteger:=strtoint(edit8.Text);
dm1.ADOTableSaveLocationDirect_La.AsInteger:=strtoint(edit9.Text);
dm1.ADOTableSaveLocation.Post;
end;
Panel2.Visible:=false;
end;

procedure TFormSaveLocation.Button5Click(Sender: TObject);
begin
Panel2.Visible:=false;
end;

procedure TFormSaveLocation.Button6Click(Sender: TObject);
var k:string;
begin

while not dm1.ADOTableSaveLocation.eof do
begin
dm1.ADOTableSaveLocation.edit;
k:=dm1.ADOTableSaveLocationLongitude.AsString;
dm1.ADOTableSaveLocationLongitudeDeg.Asfloat:=strtofloat(copy(k,1,3))+(strtofloat(copy(k,4,7))/ 60);
k:=dm1.ADOTableSaveLocationLatitude.AsString;
dm1.ADOTableSaveLocationLatitudeDeg.Asfloat:=strtofloat(copy(k,1,2))+(strtofloat(copy(k,3,7))/ 60);

dm1.ADOTableSaveLocation.Post;
dm1.ADOTableSaveLocation.next;
end;
end;

procedure TFormSaveLocation.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked=true then
  Panel3.Visible:=true
else
Panel3.Visible:=false;
end;

end.
