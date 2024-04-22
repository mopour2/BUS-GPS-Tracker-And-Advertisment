object FormLine: TFormLine
  Left = 433
  Top = 161
  Width = 638
  Height = 348
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
    Width = 67
    Height = 19
    Caption = ' : '#1588#1605#1575#1585#1607' '#1582#1591
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 527
    Top = 84
    Width = 91
    Height = 19
    Caption = ' : '#1588#1605#1575#1585#1607' '#1575#1578#1608#1576#1608#1587
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
  object Label10: TLabel
    Left = 531
    Top = 136
    Width = 67
    Height = 19
    Caption = ' :'#1582#1591' '#1575#1606#1578#1582#1575#1576#1610
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
    DataSource = DM1.DSADOLine
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 352
    Top = 54
    Width = 161
    Height = 26
    BiDiMode = bdRightToLeft
    DataField = 'NumberLine'
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 288
    Top = 83
    Width = 225
    Height = 26
    BiDiMode = bdRightToLeft
    DataField = 'No_Car'
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 288
    Top = 112
    Width = 225
    Height = 26
    BiDiMode = bdRightToLeft
    DataField = 'Desc1'
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox
    Left = 368
    Top = 136
    Width = 145
    Height = 26
    DataField = 'FlagSelect'
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 18
    Items.Strings = (
      #1601#1593#1575#1604
      #1594#1610#1585' '#1601#1593#1575#1604)
    ParentFont = False
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 178
    Width = 600
    Height = 128
    BiDiMode = bdRightToLeft
    DataSource = DM1.DSADOLine
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
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
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'No_Car'
        Title.Caption = #1588#1605#1575#1585#1607' '#1605#1575#1588#1610#1606
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc1'
        Title.Caption = #1588#1585#1581
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FlagSelect'
        Title.Caption = #1608#1590#1593#1610#1578
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clPurple
        Title.Font.Height = -15
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
end
