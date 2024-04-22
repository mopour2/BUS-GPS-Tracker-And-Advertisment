unit FLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls,dm;

type
  TFormLine = class(TForm)
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLine: TFormLine;

implementation

{$R *.dfm}

procedure TFormLine.FormShow(Sender: TObject);
begin
 dm1.ADOLine.Open;
end;

procedure TFormLine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm1.ADOLine.close
end;

end.
