unit UCity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask,dm;

type
  TFormCity = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBComboBox1: TDBComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCity: TFormCity;

implementation

{$R *.dfm}

procedure TFormCity.FormShow(Sender: TObject);
begin
 DM1.ADOTableCity.Open;
 DM1.ADOTableCity.Filter:='';
 DM1.ADOTableCity.Filtered:=true;
end;

procedure TFormCity.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM1.ADOTableCity.close;
end;

end.
