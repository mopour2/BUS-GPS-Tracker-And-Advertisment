unit MTMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls,math,strutils, DB, DBTables,Datetof,
  Buttons, jpeg;
const
MaxLine=16;
MaxQue=10;
MaxTimeNotEvent=10;
ConstTimeOut=150;

 V_StartUp     = 1;
 V_WaitSend    = 2;
 V_SetPara     = 3;
 V_SendInit    = 4;
 V_SendDastor  = 5;
 V_EndSend     = 6;
 V_EndPara     = 7;
 V_ErrorSend   = 8;
 V_Error       = 9;

 StatusStrFarsi:array[1..9] of string  =
 ('Start System'
 	,'„‰ Ÿ—«—”«·'
  ,' ‰ŸÌ„ Å«—«„ — ”Ì” „'
  ,'œ” Ê—  ‰ŸÌ„ œ” ê«Â'
	,'«—”«· ÅÌ€«„ »Â œ” ê«Â'
	,'Å«Ì«‰ «—”«· ÅÌ€«„'
	,' ‰ŸÌ„«  Å«Ì«‰ «—”«·'
  ,'Œÿ« œ— «—”«·'
  ,'Œÿ« œ— ”Ì” „');

 StatusStrFarsiColor:array[1..12] of integer  = (claqua
        ,clRed,clDkGray,clfuchsia,clBlue,clGreen,clGray
	,clYellow,clLime,clNavy,clMaroon,clRed);
  StatusStr:array[1..9] of string  =
       ('Start System'
       ,'SetPara'
       ,'Wait  For Send'
       ,'Send Int device'
       ,'Send Instre'
       ,'End  Send'
       ,'Set End Para'
       ,'Error Send'
       ,'Error System');

type

  Event_at=record
    str:string;
    chanel:integer;
  end;

  TMainForm = class(TForm)
    ComPort1: TComPort;
    ComPort2: TComPort;
    ComPort3: TComPort;
    ComPort4: TComPort;
    ComPort5: TComPort;
    ComPort6: TComPort;
    ComPort7: TComPort;
    ComPort8: TComPort;
    ComPort9: TComPort;
    ComPort10: TComPort;
    ComPort11: TComPort;
    ComPort12: TComPort;
    ComPort13: TComPort;
    ComPort14: TComPort;
    ComPort15: TComPort;
    ComPort16: TComPort;
    Panel3: TPanel;
    Label13: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    BitBtn2: TBitBtn;
    StaticText2: TStaticText;
    BitBtn3: TBitBtn;
    StaticText3: TStaticText;
    BitBtn4: TBitBtn;
    StaticText4: TStaticText;
    BitBtn5: TBitBtn;
    StaticText5: TStaticText;
    BitBtn6: TBitBtn;
    StaticText6: TStaticText;
    BitBtn7: TBitBtn;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    StaticText11: TStaticText;
    BitBtn12: TBitBtn;
    StaticText12: TStaticText;
    BitBtn13: TBitBtn;
    StaticText13: TStaticText;
    BitBtn14: TBitBtn;
    StaticText14: TStaticText;
    BitBtn15: TBitBtn;
    StaticText15: TStaticText;
    BitBtn16: TBitBtn;
    StaticText16: TStaticText;
    Panel: TPanel;
    Label1: TLabel;
    Button7: TButton;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Memo2: TMemo;
    Memo4: TMemo;
    Memo3: TMemo;
    ComTerminal1: TComTerminal;
    ComTerminal16: TComTerminal;
    ComTerminal15: TComTerminal;
    ComTerminal14: TComTerminal;
    ComTerminal13: TComTerminal;
    ComTerminal12: TComTerminal;
    ComTerminal11: TComTerminal;
    ComTerminal10: TComTerminal;
    ComTerminal9: TComTerminal;
    ComTerminal8: TComTerminal;
    ComTerminal7: TComTerminal;
    ComTerminal6: TComTerminal;
    ComTerminal5: TComTerminal;
    ComTerminal4: TComTerminal;
    ComTerminal3: TComTerminal;
    ComTerminal2: TComTerminal;
    Edit1: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Edit4: TEdit;
    Label3: TLabel;
    Bevel18: TBevel;
    Image1: TImage;
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   { Public declarations }
   FlagSend:boolean;
   ActiveChannels:integer;
   FlagLogFile:String;
   procedure statusLine(Count:integer);
  end;




//****************************************************
//
//               Thread At Send
//
//
//****************************************************
 PositionLine=record
     State:integer;
     LastState:integer;
     StartTime:TDatetime;
     Hour, Min, Sec, MSec:Word;
     EndEventTime:TDatetime;
     Ev_Hour, Ev_Min, Ev_Sec, Ev_MSec:Word;
     V_Line:integer;
     CallTel:string;
     pfhandle:integer;
end;

