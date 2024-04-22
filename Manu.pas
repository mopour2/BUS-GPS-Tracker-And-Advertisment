unit Manu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, jpeg, ExtCtrls,dm, OleCtrls;

type
  TFMenu = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N7: TMenuItem;
    Seting: TMenuItem;
    SetingAndTest1: TMenuItem;
    SaveLocation1: TMenuItem;
    abligat1: TMenuItem;
    ShowLocation21: TMenuItem;
    City1: TMenuItem;
    Label2: TLabel;
    MSG: TLabel;
    N2: TMenuItem;
    NumberLine1: TMenuItem;
    NumberStation1: TMenuItem;
    RelationLinetoStation1: TMenuItem;
    Label3: TLabel;
    procedure N7Click(Sender: TObject);
    procedure SetingClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure GPSINStation1Click(Sender: TObject);
    procedure SaveLocation1Click(Sender: TObject);
    procedure abligat1Click(Sender: TObject);
    procedure ShowLocation21Click(Sender: TObject);
    procedure City1Click(Sender: TObject);
    procedure NumberLine1Click(Sender: TObject);
    procedure NumberStation1Click(Sender: TObject);
    procedure RelationLinetoStation1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MainCodCity:integer;
    MapName:String;
    PathMap:string;
    PathInstall:string;
    PathVoice:string;
    Hi,Wi:integer;
    function  GetSuitableMSG(iErrNbr: Integer): string;
  end;

var
  FMenu: TFMenu;

implementation

uses Seting, FormInGPs, FDelta, FSaveLocation, FTabligat, FDelta2, UCity,
  FLine, fStation, FRel_L_St;

{$R *.dfm}

function TFMenu.GetSuitableMSG(iErrNbr: Integer): string;
begin
case iErrNbr of
0 : GetSuitableMSG := 'Siccessfully Initialing';
1 : GetSuitableMSG := 'Absence Lock';
2 : GetSuitableMSG := 'Error in User Key';
3 : GetSuitableMSG := 'Lock Change';
4 : GetSuitableMSG := 'Error in Writing';
5 : GetSuitableMSG := 'Error in Network Init';
6 : GetSuitableMSG := 'Error in Send Recieve';
7 : GetSuitableMSG := 'Error in Login Permission';
8 : GetSuitableMSG := 'Error in ActiveX Listening';
9 : GetSuitableMSG := 'Error Invalid Data';
10 : GetSuitableMSG := 'Error Invalid Lock';
end
end;

procedure TFMenu.N7Click(Sender: TObject);
begin
Close
end;
//***************************************************
procedure TFMenu.FormShow(Sender: TObject);
var kk:integer;
DATALock:string;
FlagLock:integer;
begin
FlagLock:=1;
{     Tiny1.Initialize := True;
     MSG.Caption := GetSuitableMSG(Tiny1.TinyErrCode);
      if Tiny1.TinyErrCode = 0 then
      begin
       Tiny1.UserPassWord := 'D11C8AA3E4A4BE685A5152C688982C';
       Tiny1.ShowTinyInfo := True;
       MSG.Caption := GetSuitableMSG(Tiny1.TinyErrCode);
       if Tiny1.TinyErrCode = 0 Then
        begin
         DATALock := Tiny1.DataPartition;
         if DATALock='mohammadrezapouremad' then
          FlagLock:=1
         else ;
        end
       else ;
      end
     else  ;
}

DM1.TSeting.Open;
  PathInstall:=DM1.TSetingDriveInstall.AsString;
  DM1.TSeting.edit;
  DM1.TSetingNoPortActiv.Asinteger:=DM1.TSetingNoPortActiv.Asinteger+1;
  DM1.TSeting.post;
  kk:=DM1.TSetingNoPortActiv.Asinteger;
DM1.TSeting.Close;

if (kk>100) or (FlagLock = 0) then
 close
else
begin

PathMap:=PathInstall+'map\';

DM1.ADOTableCity.Open;
DM1.ADOTableCity.Filter:='FlagSelect=''ÝÚÇá''';
DM1.ADOTableCity.Filtered:=true;
if DM1.ADOTableCity.RecordCount >0 then
 begin
   MainCodCity:=DM1.ADOTableCityCodCity.asinteger;
   MapName:=DM1.ADOTableCityMapName.asstring;
   PathVoice:=PathInstall+'Voice_Gps\'+DM1.ADOTableCityPathCityVoice.asstring+'\';
   Hi:=DM1.ADOTableCityHeight.AsInteger;
   Wi:=DM1.ADOTableCitywidth.AsInteger;
   //FormTestform1.ShowModal;
 end
else ;


end;


end;
procedure TFMenu.test1Click(Sender: TObject);
begin
FormDelta.ShowModal;
end;

procedure TFMenu.SetingClick(Sender: TObject);
begin
 FSeting.ShowModal
end;


procedure TFMenu.GPSINStation1Click(Sender: TObject);
begin
 FormInGp.ShowModal
end;

procedure TFMenu.SaveLocation1Click(Sender: TObject);
begin
 FormSaveLocation.ShowModal;
end;

procedure TFMenu.abligat1Click(Sender: TObject);
begin
 FormTablig.ShowModal;
end;

procedure TFMenu.ShowLocation21Click(Sender: TObject);
begin
 FormDelta2.ShowModal;
end;

procedure TFMenu.City1Click(Sender: TObject);
begin
 FormCity.showmodal;
end;

procedure TFMenu.NumberLine1Click(Sender: TObject);
begin
 FormLine.showmodal;
end;

procedure TFMenu.NumberStation1Click(Sender: TObject);
begin
 FormStation.showmodal;
end;

procedure TFMenu.RelationLinetoStation1Click(Sender: TObject);
begin
FormRel_Line_Station.showmodal;
end;

end.
