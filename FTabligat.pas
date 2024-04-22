unit FTabligat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables, ComCtrls,
  MPlayer, jpeg, Grids, DBGrids, ADODB,dm, AMovie;
const
 MaxLongMap= 10000 ;
 Distanc_Reng_Circl = 10;
 Max_Reng_Distanc  =  1000;
type

 RecGps= record
   LO:string;
   La:string;
  end;

   PTLocRec=^TLocRec;
   TLocRec =record
    KeyRec: integer;
    NumberStation: integer;
    Longitude: string;
    Latitude: string;
    LongitudeDeg: real;
    LatitudeDeg: real;
    Description: string;
    X: integer;
    Y: integer;
    Direct_Lo:integer;
    Direct_La:integer;
    FileNameVoic: string;
    FlagVisibl: char;
    FlagStation_Tablig: char;
    St_Hour, St_Min:Word;
    NextP:PTLocRec
   end;

  TFormTablig = class(TForm)
    Panel: TPanel;
    ComPort1: TComPort;
    Image1: TImage;
    Timer3: TTimer;
    Timer1: TTimer;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel2: TPanel;
    Edit5: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    MediaPlayer1: TMediaPlayer;
    ComTerminal: TComTerminal;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Image5: TImage;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Button1: TButton;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Panel3: TPanel;
    ActiveMovie1: TActiveMovie;
    Button3: TButton;
    Timer2: TTimer;
    Edit17: TEdit;
    Edit18: TEdit;
    Timer4: TTimer;
    ComTerminalSMS: TComTerminal;
    Edit19: TEdit;
    ComPortsms: TComPort;
    Button4: TButton;
    Timer5: TTimer;
    Edit20: TEdit;
    Button5: TButton;
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure ComTerminalBarcod(Sender: TObject; Buffer: String;
      Count: Integer);
    procedure ComTerminalChar(Sender: TObject; Ch: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ActiveMovie1PlayStateChange(Sender: TObject; OldState,
      NewState: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure ComTerminalSMSBarcod(Sender: TObject; Buffer: String;
      Count: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
   { Public declarations }
   RingList1:array [1..20] of RecGps;
   V_State:string;
   LocationList:array [1..MaxLongMap] of  PTLocRec;
   TempRecP:PTLocRec;
   kk:integer;

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
    Qend:integer;
   NumberLineStr:String;
   NumberLine:integer;
   NoCar:string;

   bitSize:integer;
   inpString:string;
   phoneNumber:string;
   Mes_SMS1:string;
   Mes_SMS2:string;
   procedure WriteStr(Mes_:String);
   procedure WriteStrTerm(Mes_:String);
   procedure TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
   procedure SetLocationPEN(var X,Y:integer;var LoDeg,LaDeg:real);
   procedure GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
   function  findGPSLocationReng(X,Y:integer;LoDeg,LaDeg:real;var TempRecP:PTLocRec):boolean;
   procedure addRing(Token3:string;Token2:string);
   procedure GetDirect(var DILo:integer;var DILa:integer);
  end;

var
  FormTablig: TFormTablig;                                                               //10           13                         26
implementation

uses Seting, Manu,USMS;

{$R *.DFM}
//*****************************************************************************************************************
procedure TFormTablig.GetDirect(var DILo:integer;var DILa:integer);
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
//*****************************************************************************************************************
procedure TFormTablig.addRing(Token3:string;Token2:string);
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
//*****************************************************************************************************************
procedure TFormTablig.ComPort1AfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TFormTablig.ComPort1AfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;
//*****************************************************************************

procedure TFormTablig.TokenNumberGPS(buffer:string;ContToken:integer;var Token:string);
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
//*****************************************************************************************************************
procedure TFormTablig.ComTerminalBarcod(Sender: TObject; Buffer: String;
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
//*****************************************************************************************************************
procedure TFormTablig.ComTerminalChar(Sender: TObject; Ch: Char);
begin
//Memo3.text:=Memo3.text+ch;
end;
//*****************************************************************************************************************
procedure TFormTablig.FormShow(Sender: TObject);
var  i,XX:integer;
begin

 Qend:=0;
 FormTablig.Left:=0;
 FormTablig.Top:=0;
 CountShowMap:=0;
 kk:=1;
 V_State:='STOP';
 MediaPlayer1.FileName:=FMenu.PathInstall+'Melodi\1.wav';
//------------------------------------------------
 dm1.TSeting.open;
 ComPort1.port:=dm1.TSetingPortG.asstring;
 ComPort1.BaudRate:=dm1.TSetingBaudRateG.AsVariant;

 ComTerminal.Connected := true ;


//------------------------------------------------
 dm1.ADOTableDelta.open;
 dm1.ADOTableDelta.Filter:='codCity='+inttostr(FMenu.MainCodCity);
 dm1.ADOTableDelta.Filtered:=true;
 Lo1Deg:= Dm1.ADOTableDeltaLo1Deg.AsFloat;
 La1Deg:=Dm1.ADOTableDeltaLa1Deg.AsFloat;
 DX:=Dm1.ADOTableDeltaDX.Asinteger;
 DLo:=Dm1.ADOTableDeltaDLo.AsFloat;
 DY:=Dm1.ADOTableDeltaDY.Asinteger;
 DLa:=Dm1.ADOTableDeltaDLa.AsFloat;
 X1:=Dm1.ADOTableDeltaX1.Asinteger;
 Y1:=Dm1.ADOTableDeltaY1.Asinteger;
 dm1.ADOTableDelta.close;

//------------------------------------------------
 Image2.Picture.LoadFromFile(FMenu.PathMap+FMenu.MapName);
 Image2.Height:=FMenu.Wi;
 Image2.Width:=FMenu.Wi;
//------------------------------------------------
 i:=1;
  while i< MaxLongMap do
    begin
      LocationList[i]:=NIL;
      i:=i+1;
    end;

 DM1.ADOTableSaveLocation.IndexName:='index_X';
 DM1.ADOTableSaveLocation.open;
 dm1.ADOTableSaveLocation.filter:='codCity='+inttostr(FMenu.MainCodCity);
 dm1.ADOTableSaveLocation.Filtered:=true;
 while  Not DM1.ADOTableSaveLocation.eof do
  begin

    XX:=dm1.ADOTableSaveLocationX.Asinteger;

   if dm1.ADOTableSaveLocationFlagVisibl.Asstring= '1' then
   begin

   if LocationList[XX] <>NIL then
   begin
     TempRecP:=LocationList[XX];
     while TempRecP.NextP<>Nil do
           TempRecP:=TempRecP.NextP;
     new(TempRecP.NextP);
     TempRecP:=TempRecP.NextP;
     TempRecP.NextP:=NIL;
   end
   else
   begin
     new(TempRecP);
     TempRecP.NextP:=NIL;
     LocationList[XX]:=TempRecP;
   end;
  TempRecP.KeyRec:=dm1.ADOTableSaveLocationKeyRec.AsInteger;
  TempRecP.Longitude:=dm1.ADOTableSaveLocationLongitude.AsString;
  TempRecP.Latitude:=dm1.ADOTableSaveLocationLatitude.AsString;
  TempRecP.LongitudeDeg:=dm1.ADOTableSaveLocationLongitudeDeg.Asfloat;
  TempRecP.LatitudeDeg:=dm1.ADOTableSaveLocationLatitudeDeg.Asfloat;
  TempRecP.Description:=dm1.ADOTableSaveLocationDescription.AsString;
  TempRecP.X:=dm1.ADOTableSaveLocationX.Asinteger;
  TempRecP.Y:=dm1.ADOTableSaveLocationY.Asinteger;
  TempRecP.Direct_Lo:=dm1.ADOTableSaveLocationDirect_Lo.AsInteger;
  TempRecP.Direct_La:=dm1.ADOTableSaveLocationDirect_La.AsInteger;
  TempRecP.NumberStation:=dm1.ADOTableSaveLocationNumberStation.Asinteger;
  TempRecP.FileNameVoic:=dm1.ADOTableSaveLocationFileNameVoic.AsString;
  TempRecP.FlagVisibl:=dm1.ADOTableSaveLocationFlagVisibl.Asstring[1];

  if dm1.ADOTableSaveLocationFlagStation_Tablig.Asstring='1' then
   TempRecP.FlagStation_Tablig:='1'
  else TempRecP.FlagStation_Tablig:='0';

  TempRecP.St_Hour:=0;
  TempRecP.St_Min:=0;

 end;         // end if flag

 dm1.ADOTableSaveLocation.next;
 end; //end while
 dm1.ADOTableSaveLocation.close;
//------------------------------------------------
 dm1.ADOLine.Open;
 DM1.ADOLine.Filter:='FlagSelect=''ÝÚÇá''';
 DM1.ADOLine.Filtered:=true;
 NumberLineStr:=DM1.ADOLineNumberLine.asstring;
 NumberLine:=DM1.ADOLineNumberLine.asinteger;
 NoCar:=DM1.ADOLineNo_Car.asstring;
 dm1.ADOLine.close;

//------------------------------------------------
 if dm1.TSetingActiveMonitoring.AsString='ON' then
 begin
   ComPortSMS.port:=dm1.TSetingPortS.asstring;
   ComPortSMS.BaudRate:=dm1.TSetingBaudRateS.AsVariant;
   ComTerminalSMS.Connected := true ;

 bitSize:=dm1.TSetingFormat.AsInteger+6;
 phoneNumber:=dm1.TSetingSendTo.AsString;
 timer4.Interval:=dm1.TSetingDelayToSend.AsInteger*1000;
 end;

//--------------------------------------------------
 Timer1.Enabled:=true;
 Timer3.Enabled:=true;
 Timer4.Enabled:=true;

 if  dm1.TSetingSaveLogWay.asstring='ON' then
  begin
    timer5.Interval:=dm1.TSetingDelaySave.AsInteger*1000;
    DM1.ADOTLogWay.open;
    timer5.Enabled:=true;
  end;

 dm1.TSeting.close;

end;
//*****************************************************************************************************************
procedure TFormTablig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   MediaPlayer1.Stop;
   Timer1.Enabled:=false;
   Timer3.Enabled:=false;
   Timer4.Enabled:=false;
   Timer2.Enabled:=false;
   ComTerminal.Connected := false;

   if dm1.TSetingActiveMonitoring.AsString='ON' then
   ComTerminalSMS.Connected := false;

 if  dm1.TSetingSaveLogWay.asstring='ON' then
  begin
    timer5.Enabled:=false;
    DM1.ADOTLogWay.close;
  end;
 DM1.ADOTLogWayTest.close;

end;
//*****************************************************************************************************************
procedure TFormTablig.Button2Click(Sender: TObject);
begin
   ComTerminal.Connected := Not ComTerminal.Connected ;
end;
//*****************************************************************************************************************
procedure TFormTablig.Timer1Timer(Sender: TObject);
begin
 MediaPlayer1.Play;
end;
procedure TFormTablig.GPSToDeg(Lo,La:string;var LoDeg:real ; var LaDeg:real);
begin
 LoDeg:=strtofloat(copy(Lo,1,3))+(strtofloat(copy(Lo,4,7))/ 60);
 LaDeg:=strtofloat(copy(La,1,2))+(strtofloat(copy(La,3,7))/ 60);
end;
//*****************************************************************************************************************
procedure TFormTablig.SetLocationPEN(var X,Y:integer;var LoDeg,LaDeg:real);
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

//*****************************************************************************************************************
function TFormTablig.findGPSLocationReng(X,Y:integer;LoDeg,LaDeg:real;var TempRecP:PTLocRec):boolean;
VAR
Distance:integer;
End_Distance:integer;
TempP2,TempP:PTLocRec;
X1,X2,R:integer;
d,Lat1,Lat2,Long1,Long2:Real;
begin
 End_DISTANce:=Max_Reng_Distanc;
 TempRecP:=NIL;
 if X < MaxLongMap then
 begin
    if ((X- Distanc_Reng_Circl) > 1) then
     X1:=X - Distanc_Reng_Circl
    else X1 :=1;
    if ((X + Distanc_Reng_Circl) < MaxLongMap) then
     x2:=X + Distanc_Reng_Circl
    else X2:=MaxLongMap -1;

    while X1<= X2  do
    begin
         TempP:=LocationList[X1];
         while TempP<>Nil do
          BEGIN
             Distance:=round(sqrt(sqr(TempP.X - X) +  sqr(TempP.Y - Y))) ;

              if  End_DISTANce > Distance then
                begin
try
                   End_DISTANce := Distance;
                   TempP2:=TempP;
                   R:=6371 *  1000;
                   Lat1:=DegToRad(TempP.LatitudeDeg);
                   Lat2:=DegToRad(LaDeg);
                   Long1:=DegToRad(TempP.LongitudeDeg);
                   Long2:=DegToRad(LoDeg);
 ////////dameg
                   //d:=round(ArcCos(Sin(Lat1) *Sin(Lat2) + Cos(Lat1) * Cos(Lat2)  * Cos(Long2 - Long1 )) * R);
                   if ((lat1=lat2)  or (Long1= Long2)) then
                   else
                   d:=ArcCos(Sin(Lat1) *Sin(Lat2) + Cos(Lat1) * Cos(Lat2)  * Cos(Long2 - Long1 )) * R;
                   Edit11.Text:=floattostr(d);
                   edit10.text:=inttostr(Distance);

                   Lat1:=DegToRad(strtofloat(edit13.Text));
                   Lat2:=DegToRad(strtofloat(edit15.Text));
                   Long1:=DegToRad(strtofloat(edit12.Text));
                   Long2:=DegToRad(strtofloat(edit14.Text));
                   d:=ArcCos(Sin(Lat1) *Sin(Lat2) + Cos(Lat1) * Cos(Lat2)  * Cos(Long2 - Long1 )) * R;
                   Edit16.Text:=floattostr(d);
 except
  on E: Exception do  ;//ErrorDialog(E.Message, E.HelpContext);
end;

                end;
              TempP:=TempP.NextP;
          END;

        X1:=X1+1;
    end;
  if End_DISTANce < 10 then
   begin
     TempRecP:=TempP2;
     result:=true;
   end
    else begin
           TempRecP:=Nil;
           result:=false;
         end;
 end
   else
     begin
       TempRecP:=Nil;
       result:=false;
     end;


{ DM1.ADOTableSaveLocation.IndexName:='long';
if  DM1.ADOTableSaveLocation.Locate('LongitudeDeg;LatitudeDeg', VarArrayOf([LoDeg,LaDeg]), [loPartialKey])=true then
 begin
  KeyRec:= DM1.ADOTableSaveLocationKeyRec.AsInteger;
  result:= true;
 end
else  result:= false;
}
end;
//*****************************************************************************************************************
procedure TFormTablig.Timer3Timer(Sender: TObject);
var
 DILo,DILa:integer;
 TT:string;
 X,Y:integer;
 LoDeg,LaDeg:real;
 KeyRec:integer;
 TempRecP:PTLocRec;
  tempTime,d:tdatetime;
 temp2,Hour, Min, Sec, MSec:Word;

 begin
 timer3.Enabled:=false;

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
    if CheckBox1.Checked=true then
     begin
      Panel2.Visible:=true;
      Panel2.Left:=20;
      Panel2.Top:=550;
     end
    else Panel2.Visible:=false;

    Image3.Visible:= not Image3.Visible;

 end
 else CountShowMap:=0;



  SetLocationPEN(X,Y,LoDeg,LaDeg);

   if (length(edit3.Text) >= 10) and (length(edit2.Text)>=9) then
     addRing(edit3.Text,edit2.Text);
   GetDirect(DILo,DILa);
   edit17.Text:=inttostr(DILo);
   edit18.Text:=inttostr(DILa);


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

   if  findGPSLocationReng(X,Y,LoDeg,LaDeg,TempRecP) then
   begin
     d:=now;
     DecodeTime(d, Hour, Min, Sec, MSec);
     if (Hour=0)then
       Hour:=24;
     temp2:=Hour*60+Min -(TempRecP.St_Hour *60 +TempRecP.St_Min) ;

     if (V_State<>'PLAY')  and (temp2 >= 3 ) and (TempRecP.Direct_Lo=DILo ) and (TempRecP.Direct_La=DILa ) then
      begin
        if FileExists(FMenu.PathVoice+TempRecP.FlagStation_Tablig+'\'+TempRecP.FileNameVoic) then
        begin
        TT:=ExtractFileExt(TempRecP.FileNameVoic);
        if (TT='.Wav') or (TT='.wav') or (TT='.WAV')then
         BEGIN
           Panel3.Height:= 1;
           Panel3.Width:=1;
         END
        ELSE
         BEGIN
           Panel3.Height:=551;
           Panel3.Width:=657;
         END;
         Panel3.Visible:=true;

        ActiveMovie1.Visible:=true;
        ActiveMovie1.FileName:=FMenu.PathVoice+TempRecP.FlagStation_Tablig+'\'+TempRecP.FileNameVoic;
        ActiveMovie1.open;
        ActiveMovie1.play;
        tempTime:=now;
        DecodeTime(tempTime, Hour, Min, Sec, MSec);
        if (Hour=0)then
         Hour:=24;
        TempRecP.St_Hour:=Hour;
        TempRecP.St_Min:=Min;
        end;
      end
     else ;
   end
   else ;
 edit6.text:=inttostr(X);
 edit7.text:=inttostr(Y);
 edit8.text:=floattostr(LoDeg);
 edit9.text:=floattostr(LaDeg);

timer3.Enabled:=true;
end;
//*****************************************************************************************************************
procedure TFormTablig.ActiveMovie1PlayStateChange(Sender: TObject;
  OldState, NewState: Integer);
begin {mpStopped,mpPaused,mpPlaying,mpWaiting,mpScanForward,mpScanReverse,mpClosed}


 if   NewState=  mpStopped then
   begin
     timer1.Enabled:=true;
     ActiveMovie1.Close;
     V_State:='STOP';
     // MediaPlayer1.stop;
      MediaPlayer1.Close;
      MediaPlayer1.FileName:='D:\work\gps\Melodi1.wav';
      MediaPlayer1.open;
      MediaPlayer1.play;
      ActiveMovie1.Visible:=false;
      Panel3.Visible:=false;
   end;
  if   NewState= mpPlaying then
  begin
     V_State:='PLAY';
     MediaPlayer1.Pause;
     MediaPlayer1.stop;
     timer1.Enabled:=false;
     MediaPlayer1.Close;
   end;
end;

//*****************************************************************************************************************
procedure TFormTablig.Button1Click(Sender: TObject);
VAR
Distance:integer;
End_Distance:integer;
TempP2,TempP:PTLocRec;
X1,X2,R:integer;
d,Lat1,Lat2,Long1,Long2:Real;

begin
R:=6371 *  1000;
                   Lat1:=DegToRad(strtofloat(edit13.Text));
                   Lat2:=DegToRad(strtofloat(edit15.Text));
                   Long1:=DegToRad(strtofloat(edit12.Text));
                   Long2:=DegToRad(strtofloat(edit14.Text));
                   d:=ArcCos(Sin(Lat1) *Sin(Lat2) + Cos(Lat1) * Cos(Lat2)  * Cos(Long2 - Long1 )) * R;
                   Edit16.Text:=floattostr(d);

end;
//*****************************************************************************************************************
procedure TFormTablig.Button3Click(Sender: TObject);
begin
  ComTerminal.Connected := false ;
  dm1.ADOTLogWaytest.open;
  Timer2.Enabled:=true;

end;
//*****************************************************************************************************************
procedure TFormTablig.Timer2Timer(Sender: TObject);
begin

   edit3.Text:=dm1.ADOTLogWayTestLo.asstring;
   edit2.Text:=dm1.ADOTLogWayTestLa.asstring;

   dm1.ADOTLogWaytest.next;

   if dm1.ADOTLogWaytest.eof then
    begin
      timer2.Enabled:=false;
      dm1.ADOTLogWaytest.close;
    end;

end;
//*****************************************************************************************************************
procedure TFormTablig.Button4Click(Sender: TObject);
begin
  dm1.ADOTLogWaytest.close;
  Timer2.Enabled:=false;

end;


//*****************************************************************************************************************
procedure TFormTablig.ComTerminalSMSBarcod(Sender: TObject; Buffer: String;
  Count: Integer);
begin
edit19.Text:=Buffer;
end;
//*****************************************************************************************************************
procedure TFormTablig.WriteStr(Mes_:String);
var i,k:integer;
begin
i:=1;
k:=length(Mes_);
while i<=k do
begin
  ComTerminalSMS.KeyPress2(Mes_[i]);
  inc(i);
end;
ComTerminalSMS.KeyPress2(chr(13));
//ComTerminal.KeyPress2(chr(10));
Sleep(100);
end;
//*****************************************************************************************************************
procedure TFormTablig.WriteStrTerm(Mes_:String);
var i,k:integer;
begin
i:=1;
k:=length(Mes_);
while i<=k do
begin
  ComTerminalSMS.KeyPress2(Mes_[i]);
  inc(i);
end;
ComTerminalSMS.KeyPress2(chr(26));
//ComTerminal.KeyPress2(chr(13));
//ComTerminal.KeyPress2(chr(10));
Sleep(100);
end;
//*****************************************************************************************************************

procedure TFormTablig.Timer4Timer(Sender: TObject);
begin

inpString:='$GPGGA,'+Edit3.Text+ ','+Edit2.Text+ ','+NumberLineStr+ ','+NoCar+ ',';

if (inpString<>'') and  (phoneNumber<>'') then
begin
stringToPDU( bitSize,inpString,phoneNumber,Mes_SMS1,Mes_SMS2);

//*******************************
WriteStr('ATZ') ;
//*******************************
WriteStr('AT+CMGF=0') ;
//*******************************
WriteStr(Mes_SMS1) ;
//**********************************
WriteStrTerm(Mes_SMS2) ;
 //SendSMSGPS(Ster1);
end;
end;

//*****************************************************************************************************************

procedure TFormTablig.Timer5Timer(Sender: TObject);
begin
     DM1.ADOTLogWay.Insert;
     DM1.ADOTLogWayLo.AsString:=Edit3.Text;
     DM1.ADOTLogWayLa.AsString:=Edit2.Text;
     DM1.ADOTLogWayDate1.AsString:=DateToStr(Date);
     DM1.ADOTLogWayTime1.asstring:=TimeToStr(Time);
     DM1.ADOTLogWayCodCity.AsInteger:=FMenu.MainCodCity;
     DM1.ADOTLogWayNumberLine.AsInteger:=NumberLine;
     DM1.ADOTLogWayNoCar.asstring:=NoCar;
     DM1.ADOTLogWay.post;
end;
//*****************************************************************************************************************
procedure TFormTablig.Button5Click(Sender: TObject);
begin
timer2.Interval:=strtoint(edit20.Text);
end;

end.