//============================================
  Func = function : integer of object;


  TMyThreadAT = class(TThread)

  private
    FStatusLine : TStaticText ;
    FStatusLineFarsi : TLabel ;
    Status_String:string;
    { Private declarations }
    FlagOkeyOpen:Boolean;
    machine : array[0..400] of Func;
  protected
    constructor Build (Chanel1:integer) ;
    procedure Execute; override;
  public
    resultSend:string;
    resultfasri:string;
    TimOut:integer;
    Chanel:integer;
    ComPort: TComPort;
    ComTerminal: TComTerminal;
    FlagShutDown:boolean;
    LineStat:PositionLine;
    bitSize:integer;
    inpString:string;
    phoneNumber:string;
    Mes_SMS1:string;
    Mes_SMS2:string;
    Event: Event_at;
   QuStart,Quend:integer;
   QU:array[0..MaxQue] of Event_at;
    //    constructor Create(Autorun:boolean);
    function Startup: integer;
    function WaitForSend: integer;
    function SetParaForSend:integer;
    function ATZ: integer;
    function AT_CMGF: integer;
    function AT_CMGS: integer;
    function Mess_Send_C_Z: integer;
    function CheckAndLog_Next: integer;
    function stringToPDU:string;
    function semiOctetToString(inp:string) :string;
    function ToHex(i:INTEGER):STRING;
    function getSevenBit(character:char):integer; //sp
    function intToBin(x:integer;size:integer) :string;
    function binToInt(x:string):integer;
    function intpower2(base,power1:integer):integer;
    function datetostrFarsi(Year, Month, Day: Word):string;
    function GetEvent(var Event: Event_at):integer;
    function SendEvent(str:string;chanel1:integer):integer;
    function QUPush(Str:string;chanel:integer):integer;
    function QUPop (): Event_at;


    procedure ComTerminalBarcod(Sender: TObject; Buffer: String;
      Count: Integer);
    procedure WriteStr(Mes_:String);
    procedure WriteStrTerm(Mes_:String);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);

  end;


//****************************************************
//
//               Thread Nazer
//
//
//****************************************************

  TMyThreadNazer = class(TThread)

  private
    { Private declarations }
  protected
    constructor Build () ;
    procedure Execute; override;
  public
    ChanelNazer:integer;
    FlagShutDown:boolean;
    FlagNazer:boolean;
    CountRunTreed:longint;
    constructor Create(Autorun:boolean);
  end;



var
  MyThreadAT:array[1..MaxLine] of TMyThreadAT ;
  MyThreadNazer:TMyThreadNazer;
  MainForm: TMainForm;
                                                                 //10           13                         26
  sevenbitdefault : Array[0..127]of char =('@',
   '£',
   '$',
   '•',
   'Ë',
   'È',
   '˘',
   'Ï',
   'Ú',
   '«',
   'Ë',
   'ÿ',
   '¯',
   'Ë',
   '≈',
   'Â',
   'Ë',
   '_',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ë',
   'Ä',
   '∆',
   'Ê',
   'ﬂ',
   '…',
   ' ',
   '!',
   '"',
   '#',
   '§',
   '%',
   '&',
   '\',
   '(',
   ')',
   '*',
   '+',
   ',',
   '-',
   '.',
   '/',
   '0',
   '1',
   '2',
   '3',
   '4',
   '5',
   '6',
   '7',
   '8',
   '9',
   ':',
   ';',
   '<',
   '=',
   '>',
   '?',
   '°',
   'A',
   'B',
   'C',
   'D',
   'E',
   'F',
   'G',
   'H',
   'I',
   'J',
   'K',
   'L',
   'M',
   'N',
   'O',
   'P',
   'Q',
   'R',
   'S',
   'T',
   'U',
   'V',
   'W',
   'X',
   'Y',
   'Z',
   'ƒ',
   '÷',
   '—',
   '‹',
   'ß',
   'ø',
   'a',
   'b',
   'c',
   'd',
   'e',
   'f',
   'g',
   'h',
   'i',
   'j',
   'k',
   'l',
   'm',
   'n',
   'o',
   'p',
   'q',
   'r',
   's',
   't',
   'u',
   'v',
   'w',
   'x',
   'y',
   'z',
   '‰',
   'ˆ',
   'Ò',
   '¸',
   '‡');



implementation

uses DM, Manu;

{$R *.DFM}

constructor TMyThreadNazer.Create(Autorun:boolean);
begin
  inherited Create(Autorun);
end;
constructor TMyThreadNazer.Build () ;
begin
  Inherited Create(True);
  ChanelNazer:=1;
  FlagShutDown:=false;
  FlagNazer:=false;
  CountRunTreed:=0;
  Priority :=tpLowest; { set the priority to  lower than normal }
  Resume;
end;


procedure TMyThreadNazer.Execute;
var i:integer;
temp:Word;
temp2:Word;
tempTime:tdatetime;
Ev_Hour,St_Hour,Hour, Min, Sec, MSec:Word;
begin

Repeat
if(CountRunTreed >100000) then
begin
CountRunTreed:=0;
if (FlagShutDown=false) and   (FlagNazer=false ) then
begin
  FlagNazer:=true;
  tempTime:=now;
  DecodeTime(tempTime, Hour, Min, Sec, MSec);

  if ChanelNazer <  MainForm.ActiveChannels then
     ChanelNazer:=ChanelNazer+1
  else ChanelNazer:=1;

   i:=ChanelNazer;


  MainForm.statusLine(i);

