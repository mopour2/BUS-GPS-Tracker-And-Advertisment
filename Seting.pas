unit Seting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CPort, Buttons, Mask, DBCtrls, DB, DBTables,dm;

type
  TFSeting = class(TForm)
    ComPort1: TComPort;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Panel1: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    Label1: TLabel;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    Label14: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSeting: TFSeting;

implementation

{$R *.dfm}

procedure TFSeting.SpeedButton1Click(Sender: TObject);
begin

case ( Sender as TSpeedButton ).tag of
1:ComPort1.port:=DM1.TSetingPortG.asstring;                              
2:ComPort1.port:=DM1.TSetingPortS.asstring;
end;

case ( Sender as TSpeedButton ).tag of
1:ComPort1.Baudrate:=Tbaudrate(DM1.TSetingBaudRateG.asinteger);
2:ComPort1.baudrate:=Tbaudrate(DM1.TSetingBaudrateS.asinteger);
end;


  ComPort1.ShowSetupDialog;

if DM1.TSeting.State=dsEdit then
else DM1.TSeting.Edit;

case ( Sender as TSpeedButton ).tag of
1:DM1.TSetingBaudrateG.AsVariant:=ComPort1.Baudrate;
2:DM1.TSetingBaudrateS.AsVariant:=ComPort1.Baudrate;
end;

case ( Sender as TSpeedButton ).tag of
1:DM1.TSetingPortG.asstring:=ComPort1.port;
2:DM1.TSetingPortS.asstring:=ComPort1.port;
end;

end;

procedure TFSeting.BitBtn1Click(Sender: TObject);
begin
DM1.TSeting.Cancel;
close;
end;

procedure TFSeting.BitBtn2Click(Sender: TObject);
begin

if DM1.TSeting.State=dsEdit then
 DM1.TSeting.Post
else ;

close;
end;

procedure TFSeting.FormCreate(Sender: TObject);
begin
DM1.TSeting.Open;
   ComPort1.port:=DM1.TSetingPortG.asstring;
DM1.TSeting.Close;
end;

procedure TFSeting.FormShow(Sender: TObject);
begin
DM1.TSeting.Open;

end;

procedure TFSeting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM1.TSeting.Close;
end;

end.
