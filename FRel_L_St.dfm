object FormRel_Line_Station: TFormRel_Line_Station
  Left = 56
  Top = 125
  Width = 1347
  Height = 596
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
    Left = 1135
    Top = 8
    Width = 72
    Height = 22
    AutoSize = False
    Caption = #1604#1610#1587#1578' '#1582#1591' '
    Font.Charset = ARABIC_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 800
    Top = 8
    Width = 94
    Height = 22
    AutoSize = False
    Caption = #1604#1610#1587#1578' '#1575#1610#1587#1578#1711#1575#1607
    Font.Charset = ARABIC_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 379
    Top = 8
    Width = 176
    Height = 22
    AutoSize = False
    Caption = #1604#1610#1587#1578' '#1575#1610#1587#1578#1711#1575#1607' '#1607#1575#1610' '#1610#1705' '#1582#1591
    Font.Charset = ARABIC_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 1008
    Top = 88
    Width = 320
    Height = 465
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumberLine'
        Title.Caption = #1588#1605#1575#1585#1607' '#1582#1591
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
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
        Width = 132
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 672
    Top = 88
    Width = 320
    Height = 465
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOTStation
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
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
        Title.Font.Color = clRed
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc1'
        Title.Caption = #1588#1585#1581
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clRed
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 16
    Top = 88
    Width = 569
    Height = 465
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOTRel_Line_Station
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumberLine'
        Title.Caption = #1588#1605#1575#1585#1607' '#1582#1591
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescLine'
        Title.Caption = #1588#1585#1581' '#1582#1591
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumberStation'
        Title.Caption = #1588#1605#1575#1585#1607' '#1575#1610#1587#1578#1711#1575#1607
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescStation'
        Title.Caption = #1588#1585#1581' '#1575#1610#1587#1578#1711#1575#1607
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 188
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 1048
    Top = 48
    Width = 224
    Height = 25
    DataSource = DM1.DSADOLine
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 3
  end
  object DBNavigator2: TDBNavigator
    Left = 736
    Top = 48
    Width = 224
    Height = 25
    DataSource = DM1.DSADOTStation
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 4
  end
  object DBNavigator3: TDBNavigator
    Left = 352
    Top = 48
    Width = 220
    Height = 25
    DataSource = DM1.DSADOTRel_Line_Station
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 592
    Top = 224
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
end