//   MyThreadAT[ i ].FStatusLine.Caption := MyThreadAT [ i ].Status_String ;

    if (MyThreadAT[i].LineStat.State<>1) and (MyThreadAT[i].LineStat.State<>0) then
    begin
      Ev_Hour:=MyThreadAT[i].LineStat.Ev_Hour;
      St_Hour:=MyThreadAT[i].LineStat.Hour;
     if (Ev_Hour=0) and (Hour=0)then
        Ev_Hour:=24;
     if (St_Hour=0) and (Hour=0)then
       St_Hour:=24;
     if (Hour=0)then
       Hour:=24;

        temp :=Hour*60+Min -(Ev_Hour*60 +MyThreadAT[i].LineStat.Ev_Min)  ;
        temp2:=Hour*60+Min -(St_Hour*60 +MyThreadAT[i].LineStat.Min) ;

      if (temp >= MaxTimeNotEvent)  and (MyThreadAT[i].LineStat.State <> 1) and (MyThreadAT[i].LineStat.State <> 7  ) then
      begin
       	     MyThreadAT[i].LineStat.State:=1;
       end;
//---------------------
      if (temp >= MaxTimeNotEvent)  and (MyThreadAT[i].LineStat.State <> 1) and (MyThreadAT[i].LineStat.State <> 7  ) then
      begin
         FlagShutDown:=true;
      end;
    end; //end if
   FlagNazer:=false;
end;
end
else CountRunTreed:=CountRunTreed+1;

Until FlagShutDown;
 Terminate;
end;

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//*************************************************************************
constructor TMyThreadAT.Build (Chanel1:integer) ;
begin
  Inherited Create(True);
  Chanel:=Chanel1;
  QuStart:=0;
  Quend:=0;
  FlagOkeyOpen:=FALSE;
  LineStat.State:=0;
  LineStat.LastState:=LineStat.State;
//  ExitFlag:=false;
  Priority :=tpLowest; { set the priority to  lower than normal }

  machine[0]:= Startup;
  machine[1]:= WaitForSend;
  machine[2]:= SetParaForSend;
  machine[3]:= ATZ;
  machine[4]:= AT_CMGF;
  machine[5]:= AT_CMGS;
  machine[6]:=Mess_Send_C_Z;
  machine[7]:= CheckAndLog_Next;


//  Resume;
end;
//============================================

procedure TMyThreadAT.ComTerminalBarcod(Sender: TObject; Buffer: String;
  Count: Integer);
begin
MainForm.edit1.Text:=Buffer;
MainForm.Memo4.text:=MainForm.Memo4.text+'#'+Buffer+'('+inttostr(chanel)+')';
QUPush(Buffer,chanel);
end;
//*****************************************************************************
procedure TMyThreadAT.ComPortAfterOpen(Sender: TObject);
begin
     FlagOkeyOpen:=true;
end;
//*****************************************************************************
procedure TMyThreadAT.ComPortAfterClose(Sender: TObject);
begin
     FlagOkeyOpen:=False;
end;

//**************************************************************************
procedure TMyThreadAT.WriteStr(Mes_:String);
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
Sleep(100);
end;
//**************************************************************************
procedure TMyThreadAT.WriteStrTerm(Mes_:String);
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
Sleep(100);
end;
//**************************************************************************
function TMyThreadAT.Startup: integer;
var proc:tthreadmethod;
begin
LineStat.State:=1;
LineStat.V_Line:=V_StartUp;

LineStat.EndEventTime:= Now;
DecodeTime(LineStat.EndEventTime,LineStat.Ev_Hour,LineStat.Ev_Min,LineStat.Ev_Sec,LineStat.Ev_MSec);
LineStat.StartTime:=now;
DecodeTime(LineStat.StartTime,LineStat.Hour,LineStat.Min,LineStat.Sec,LineStat.MSec);
LineStat.LastState:=LineStat.State;
//ExitFlag:=false;
Result:=LineStat.State;

//  ComPort:= TComPort.Create(Application);
//  ComTerminal:= TComTerminal.Create(Application);
//  ComTerminal.Width:=400;
//  ComTerminal.Top:=4;
//  ComTerminal.Left:=1;
//  ComTerminal.Enabled:=true;
//  ComTerminal.Visible:=true;

  ComPort.OnAfterOpen:=  ComPortAfterOpen;
  ComPort.OnAfterClose:=  ComPortAfterClose;
  ComTerminal.ComPort:=ComPort;
  ComTerminal.OnBarcod:=ComTerminalBarcod;

  case Chanel of
    1:ComPort.port:=DM1.TSetingPort1.asstring;
    2:ComPort.port:=DM1.TSetingPort2.asstring;
    3:ComPort.port:=DM1.TSetingPort3.asstring;
    4:ComPort.port:=DM1.TSetingPort4.asstring;
    5:ComPort.port:=DM1.TSetingPort5.asstring;
    6:ComPort.port:=DM1.TSetingPort6.asstring;
    7:ComPort.port:=DM1.TSetingPort7.asstring;
    8:ComPort.port:=DM1.TSetingPort8.asstring;
    9:ComPort.port:=DM1.TSetingPort9.asstring;
    10:ComPort.port:=DM1.TSetingPort10.asstring;
    11:ComPort.port:=DM1.TSetingPort11.asstring;
    12:ComPort.port:=DM1.TSetingPort12.asstring;
    13:ComPort.port:=DM1.TSetingPort13.asstring;
    14:ComPort.port:=DM1.TSetingPort14.asstring;
    15:ComPort.port:=DM1.TSetingPort15.asstring;
    16:ComPort.port:=DM1.TSetingPort16.asstring;
  end;

  ComTerminal.OnBarcod:=ComTerminalBarcod;
  TRY
    if chanel<=MainForm.ActiveChannels then
    ComTerminal.Connected := Not ComTerminal.Connected ;
  except
   FlagOkeyOpen:=FALSE;
  end;

