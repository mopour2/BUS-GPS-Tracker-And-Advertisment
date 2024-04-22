unit FRel_L_St;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dm, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFormRel_Line_Station = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    DBNavigator2: TDBNavigator;
    Label3: TLabel;
    DBNavigator3: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRel_Line_Station: TFormRel_Line_Station;

implementation

uses DB;

{$R *.dfm}

procedure TFormRel_Line_Station.FormShow(Sender: TObject);
begin
 dm1.ADOLine.Open;
 dm1.ADOTStation.Open;
 dm1.ADOTRel_Line_Station.Open;
end;

procedure TFormRel_Line_Station.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm1.ADOLine.close;
 dm1.ADOTStation.close;
 dm1.ADOTRel_Line_Station.close;
end;

procedure TFormRel_Line_Station.BitBtn1Click(Sender: TObject);
begin
  dm1.ADOTRel_Line_Station.insert;
  dm1.ADOTRel_Line_StationCodCity.AsInteger:=dm1.ADOLineCodcity.asinteger;
  dm1.ADOTRel_Line_StationNumberLine.AsInteger:=dm1.ADOLineNumberLine.asinteger;
  dm1.ADOTRel_Line_StationNumberStation.AsInteger:=dm1.ADOTStationNumberStation.asinteger;
  dm1.ADOTRel_Line_Station.post;
end;

end.
