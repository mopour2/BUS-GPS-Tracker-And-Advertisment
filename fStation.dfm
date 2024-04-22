object FormStation: TFormStation
  Left = 479
  Top = 122
  Width = 648
  Height = 372
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
    Left = 543
    Top = 55
    Width = 91
    Height = 19
    Caption = ' : '#1588#1605#1575#1585#1607' '#1575#1610#1587#1578#1711#1575#1607
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 551
    Top = 89
    Width = 36
    Height = 19
    Caption = ': '#1588#1585#1581
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 200
    Top = 8
    Width = 240
    Height = 25
    DataSource = DM1.DSADOTStation
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 376
    Top = 54
    Width = 161
    Height = 24
    BiDiMode = bdRightToLeft
    DataField = 'NumberStation'
    DataSource = DM1.DSADOTStation
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 312
    Top = 88
    Width = 225
    Height = 24
    BiDiMode = bdRightToLeft
    DataField = 'Desc1'
    DataSource = DM1.DSADOTStation
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 178
    Width = 600
    Height = 128
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOTStation
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumberStation'
        Title.Caption = #1588#1605#1575#1585#1607' '#1575#1610#1587#1578#1711#1575#1607
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc1'
        Title.Caption = #1588#1585#1581
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 392
        Visible = True
      end>
  end
end