end;
//============================================
function TMyThreadAT.QUPush(Str:string;chanel:integer):integer;
begin
if (QUEnd=QuStart) and  (QUEnd=MaxQue) then
begin
//empty
   Qu[QuEnd].str:=Str;
   Qu[QuEnd].chanel:=chanel;
   QUEnd:=0;
end
else if (QUEnd=QuStart) and  (QUEnd<MaxQue) then
begin
//empty
   Qu[QuEnd].str:=Str;
   Qu[QuEnd].chanel:=chanel;
   inc(QUEnd);
end
else if (QUEnd=MaxQue) and (QuStart=0) then
begin
 result:= 0;//  over
 exit;
end
else if (QUEnd=MaxQue) and (QuStart<>0) then
begin
   Qu[QuEnd].str:=Str;
   Qu[QuEnd].chanel:=chanel;
   QUEnd:=0;
end
else if (QuStart<QuEnd) and (QUEnd<MaxQue)then
begin
   Qu[QuEnd].str:=Str;
   Qu[QuEnd].chanel:=chanel;
   inc(QUEnd);
end
else if (QuStart>QuEnd) and (QUEnd+1=QuStart)then
begin
 result:= 0;//  over
 exit;
end
else if (QuStart>QuEnd) and (QUEnd+1<QuStart)then
begin
   Qu[QuEnd].str:=Str;
   Qu[QuEnd].chanel:=chanel;
   inc(QUEnd);
end;

result:= 1;//  over
end;
//============================================
function  TMyThreadAT.QUPop (): Event_at;
var TempPop:Event_at;
begin

if (QuStart=QUEnd) then
begin
 //empty
  TempPop. str:='';
   TempPop.chanel :=-1;
   result:=TempPop;
end
else if (QuStart=MaxQue)  then
begin
   TempPop.str:=Qu[QuStart].str;
   TempPop.chanel :=Qu[QuStart].chanel;
   result:=TempPop;
   QuStart:=0;
end
else
begin
   TempPop.str:=Qu[QuStart].str;
   TempPop.chanel :=Qu[QuStart].chanel;
   result:=TempPop;
   inc(QuStart);
end
end;
//============================================
function TMyThreadAT.GetEvent(var Event: Event_at):integer;
begin
 event:=QUPop ();
end;
//============================================
function TMyThreadAT.SendEvent(str:string;chanel1:integer):integer;
begin
  QUPush(str,chanel1);
end;
//************************************************************
// function to convert semioctets to a string
function TMyThreadAT.semiOctetToString(inp:string) :string;
var out1 :string;
temp:string;
l,i:integer;
begin
	out1 := '';
  temp:='';
  l:=length(inp);
  i:=1;
	While ( i< L) do
	begin
   temp := inp[i]+inp[i+1];
   out1 := out1 + temp[2] + temp[1];
   i:=i+2;
   temp:='';
	end;
	result:= out1;
end;
//************************************************************
function TMyThreadAT.intpower2(base,power1:integer):integer;
var i,bas2:integer;
begin
i:=1;
bas2:=1;
while i<=power1 do
 begin
  bas2:=bas2*base;
  inc(i);
 end;
 result:=bas2;
end;
//************************************************************
// function te convert a bit string into a integer
function TMyThreadAT.binToInt(x:string):integer;
var total :integer;
   power1:integer;
   i:integer;
begin
	 total := 0;
	 power1 := length(x)-1;

	for i:=1 to length(x) do
	begin
		if(x[i] = '1') then
		begin
		  total := total +intpower2(2,power1);
		end;
		power1:=power1-1 ;
	end;

	result:= total;
end;
//************************************************************
// function to convert a integer into a bit String
function TMyThreadAT.intToBin(x:integer;size:integer) :string;
	var
   base :integer;
	 num :integer;
	 bin :string;
   i,y:integer;
begin
	 base := 2;
	 num := x;
   bin:='';
   while(num<>0) do
   begin
     y:=num and 1 ;
     if y=1 then
      bin:='1'+bin
     else bin:='0'+bin;
     num:=num shr 1;
   end;
 // bin := num .toString(base);
	for i:=length(bin) to size do
	begin
		bin := '0' + bin;
	end;
	result:= bin;
end;
//************************************************************

function TMyThreadAT.getSevenBit(character:char):integer; //sp
var k,i:integer;
begin
k:=0;
	for i:=0 to length(sevenbitdefault) do
	begin
		if(sevenbitdefault[i] = character) then
		begin
			k:= i;
		end;
	end;
	//alert("No 7 bit char!");
	result:= k;
end;
//************************************************************
function TMyThreadAT.ToHex(i:INTEGER):STRING;
var sHex :STRING;
 Out :STRING;

