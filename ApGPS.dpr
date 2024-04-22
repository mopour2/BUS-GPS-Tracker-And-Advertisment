program MiniTerm;

uses
  Forms,
  Manu in 'Manu.pas' {FMenu},
  Seting in 'Seting.pas' {FSeting},
  DM in 'DM.pas' {DM1: TDataModule},
  FSaveLocation in 'FSaveLocation.pas' {FormSaveLocation},
  FTabligat in 'FTabligat.pas' {FormTablig},
  FDelta2 in 'FDelta2.pas' {FormDelta2},
  UCity in 'UCity.pas' {FormCity},
  FLine in 'FLine.pas' {FormLine},
  fStation in 'fStation.pas' {FormStation},
  FRel_L_St in 'FRel_L_St.pas' {FormRel_Line_Station},
  USMS in 'USMS.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'GPS';
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFSeting, FSeting);
  Application.CreateForm(TFormSaveLocation, FormSaveLocation);
  Application.CreateForm(TFormTablig, FormTablig);
  Application.CreateForm(TFormDelta2, FormDelta2);
  Application.CreateForm(TFormCity, FormCity);
  Application.CreateForm(TFormLine, FormLine);
  Application.CreateForm(TFormStation, FormStation);
  Application.CreateForm(TFormRel_Line_Station, FormRel_Line_Station);
  Application.Run;
end.
