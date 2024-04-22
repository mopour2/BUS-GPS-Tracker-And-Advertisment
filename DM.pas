unit DM;

interface

uses
  SysUtils, Classes, DB, DBTables, ADODB;

type
  TDM1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    DSADOTableSaveLocation: TDataSource;
    ADOTableSaveLocation: TADOTable;
    ADOTableDelta: TADOTable;
    DSADOTableDelta: TDataSource;
    ADOTableDeltaCodCity: TIntegerField;
    ADOTableDeltaLo1: TStringField;
    ADOTableDeltaLa1: TStringField;
    ADOTableDeltaLo2: TStringField;
    ADOTableDeltaLa2: TStringField;
    ADOTableDeltaLo1Deg: TFloatField;
    ADOTableDeltaLa1Deg: TFloatField;
    ADOTableDeltaLo2Deg: TFloatField;
    ADOTableDeltaLa2Deg: TFloatField;
    ADOTableDeltaX1: TIntegerField;
    ADOTableDeltaY1: TIntegerField;
    ADOTableDeltaX2: TIntegerField;
    ADOTableDeltaY2: TIntegerField;
    ADOTableDeltaDLo: TFloatField;
    ADOTableDeltaDLa: TFloatField;
    ADOTableDeltaDX: TIntegerField;
    ADOTableDeltaDY: TIntegerField;
    ADOTableDeltaMapLo1: TStringField;
    ADOTableDeltaMapLa1: TStringField;
    ADOTableDeltaMaplo2: TStringField;
    ADOTableDeltaMapla2: TStringField;
    ADOTableDeltaMapLo1Deg: TFloatField;
    ADOTableDeltaMapLa1Deg: TFloatField;
    ADOTableDeltaMapLo2Deg: TFloatField;
    ADOTableDeltaMapLa2Deg: TFloatField;
    ADOTableDeltaMapX1: TIntegerField;
    ADOTableDeltaMapY1: TIntegerField;
    ADOTableDeltaMapX2: TIntegerField;
    ADOTableDeltaMapY2: TIntegerField;
    ADOTableDeltaMapDLo: TFloatField;
    ADOTableDeltaMapDla: TFloatField;
    ADOTableDeltaMapDX: TFloatField;
    ADOTableDeltaMapDY: TFloatField;
    ADOTableCity: TADOTable;
    DSADOTableCity: TDataSource;
    DSTSeting: TDataSource;
    ADOTableCityCodCity: TIntegerField;
    ADOTableCityNameCity: TStringField;
    ADOTableCityMapName: TStringField;
    ADOTableCityHeight: TIntegerField;
    ADOTableCitywidth: TIntegerField;
    ADOTableCityPathCityVoice: TStringField;
    ADOTableCityLLongitude: TStringField;
    ADOTableCityLLatitude: TStringField;
    ADOTableCityMLongitude: TStringField;
    ADOTableCityMLatitude: TStringField;
    ADOTableCityLLongitudeDeg: TFloatField;
    ADOTableCityLLatitudeDeg: TFloatField;
    ADOTableCityMLongitudeDeg: TFloatField;
    ADOTableCityMLatitudeDeg: TFloatField;
    ADOTableCityFlagSelect: TStringField;
    ADOTLogWay: TADOTable;
    DSADOTLogWay: TDataSource;
    TSeting: TADOTable;
    ADOLine: TADOTable;
    DSADOLine: TDataSource;
    ADOTStation: TADOTable;
    DSADOTStation: TDataSource;
    ADOTRel_Line_Station: TADOTable;
    DSADOTRel_Line_Station: TDataSource;
    ADOLineNumberLine: TBCDField;
    ADOLineNo_Car: TStringField;
    ADOLineDesc1: TStringField;
    ADOLineFlagSelect: TStringField;
    ADOLineCodcity: TIntegerField;
    ADOTStationCodCity: TIntegerField;
    ADOTStationNumberStation: TBCDField;
    ADOTStationDesc1: TStringField;
    ADOTRel_Line_StationCodCity: TIntegerField;
    ADOTRel_Line_StationNumberLine: TBCDField;
    ADOTRel_Line_StationNumberStation: TBCDField;
    ADOTRel_Line_StationDescLine: TStringField;
    ADOTRel_Line_StationDescStation: TStringField;
    ADOTableSaveLocationKeyRec: TBCDField;
    ADOTableSaveLocationCodCity: TIntegerField;
    ADOTableSaveLocationNumberStation: TBCDField;
    ADOTableSaveLocationLongitude: TStringField;
    ADOTableSaveLocationLatitude: TStringField;
    ADOTableSaveLocationLongitudeDeg: TFloatField;
    ADOTableSaveLocationLatitudeDeg: TFloatField;
    ADOTableSaveLocationEWIndicator: TStringField;
    ADOTableSaveLocationNSIndicator: TStringField;
    ADOTableSaveLocationDirect_Lo: TIntegerField;
    ADOTableSaveLocationDirect_La: TIntegerField;
    ADOTableSaveLocationDescription: TStringField;
    ADOTableSaveLocationX: TIntegerField;
    ADOTableSaveLocationY: TIntegerField;
    ADOTableSaveLocationFileNameVoic: TStringField;
    ADOTableSaveLocationFlagVisibl: TStringField;
    ADOTableSaveLocationFlagStation_Tablig: TStringField;
    ADOTLogWayTest: TADOTable;
    DSADOTLogWayTest: TDataSource;
    ADOTLogWayLo: TStringField;
    ADOTLogWayLa: TStringField;
    ADOTLogWayDate1: TStringField;
    ADOTLogWayTime1: TStringField;
    ADOTLogWayCodCity: TIntegerField;
    ADOTLogWayNumberLine: TBCDField;
    ADOTLogWayNoCar: TStringField;
    ADOTLogWayTestLo: TStringField;
    ADOTLogWayTestLa: TStringField;
    ADOTLogWayTestDate1: TStringField;
    ADOTLogWayTestTime1: TStringField;
    ADOTLogWayTestCodCity: TIntegerField;
    ADOTLogWayTestNumberLine: TBCDField;
    ADOTLogWayTestNoCar: TStringField;
    TSetingDriveInstall: TStringField;
    TSetingActiveMonitoring: TStringField;
    TSetingSender: TStringField;
    TSetingSendTo: TStringField;
    TSetingDelayToSend: TIntegerField;
    TSetingComperData: TIntegerField;
    TSetingReception: TStringField;
    TSetingCalCenter: TStringField;
    TSetingFormat: TIntegerField;
    TSetingPorotocol: TIntegerField;
    TSetingUse1: TStringField;
    TSetingPassWord: TStringField;
    TSetingMaxlineActive: TIntegerField;
    TSetingLogFileOn: TStringField;
    TSetingPortG: TStringField;
    TSetingBaudRateG: TStringField;
    TSetingPortS: TStringField;
    TSetingBaudRateS: TStringField;
    TSetingNoPort: TStringField;
    TSetingNoPortActiv: TIntegerField;
    TSetingCarierExplor: TIntegerField;
    TSetingSaveLogWay: TStringField;
    TSetingDelaySave: TIntegerField;
    procedure ADOLineAfterInsert(DataSet: TDataSet);
    procedure ADOTStationAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

uses Manu;

{$R *.dfm}

procedure TDM1.ADOLineAfterInsert(DataSet: TDataSet);
begin
 ADOLineCodcity.AsInteger:=FMenu.MainCodCity;
end;

procedure TDM1.ADOTStationAfterInsert(DataSet: TDataSet);
begin
 ADOTStationCodCity.AsInteger:=FMenu.MainCodCity;
end;

end.