BEGIN
	sHex := '0123456789ABCDEF';
	Out := '';

	Out := sHex[i AND $f];
	i:=I SHR 4;
	Out := sHex[i AND $f] + Out;

	result:= Out;
END;

//************************************************************
function TMyThreadAT.stringToPDU:string;
var
	 octetFirst :STRING;
	 octetSecond :STRING;
	 output :STRING;
	//Make header
	SMSC_INFO_LENGTH :INTEGER;
  SMSC_INFO_LENGTHS:string;
	SMSC_LENGTH :INTEGER;
	SMSC_NUMBER_FORMAT:STRING;
	SMSC :STRING;
  smscNumber:string;
  firstOctet:string;
  REIVER_NUMBER_FORMAT:string;
  REIVER_NUMBER_LENGTH:string;
  REIVER_NUMBER:string;
  PROTO_ID:string;
  DATA_ENCODING:string;
  VALID_PERIOD:string;
  userDataSize:string;
  i:integer;
  current:string;
  currentOctet:string;
  CurrentByte:integer;
  CurrentByteHex:string;
  myChar:integer;
  header:string;
  PDU:string;
  AT:string;
BEGIN
  sevenbitdefault[10]:=chr(10);
  sevenbitdefault[13]:=chr(13);
  sevenbitdefault[26]:=chr(26);

  smscNumber:='';
  SMSC_INFO_LENGTH:=0;
	if (smscNumber <>'') then
	BEGIN
		SMSC_NUMBER_FORMAT := '92'; // national
		if (smscNumber[1] = '+') then
		BEGIN
			SMSC_NUMBER_FORMAT := '91'; // international
      smscNumber :=RightStr(smscNumber , length(smscNumber )-1);
		END
		else if (smscNumber[1] <> '0' ) then
		BEGIN
			SMSC_NUMBER_FORMAT := '91'; // international
		END;
		if(length(smscNumber) mod 2 <> 0) then
		BEGIN
			// add trailing F
			smscNumber :=smscNumber+'F';
		END;
		SMSC := semiOctetToString(smscNumber);
		SMSC_INFO_LENGTH := ((length(SMSC_NUMBER_FORMAT + '' + SMSC))div 2);
		SMSC_LENGTH := SMSC_INFO_LENGTH;
	END;
  //******************************************
	if(SMSC_INFO_LENGTH < 10) then
	BEGIN
		SMSC_INFO_LENGTHS := '0' + '0';
	END;
  //******************************************
	firstOctet := '1100';
  REIVER_NUMBER_FORMAT := '92'; // national

	if (phoneNumber[1] = '+') then
	BEGIN
		REIVER_NUMBER_FORMAT := '91'; // international
    phoneNumber:=RightStr(phoneNumber, length(phoneNumber)-1);//,phoneNumber.length-1);
//    ss:=copy(ss,0,7);
    phoneNumber:=RightStr(phoneNumber, length(phoneNumber)-1);
	end
	else if (phoneNumber[1] <>'0')then
	BEGIN
		REIVER_NUMBER_FORMAT := '91'; // international
	end;

	REIVER_NUMBER_LENGTH := intToHex(length(phoneNumber),2);

	if(length(phoneNumber)MOD 2 <> 0) THEN
	BEGIN
		// add trailing F
		phoneNumber :=phoneNumber+'F';
	end;

	REIVER_NUMBER := semiOctetToString(phoneNumber);
	PROTO_ID := '00';
	DATA_ENCODING := '00'; // Default
	if (bitSize = 8)THEN
	BEGIN
		DATA_ENCODING := '04';
	end
	else if (bitSize = 16) then
	BEGIN
		DATA_ENCODING := '08';
	end;

	VALID_PERIOD:= 'AA';


	if (bitSize = 7) THEN
	BEGIN

		userDataSize:= intToHex(LENGTH(inpString),2);
    i:=1;
		WHILE  I-1<= LENGTH(inpString) do
		BEGIN
			if(i-1=LENGTH(inpString)) then
			BEGIN
				if (octetSecond <> '') then// AJA Fix overshoot
				BEGIN
					output := output + '' + (intToHex(binToInt(octetSecond),2));
				end;
			 	 BREAK;
			end;
			current:= intToBin(getSevenBit(inpString[i]),7);


			if (i-1<>0) and (((i-1) mod 8)<>0) then
			BEGIN
				octetFirst := RightStr(current, length(current)-1-(7-((i-1) mod 8)));//current.substring(7-(i)%8);
				currentOctet := octetFirst + octetSecond;	//put octet parts together

				output := output + '' + (intToHex(binToInt(currentOctet),2));
//        octetSecond :=RightStr(current,(7-((i-1) mod 8)));	//set net second octet
        octetSecond := copy(current,2,(7-((i-1)mod 8)));
			end
			else
			BEGIN
//				octetSecond := copy(current,1,(7-((i-1)mod 8)));
          octetSecond :=RightStr(current,(7-((i-1) mod 8)));
			end;
     I:=I+1;
		end;//END WHILE
	end
	else if (bitSize = 8) then
	BEGIN
  	userDataSize := intToHex(length(inpString),2);
  	CurrentByte := 0;
		for i:=1   to length(inpString) do
		BEGIN
			CurrentByte := ORD(inpString[i]);
      CurrentByteHex:=inttohex(ORD(inpString[i]),2);
