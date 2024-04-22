object DM1: TDM1
  OldCreateOrder = False
  Left = 555
  Top = 119
  Height = 519
  Width = 464
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=BUS;Data Source=st2'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 399
    Top = 14
  end
  object DSADOTableSaveLocation: TDataSource
    DataSet = ADOTableSaveLocation
    Left = 120
    Top = 136
  end
  object ADOTableSaveLocation: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TGps_bus'
    Left = 48
    Top = 136
    object ADOTableSaveLocationKeyRec: TBCDField
      FieldName = 'KeyRec'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object ADOTableSaveLocationCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTableSaveLocationNumberStation: TBCDField
      FieldName = 'NumberStation'
      Precision = 18
      Size = 0
    end
    object ADOTableSaveLocationLongitude: TStringField
      FieldName = 'Longitude'
    end
    object ADOTableSaveLocationLatitude: TStringField
      FieldName = 'Latitude'
    end
    object ADOTableSaveLocationLongitudeDeg: TFloatField
      FieldName = 'LongitudeDeg'
    end
    object ADOTableSaveLocationLatitudeDeg: TFloatField
      FieldName = 'LatitudeDeg'
    end
    object ADOTableSaveLocationEWIndicator: TStringField
      FieldName = 'EWIndicator'
      Size = 10
    end
    object ADOTableSaveLocationNSIndicator: TStringField
      FieldName = 'NSIndicator'
      Size = 10
    end
    object ADOTableSaveLocationDirect_Lo: TIntegerField
      FieldName = 'Direct_Lo'
    end
    object ADOTableSaveLocationDirect_La: TIntegerField
      FieldName = 'Direct_La'
    end
    object ADOTableSaveLocationDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object ADOTableSaveLocationX: TIntegerField
      FieldName = 'X'
    end
    object ADOTableSaveLocationY: TIntegerField
      FieldName = 'Y'
    end
    object ADOTableSaveLocationFileNameVoic: TStringField
      FieldName = 'FileNameVoic'
    end
    object ADOTableSaveLocationFlagVisibl: TStringField
      FieldName = 'FlagVisibl'
      Size = 1
    end
    object ADOTableSaveLocationFlagStation_Tablig: TStringField
      FieldName = 'FlagStation_Tablig'
      Size = 1
    end
  end
  object ADOTableDelta: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TDelta'
    Left = 48
    Top = 192
    object ADOTableDeltaCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTableDeltaLo1: TStringField
      FieldName = 'Lo1'
    end
    object ADOTableDeltaLa1: TStringField
      FieldName = 'La1'
    end
    object ADOTableDeltaLo2: TStringField
      FieldName = 'Lo2'
    end
    object ADOTableDeltaLa2: TStringField
      FieldName = 'La2'
    end
    object ADOTableDeltaLo1Deg: TFloatField
      FieldName = 'Lo1Deg'
    end
    object ADOTableDeltaLa1Deg: TFloatField
      FieldName = 'La1Deg'
    end
    object ADOTableDeltaLo2Deg: TFloatField
      FieldName = 'Lo2Deg'
    end
    object ADOTableDeltaLa2Deg: TFloatField
      FieldName = 'La2Deg'
    end
    object ADOTableDeltaX1: TIntegerField
      FieldName = 'X1'
    end
    object ADOTableDeltaY1: TIntegerField
      FieldName = 'Y1'
    end
    object ADOTableDeltaX2: TIntegerField
      FieldName = 'X2'
    end
    object ADOTableDeltaY2: TIntegerField
      FieldName = 'Y2'
    end
    object ADOTableDeltaDLo: TFloatField
      FieldName = 'DLo'
    end
    object ADOTableDeltaDLa: TFloatField
      FieldName = 'DLa'
    end
    object ADOTableDeltaDX: TIntegerField
      FieldName = 'DX'
    end
    object ADOTableDeltaDY: TIntegerField
      FieldName = 'DY'
    end
    object ADOTableDeltaMapLo1: TStringField
      FieldName = 'MapLo1'
    end
    object ADOTableDeltaMapLa1: TStringField
      FieldName = 'MapLa1'
    end
    object ADOTableDeltaMaplo2: TStringField
      FieldName = 'Maplo2'
    end
    object ADOTableDeltaMapla2: TStringField
      FieldName = 'Mapla2'
    end
    object ADOTableDeltaMapLo1Deg: TFloatField
      FieldName = 'MapLo1Deg'
    end
    object ADOTableDeltaMapLa1Deg: TFloatField
      FieldName = 'MapLa1Deg'
    end
    object ADOTableDeltaMapLo2Deg: TFloatField
      FieldName = 'MapLo2Deg'
    end
    object ADOTableDeltaMapLa2Deg: TFloatField
      FieldName = 'MapLa2Deg'
    end
    object ADOTableDeltaMapX1: TIntegerField
      FieldName = 'MapX1'
    end
    object ADOTableDeltaMapY1: TIntegerField
      FieldName = 'MapY1'
    end
    object ADOTableDeltaMapX2: TIntegerField
      FieldName = 'MapX2'
    end
    object ADOTableDeltaMapY2: TIntegerField
      FieldName = 'MapY2'
    end
    object ADOTableDeltaMapDLo: TFloatField
      FieldName = 'MapDLo'
    end
    object ADOTableDeltaMapDla: TFloatField
      FieldName = 'MapDla'
    end
    object ADOTableDeltaMapDX: TFloatField
      FieldName = 'MapDX'
    end
    object ADOTableDeltaMapDY: TFloatField
      FieldName = 'MapDY'
    end
  end
  object DSADOTableDelta: TDataSource
    DataSet = ADOTableDelta
    Left = 120
    Top = 192
  end
  object ADOTableCity: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TCity'
    Left = 48
    Top = 256
    object ADOTableCityCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTableCityNameCity: TStringField
      FieldName = 'NameCity'
      Size = 50
    end
    object ADOTableCityMapName: TStringField
      FieldName = 'MapName'
      Size = 50
    end
    object ADOTableCityHeight: TIntegerField
      FieldName = 'Height'
    end
    object ADOTableCitywidth: TIntegerField
      FieldName = 'width'
    end
    object ADOTableCityPathCityVoice: TStringField
      FieldName = 'PathCityVoice'
    end
    object ADOTableCityLLongitude: TStringField
      FieldName = 'LLongitude'
    end
    object ADOTableCityLLatitude: TStringField
      FieldName = 'LLatitude'
    end
    object ADOTableCityMLongitude: TStringField
      FieldName = 'MLongitude'
    end
    object ADOTableCityMLatitude: TStringField
      FieldName = 'MLatitude'
    end
    object ADOTableCityLLongitudeDeg: TFloatField
      FieldName = 'LLongitudeDeg'
    end
    object ADOTableCityLLatitudeDeg: TFloatField
      FieldName = 'LLatitudeDeg'
    end
    object ADOTableCityMLongitudeDeg: TFloatField
      FieldName = 'MLongitudeDeg'
    end
    object ADOTableCityMLatitudeDeg: TFloatField
      FieldName = 'MLatitudeDeg'
    end
    object ADOTableCityFlagSelect: TStringField
      FieldName = 'FlagSelect'
      Size = 10
    end
  end
  object DSADOTableCity: TDataSource
    DataSet = ADOTableCity
    Left = 120
    Top = 256
  end
  object DSTSeting: TDataSource
    DataSet = TSeting
    Left = 120
    Top = 64
  end
  object ADOTLogWay: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TLogWay'
    Left = 48
    Top = 306
    object ADOTLogWayLo: TStringField
      FieldName = 'Lo'
    end
    object ADOTLogWayLa: TStringField
      FieldName = 'La'
    end
    object ADOTLogWayDate1: TStringField
      FieldName = 'Date1'
      Size = 15
    end
    object ADOTLogWayTime1: TStringField
      FieldName = 'Time1'
      Size = 15
    end
    object ADOTLogWayCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTLogWayNumberLine: TBCDField
      FieldName = 'NumberLine'
      Precision = 10
      Size = 0
    end
    object ADOTLogWayNoCar: TStringField
      FieldName = 'NoCar'
    end
  end
  object DSADOTLogWay: TDataSource
    DataSet = ADOTLogWay
    Left = 120
    Top = 306
  end
  object TSeting: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'setingSMS'
    Left = 48
    Top = 64
    object TSetingDriveInstall: TStringField
      FieldName = 'DriveInstall'
    end
    object TSetingActiveMonitoring: TStringField
      FieldName = 'ActiveMonitoring'
    end
    object TSetingSender: TStringField
      FieldName = 'Sender'
    end
    object TSetingSendTo: TStringField
      FieldName = 'SendTo'
    end
    object TSetingDelayToSend: TIntegerField
      FieldName = 'DelayToSend'
    end
    object TSetingComperData: TIntegerField
      FieldName = 'ComperData'
    end
    object TSetingReception: TStringField
      FieldName = 'Reception'
    end
    object TSetingCalCenter: TStringField
      FieldName = 'CalCenter'
    end
    object TSetingFormat: TIntegerField
      FieldName = 'Format'
    end
    object TSetingPorotocol: TIntegerField
      FieldName = 'Porotocol'
    end
    object TSetingUse1: TStringField
      FieldName = 'Use1'
    end
    object TSetingPassWord: TStringField
      FieldName = 'PassWord'
    end
    object TSetingMaxlineActive: TIntegerField
      FieldName = 'MaxlineActive'
    end
    object TSetingLogFileOn: TStringField
      FieldName = 'LogFileOn'
    end
    object TSetingPortG: TStringField
      FieldName = 'PortG'
      Size = 10
    end
    object TSetingBaudRateG: TStringField
      FieldName = 'BaudRateG'
      Size = 10
    end
    object TSetingPortS: TStringField
      FieldName = 'PortS'
      Size = 10
    end
    object TSetingBaudRateS: TStringField
      FieldName = 'BaudRateS'
      Size = 10
    end
    object TSetingNoPort: TStringField
      FieldName = 'NoPort'
      Size = 10
    end
    object TSetingNoPortActiv: TIntegerField
      FieldName = 'NoPortActiv'
    end
    object TSetingCarierExplor: TIntegerField
      FieldName = 'CarierExplor'
    end
    object TSetingSaveLogWay: TStringField
      FieldName = 'SaveLogWay'
      Size = 10
    end
    object TSetingDelaySave: TIntegerField
      FieldName = 'DelaySave'
    end
  end
  object ADOLine: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = ADOLineAfterInsert
    TableName = 'TLine'
    Left = 248
    Top = 192
    object ADOLineNumberLine: TBCDField
      FieldName = 'NumberLine'
      Precision = 18
      Size = 0
    end
    object ADOLineNo_Car: TStringField
      FieldName = 'No_Car'
    end
    object ADOLineDesc1: TStringField
      FieldName = 'Desc1'
      Size = 50
    end
    object ADOLineFlagSelect: TStringField
      FieldName = 'FlagSelect'
      Size = 10
    end
    object ADOLineCodcity: TIntegerField
      FieldName = 'Codcity'
    end
  end
  object DSADOLine: TDataSource
    DataSet = ADOLine
    Left = 320
    Top = 192
  end
  object ADOTStation: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = ADOTStationAfterInsert
    TableName = 'TStation'
    Left = 248
    Top = 256
    object ADOTStationCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTStationNumberStation: TBCDField
      FieldName = 'NumberStation'
      Precision = 18
      Size = 0
    end
    object ADOTStationDesc1: TStringField
      FieldName = 'Desc1'
      Size = 50
    end
  end
  object DSADOTStation: TDataSource
    DataSet = ADOTStation
    Left = 320
    Top = 256
  end
  object ADOTRel_Line_Station: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TRel_Line_Station'
    Left = 248
    Top = 306
    object ADOTRel_Line_StationCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTRel_Line_StationNumberLine: TBCDField
      FieldName = 'NumberLine'
      Precision = 18
      Size = 0
    end
    object ADOTRel_Line_StationNumberStation: TBCDField
      FieldName = 'NumberStation'
      Precision = 18
      Size = 0
    end
    object ADOTRel_Line_StationDescLine: TStringField
      FieldKind = fkLookup
      FieldName = 'DescLine'
      LookupDataSet = ADOLine
      LookupKeyFields = 'NumberLine'
      LookupResultField = 'Desc1'
      KeyFields = 'NumberLine'
      Lookup = True
    end
    object ADOTRel_Line_StationDescStation: TStringField
      FieldKind = fkLookup
      FieldName = 'DescStation'
      LookupDataSet = ADOTStation
      LookupKeyFields = 'NumberStation'
      LookupResultField = 'Desc1'
      KeyFields = 'NumberStation'
      Lookup = True
    end
  end
  object DSADOTRel_Line_Station: TDataSource
    DataSet = ADOTRel_Line_Station
    Left = 320
    Top = 306
  end
  object ADOTLogWayTest: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TLogWayTest'
    Left = 48
    Top = 362
    object ADOTLogWayTestLo: TStringField
      FieldName = 'Lo'
    end
    object ADOTLogWayTestLa: TStringField
      FieldName = 'La'
    end
    object ADOTLogWayTestDate1: TStringField
      FieldName = 'Date1'
      Size = 15
    end
    object ADOTLogWayTestTime1: TStringField
      FieldName = 'Time1'
      Size = 15
    end
    object ADOTLogWayTestCodCity: TIntegerField
      FieldName = 'CodCity'
    end
    object ADOTLogWayTestNumberLine: TBCDField
      FieldName = 'NumberLine'
      Precision = 10
      Size = 0
    end
    object ADOTLogWayTestNoCar: TStringField
      FieldName = 'NoCar'
    end
  end
  object DSADOTLogWayTest: TDataSource
    DataSet = ADOTLogWayTest
    Left = 120
    Top = 362
  end
end
