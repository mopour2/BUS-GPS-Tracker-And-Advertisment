object FormCity: TFormCity
  Left = 374
  Top = 137
  Width = 657
  Height = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 535
    Top = 55
    Width = 53
    Height = 19
    Caption = ' : '#1705#1583' '#1588#1607#1585
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 535
    Top = 84
    Width = 56
    Height = 19
    Caption = ' :'#1606#1575#1605' '#1588#1607#1585' '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 535
    Top = 113
    Width = 58
    Height = 19
    Caption = ': '#1606#1575#1605' '#1606#1602#1588#1607' '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 535
    Top = 143
    Width = 79
    Height = 19
    Caption = ' : '#1605#1610#1606#1610#1605#1608#1605' '#1591#1608#1604
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 535
    Top = 201
    Width = 84
    Height = 19
    Caption = ' :'#1605#1575#1705#1586#1610#1605#1608#1605' '#1591#1608#1604
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 535
    Top = 172
    Width = 90
    Height = 19
    Caption = ' : '#1605#1610#1606#1610#1605#1608#1605' '#1593#1585#1590
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 535
    Top = 231
    Width = 99
    Height = 19
    Caption = ' : '#1605#1575#1705#1586#1610#1605#1608#1605' '#1593#1585#1590
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 256
    Top = 111
    Width = 47
    Height = 19
    Caption = ' : '#1575#1585#1578#1601#1575#1593
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 134
    Top = 111
    Width = 47
    Height = 19
    Caption = ' : '#1593#1585#1590
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 535
    Top = 256
    Width = 75
    Height = 19
    Caption = ' :'#1588#1607#1585' '#1575#1606#1578#1582#1575#1576#1610
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 239
    Top = 145
    Width = 98
    Height = 19
    Caption = ': '#1605#1587#1610#1585' '#1601#1575#1610#1604' '#1589#1608#1578#1610
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 368
    Top = 54
    Width = 161
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'CodCity'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 304
    Top = 83
    Width = 225
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'NameCity'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 304
    Top = 112
    Width = 225
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'MapName'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 344
    Top = 142
    Width = 185
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'LLongitude'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 344
    Top = 171
    Width = 185
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'LLatitude'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 344
    Top = 200
    Width = 185
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'MLongitude'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 344
    Top = 230
    Width = 185
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'MLatitude'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 6
  end
  object DBNavigator1: TDBNavigator
    Left = 192
    Top = 8
    Width = 240
    Height = 25
    DataSource = DM1.DSADOTableCity
    TabOrder = 7
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 288
    Width = 617
    Height = 128
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CodCity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameCity'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MapName'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LLongitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LLatitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MLongitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MLatitude'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LLongitudeDeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LLatitudeDeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MLongitudeDeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MLatitudeDeg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FlagSelect'
        Visible = True
      end>
  end
  object DBComboBox1: TDBComboBox
    Left = 384
    Top = 256
    Width = 145
    Height = 21
    DataField = 'FlagSelect'
    DataSource = DM1.DSADOTableCity
    ItemHeight = 13
    Items.Strings = (
      #1601#1593#1575#1604
      #1594#1610#1585' '#1601#1593#1575#1604)
    TabOrder = 9
  end
  object DBEdit8: TDBEdit
    Left = 191
    Top = 112
    Width = 73
    Height = 21
    DataField = 'Height'
    DataSource = DM1.DSADOTableCity
    TabOrder = 10
  end
  object DBEdit9: TDBEdit
    Left = 55
    Top = 112
    Width = 73
    Height = 21
    DataField = 'width'
    DataSource = DM1.DSADOTableCity
    TabOrder = 11
  end
  object DBEdit10: TDBEdit
    Left = 8
    Top = 144
    Width = 225
    Height = 21
    BiDiMode = bdRightToLeft
    DataField = 'PathCityVoice'
    DataSource = DM1.DSADOTableCity
    ParentBiDiMode = False
    TabOrder = 12
  end
end