//			output := output + '' + ( ToHex( CurrentByte ) );
      output := output + '' +CurrentByteHex;
		end
	end
	else if (bitSize = 16) THEN
	begin
		userDataSize := intToHex(LENGTH(inpString) * 2,2);

		myChar:=0;
		for i:=1 to length(inpString) do
		begin
			myChar :=  ord(inpString[i]);
			output := output + '' +  intToHex(((myChar and $ff00) shr 8 ),2) +  intToHex(( myChar and $ff ) ,2);
		end
	end;
	 header := SMSC_INFO_LENGTHS + SMSC_NUMBER_FORMAT + SMSC + firstOctet + REIVER_NUMBER_LENGTH + REIVER_NUMBER_FORMAT  + REIVER_NUMBER +  PROTO_ID + DATA_ENCODING + VALID_PERIOD + userDataSize;

	PDU := header + output;
	AT := 'AT+CMGS=' + inttostr((length(PDU) div 2 - SMSC_LENGTH - 1)) ; // Add /2 for PDU length AJA - I think the SMSC information should also be excluded
  Mes_SMS1:=AT ;
  Mes_SMS2:=PDU ;
	//CMGW
	result:= AT +chr(10) + PDU;
END;
//============================================
procedure TMyThreadAT.Execute;
var i:integer;
 lastst:integer;
begin
LineStat.LastState:=LineStat.State;
LastSt:=LineStat.State;
i:=0;

Repeat
   LastSt:=LineStat.State;
 if FlagShutDown=false then
  begin

   i:=machine[LineStat.State];

   GetEvent(Event);
   if (event.chanel<>-1)then
     begin
     LineStat.EndEventTime:= Now;
     DecodeTime(LineStat.EndEventTime,LineStat.Ev_Hour,LineStat.Ev_Min,LineStat.Ev_Sec,LineStat.Ev_MSec);
     LineStat.LastState:=LastSt;
    end;
  end;


Until FlagShutDown  ;
ComTerminal.Connected := Not ComTerminal.Connected ;
//  Terminate;
end;
//============================================
function TMyThreadAT.WaitForSend:integer;
begin
   LineStat.V_Line:=V_WaitSend;
   QuStart:=0;
   Quend:=0;

  If (MainForm.FlagSend=true) AND (FlagOkeyOpen=TRUE) then
     LineStat.State:=2
  else LineStat.State:=1
end;

//============================================
function TMyThreadAT.SetParaForSend;
var k,i:integer;
 Year, Month, Day: Word;
d:TdateTime;
begin

LineStat.V_Line:=V_SetPara;
d:=now;
DecodeDate(d,Year, Month, Day);
ftodate(Year, Month, Day);

bitSize:=DM1.TSetingFormat.AsInteger+6;
phoneNumber:=trim(MainForm.Edit4.Text);
inpString:=MainForm.memo1.Lines.Text;
MainForm.memo2.Lines.Add( stringToPDU);
LineStat.State:=3;
SendEvent('WRITSTR',chanel);
TimOut:=0;
end;

//============================================
function TMyThreadAT.ATZ:integer;
begin
LineStat.V_Line:=V_SendInit;
MainForm.Label3.Caption:='‘—Ê⁄ «—”«· ÅÌ€«„';
if Event.str='WRITSTR'  then
  begin WriteStr('ATZ') ; end
else if (Event.str='OK') or (Event.str='ok') then
 begin LineStat.State:=4;  TimOut:=0; SendEvent('WRITSTR',chanel); end
else if (TimOut=100) and (TimOut=1000) then
  begin
   SendEvent('WRITSTR',chanel);
  end
else begin
       if TimOut< ConstTimeOut  then
        TimOut:=TimOut+1
       else begin LineStat.State:=7;      resultfasri:='CZ ⁄œ„ «—”«· ‰ ÌÃÂ ' end;
       sleep(0);
     end

end;
//============================================
function TMyThreadAT.AT_CMGF:integer;
begin
LineStat.V_Line:=V_SendInit;
if Event.str='WRITSTR'  then
  begin WriteStr('AT+CMGF=0') ; end
else if (Event.str='OK') or (Event.str='ok') then
 begin LineStat.State:=5;  TimOut:=0; SendEvent('WRITSTR',chanel); end
else if (TimOut=100) and (TimOut=1000) then
  begin
   //SendEvent('WRITSTR',chanel);
  end
else begin
       if TimOut<ConstTimeOut then
        TimOut:=TimOut+1
       else begin LineStat.State:=7;      resultfasri:='Cf ⁄œ„ «—”«· ‰ ÌÃÂ ' end;
       sleep(0);
     end

end;
//============================================
function TMyThreadAT.AT_CMGS:integer;
begin
LineStat.V_Line:=V_SendDastor;
if Event.str='WRITSTR'  then
  begin WriteStr(Mes_SMS1) ; end
else if (Event.str='>') or (Event.str='ok') then
 begin LineStat.State:=6;  TimOut:=0; SendEvent('WRITSTR',chanel); end
