unit fStation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dm, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TFormStation = class(TForm)
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStation: TFormStation;

implementation

{$R *.dfm}

procedure TFormStation.FormShow(Sender: TObject);
begin
 dm1.ADOTStation.Open
end;

procedure TFormStation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dm1.ADOTStation.close
end;

end.