else if (TimOut=100) and (TimOut=1000) then
  begin
   //SendEvent('WRITSTR',chanel);
  end
else begin
       if TimOut<ConstTimeOut then
        TimOut:=TimOut+1
       else begin LineStat.State:=7;      resultfasri:='CM ⁄œ„ «—”«· ‰ ÌÃÂ ' end;
       sleep(0);
     end

end;
//============================================
function TMyThreadAT.Mess_Send_C_Z:integer;
begin
LineStat.V_Line:=V_SendDastor;
if Event.str='WRITSTR'  then
  begin
    WriteStrTerm(Mes_SMS2) ;
    if MainForm.FlagLogFile ='OFF' then
      begin
        LineStat.State:=7; Sleep(10);
      end;
  end
else if (copy(Event.str,1,3)='+CM') or (copy(Event.str,1,3)='+cm')then
 begin
    LineStat.V_Line:=V_EndSend; LineStat.State:=7;
    TimOut:=0; resultSend :=Event.str; SendEvent('WRITSTR',chanel);
    if (copy(Event.str,6,5)='ERROR') then
      resultfasri:='«—”«· ‰‘œ '
    else resultfasri:='ÅÌ€«„ «—”«· ‘œ';
 end
else if (TimOut=100) and (TimOut=1000) then
  begin
   //SendEvent('WRITSTR',chanel);
  end
else begin
       if TimOut<ConstTimeOut then
        TimOut:=TimOut+1
       else begin LineStat.State:=7;      resultfasri:=' ⁄œ„ «—”«· ‰ ÌÃÂ ' end;
       sleep(0);
     end

end;
//============================================
function TMyThreadAT.CheckAndLog_Next;
var  Year, Month, Day: Word;
d:TdateTime;
begin
d:=now;
DecodeDate(d, Year, Month, Day);
ftodate(year,month, day);
MainForm.Label3.Caption:=resultfasri;
LineStat.State:=1;
LineStat.V_Line:= V_EndPara;
MainForm.FlagSend:=false;
if MainForm.FlagLogFile <>'OFF' then
begin
Dm1.TLogSend.Insert;
Dm1.TLogSendTellGetSMS.AsString:=trim(MainForm.Edit4.Text);//tel no get mes
Dm1.TLogSendNoMesSend.asinteger:=Dm1.TMessSendNoMes.AsInteger;
Dm1.TLogSendResultSend.AsString:=resultSend;      //result
Dm1.TLogSendResultfarsi.AsString:=resultfasri;      //result
Dm1.TLogSendDateSend.asstring:=datetostrFarsi(Year, Month, Day);
Dm1.TLogSendTimeSend.AsString:=timeTostr(d);
Dm1.TLogSend.post;
end;
end;
//============================================
////**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
//**************************************************************************
function TMyThreadAT.datetostrFarsi(Year, Month, Day: Word):string;
var Temp1,Temp2,Temp3:string;
begin
  Temp2:=inttostr(year)+'/';
   temp1:=inttostr(Month);
   if (length(Temp1)<2) then
     Temp3:='0'+Temp1
   else Temp3:=Temp1;
   Temp2:=Temp2+Temp3+'/';
   temp1:=inttostr(Day);
   if (length(Temp1)<2) then
     Temp3:='0'+Temp1
   else Temp3:=Temp1;
   Temp2:=Temp2+Temp3;
result:=temp2;
end;
//**************************************************************************
//**************************************************************************
function datetostrFarsi(Year, Month, Day: Word):string;
var Temp1,Temp2,Temp3:string;
begin
  Temp2:=inttostr(year)+'/';
   temp1:=inttostr(Month);
   if (length(Temp1)<2) then
     Temp3:='0'+Temp1
   else Temp3:=Temp1;
   Temp2:=Temp2+Temp3+'/';
   temp1:=inttostr(Day);
   if (length(Temp1)<2) then
     Temp3:='0'+Temp1
   else Temp3:=Temp1;
   Temp2:=Temp2+Temp3;
result:=temp2;
end;

//**************************************************************************
procedure TMainForm.statusLine(Count:integer);
var  i:integer;
     ss:string;
     color2:TColor;
begin
  i:=MyThreadAT [ count ].LineStat.V_Line;
 if (i>=1) and (i<=9) then
   color2:=StatusStrFarsiColor[i]
 else    color2:=clRed ;
  MyThreadAT [ Count ].FStatusLine.Font.color:=color2;
  MyThreadAT [ Count ].FStatusLine.Font.color:=color2;
  if (i>=1) and (i<=9) then
   MyThreadAT [ Count ].FStatusLine.Caption :=  StatusStrFarsi[i]
  //  Line [ Count ].FStatusLineFarsi.Caption :=  StatusStr[i]
  else MyThreadAT [ Count ].FStatusLine.Caption :=  'Ê÷⁄Ì  ‰«„‘Œ’';
//  Line [ Count ].FStatusLine.Caption := Line [ Count ].Status_String ;
END;

//**************************************************************************
procedure TMainForm.FormShow(Sender: TObject);
var i:integer;
begin
   DM1.TSeting.open;
   Dm1.TLogSend.open;
   Dm1.TMessSend.Open;

ActiveChannels:=DM1.TSetingMaxlineActive.AsInteger;
FlagLogFile:=DM1.TSetingLogFileOn.Asstring;

  for i:=1 to ActiveChannels do
  BEGIN
    MyThreadAT[i]:= TMyThreadAT.Build(i);
  case i of
    1:begin MyThreadAT[i].ComPort:=ComPort1; MyThreadAT[i].ComTerminal:=ComTerminal1;
            MyThreadAT[i].FStatusLine := StaticText1;
      end;
    2:begin MyThreadAT[i].ComPort:=ComPort2; MyThreadAT[i].ComTerminal:=ComTerminal2;
            MyThreadAT[i].FStatusLine := StaticText2;
      end;
    3:begin MyThreadAT[i].ComPort:=ComPort3; MyThreadAT[i].ComTerminal:=ComTerminal3;
            MyThreadAT[i].FStatusLine := StaticText3;
      end;
    4:begin MyThreadAT[i].ComPort:=ComPort4; MyThreadAT[i].ComTerminal:=ComTerminal4;
            MyThreadAT[i].FStatusLine := StaticText4;
      end;
    5:begin MyThreadAT[i].ComPort:=ComPort5; MyThreadAT[i].ComTerminal:=ComTerminal5;
            MyThreadAT[i].FStatusLine := StaticText5;
      end;
    6:begin MyThreadAT[i].ComPort:=ComPort6; MyThreadAT[i].ComTerminal:=ComTerminal6;
            MyThreadAT[i].FStatusLine := StaticText6;
      end;
    7:begin MyThreadAT[i].ComPort:=ComPort7; MyThreadAT[i].ComTerminal:=ComTerminal7;
            MyThreadAT[i].FStatusLine := StaticText7;
      end;
    8:begin MyThreadAT[i].ComPort:=ComPort8; MyThreadAT[i].ComTerminal:=ComTerminal8;
            MyThreadAT[i].FStatusLine := StaticText8;
      end;
    9:begin MyThreadAT[i].ComPort:=ComPort9; MyThreadAT[i].ComTerminal:=ComTerminal9;
            MyThreadAT[i].FStatusLine := StaticText9;
      end;
    10:begin MyThreadAT[i].ComPort:=ComPort10; MyThreadAT[i].ComTerminal:=ComTerminal10;
            MyThreadAT[i].FStatusLine := StaticText10;
       end;
    11:begin MyThreadAT[i].ComPort:=ComPort11; MyThreadAT[i].ComTerminal:=ComTerminal11;
             MyThreadAT[i].FStatusLine := StaticText11;
       end;
    12:begin MyThreadAT[i].ComPort:=ComPort12; MyThreadAT[i].ComTerminal:=ComTerminal12;
             MyThreadAT[i].FStatusLine := StaticText12;
       end;
    13:begin MyThreadAT[i].ComPort:=ComPort13; MyThreadAT[i].ComTerminal:=ComTerminal13;
             MyThreadAT[i].FStatusLine := StaticText13;
       end;
    14:begin MyThreadAT[i].ComPort:=ComPort14; MyThreadAT[i].ComTerminal:=ComTerminal14;
             MyThreadAT[i].FStatusLine := StaticText14;
       end;
    15:begin MyThreadAT[i].ComPort:=ComPort15; MyThreadAT[i].ComTerminal:=ComTerminal15;
             MyThreadAT[i].FStatusLine := StaticText15;
       end;
    16:begin MyThreadAT[i].ComPort:=ComPort16; MyThreadAT[i].ComTerminal:=ComTerminal16;
             MyThreadAT[i].FStatusLine := StaticText16;
       end;
  end;
    MyThreadAT[i].Resume;
  END;

   MyThreadNazer:= TMyThreadNazer.Build();
   DM1.TSeting.open;
   Dm1.TLogSend.open;
   Dm1.TMessSend.Open;

end;
//**************************************************************************
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  MyThreadNazer.FlagShutDown:=true ;
  MyThreadNazer.Terminate ;
  MyThreadNazer.suspend;
  MyThreadNazer.Destroy;

 for i:=1 to ActiveChannels do
   if MyThreadAT[i]<>NIL then
   begin
    MyThreadAT[i].FlagShutDown:=true ;
    MyThreadAT[i].Terminate ;
    MyThreadAT[i].suspend;
    MyThreadAT[i].Destroy;
   end;

   DM1.TSeting.close;
   Dm1.TLogSend.close;
   Dm1.TMessSend.close;
end;

//**************************************************************************
//**************************************************************************
procedure TMainForm.Button7Click(Sender: TObject);
var  Year, Month, Day: Word;
d:TdateTime;
i:integer;
begin
  d:=now;
  DecodeDate(d, Year, Month, Day);
  ftodate(year,month, day);
 if  MyThreadAT[1].FlagOkeyOpen=true then
 begin
   FlagSend:=true;
   Dm1.TMessSend.Insert;
   Dm1.TMessSendStringMess.AsString:=MainForm.memo1.Lines.Text;
   Dm1.TMessSendDateRec.asstring:=datetostrFarsi(Year, Month, Day);
   Dm1.TMessSendTimeRec.AsString:=timeTostr(d);
   Dm1.TMessSend.post;
 END;
end;
//*****************************************************************************
end.
