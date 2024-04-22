object FSeting: TFSeting
  Left = 534
  Top = 121
  Width = 401
  Height = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 184
    Width = 375
    Height = 9
    Shape = bsTopLine
  end
  object BitBtn1: TBitBtn
    Left = 327
    Top = 528
    Width = 57
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 262
    Top = 528
    Width = 55
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 192
    Width = 377
    Height = 329
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 180
      Width = 78
      Height = 13
      Caption = 'Call Center GSM'
    end
    object Label2: TLabel
      Left = 8
      Top = 208
      Width = 34
      Height = 13
      Caption = 'Sender'
    end
    object SpeedButton2: TSpeedButton
      Tag = 2
      Left = 8
      Top = 297
      Width = 121
      Height = 22
      Caption = 'Port SMS'
      OnClick = SpeedButton1Click
    end
    object Label7: TLabel
      Left = 138
      Top = 8
      Width = 102
      Height = 22
      Caption = 'GSM Seting'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 231
      Width = 127
      Height = 13
      Caption = 'Send To Center Monitoring'
    end
    object Label9: TLabel
      Left = 8
      Top = 255
      Width = 108
      Height = 13
      Caption = 'Delay Send Data GSM'
    end
    object Label10: TLabel
      Left = 206
      Top = 258
      Width = 19
      Height = 13
      Caption = 'Sec'
    end
    object Label11: TLabel
      Left = 256
      Top = 234
      Width = 115
      Height = 13
      Caption = 'Example:989153169999'
    end
    object Label14: TLabel
      Left = 13
      Top = 40
      Width = 30
      Height = 13
      Caption = 'Active'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 65
      Width = 169
      Height = 105
      Caption = 'Format'
      Columns = 2
      DataField = 'Porotocol'
      DataSource = DM1.DSTSeting
      Items.Strings = (
        'Format 7'
        'Format 8'
        'Format 16')
      TabOrder = 0
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 248
      Top = 65
      Width = 113
      Height = 105
      Caption = 'Porotocol'
      DataField = 'Porotocol'
      DataSource = DM1.DSTSeting
      Items.Strings = (
        'TAPI Protocol'
        'UCP Protocol')
      TabOrder = 1
      Values.Strings = (
        '1'
        '2')
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 180
      Width = 129
      Height = 21
      DataField = 'CalCenter'
      DataSource = DM1.DSTSeting
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 204
      Width = 129
      Height = 21
      DataField = 'Sender'
      DataSource = DM1.DSTSeting
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 144
      Top = 231
      Width = 105
      Height = 21
      DataField = 'SendTo'
      DataSource = DM1.DSTSeting
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 144
      Top = 255
      Width = 58
      Height = 21
      DataField = 'DelayToSend'
      DataSource = DM1.DSTSeting
      TabOrder = 5
    end
    object DBComboBox3: TDBComboBox
      Left = 72
      Top = 37
      Width = 59
      Height = 21
      DataField = 'ActiveMonitoring'
      DataSource = DM1.DSTSeting
      ItemHeight = 13
      Items.Strings = (
        'ON'
        'OFF')
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 0
    Width = 377
    Height = 177
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Tag = 1
      Left = 8
      Top = 142
      Width = 121
      Height = 23
      Caption = 'Port Gps'
      OnClick = SpeedButton1Click
    end
    object Label5: TLabel
      Left = 12
      Top = 114
      Width = 34
      Height = 13
      Caption = 'LogFile'
    end
    object Label6: TLabel
      Left = 16
      Top = 38
      Width = 55
      Height = 13
      Caption = 'Drive Install'
    end
    object Label4: TLabel
      Left = 144
      Top = 8
      Width = 95
      Height = 22
      Caption = 'Gps Seting'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 136
      Top = 86
      Width = 52
      Height = 13
      Caption = 'DelaySave'
    end
    object Label13: TLabel
      Left = 254
      Top = 87
      Width = 19
      Height = 13
      Caption = 'Sec'
    end
    object Label1: TLabel
      Left = 0
      Top = 80
      Width = 65
      Height = 13
      Caption = 'SaveLogWay'
    end
    object DBComboBox1: TDBComboBox
      Left = 72
      Top = 111
      Width = 59
      Height = 21
      DataField = 'LogFileOn'
      DataSource = DM1.DSTSeting
      ItemHeight = 13
      Items.Strings = (
        'ON'
        'OFF')
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 79
      Top = 32
      Width = 121
      Height = 21
      DataField = 'DriveInstall'
      DataSource = DM1.DSTSeting
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 192
      Top = 84
      Width = 58
      Height = 21
      DataField = 'DelaySave'
      DataSource = DM1.DSTSeting
      TabOrder = 2
    end
    object DBComboBox2: TDBComboBox
      Left = 72
      Top = 79
      Width = 59
      Height = 21
      DataField = 'SaveLogWay'
      DataSource = DM1.DSTSeting
      ItemHeight = 13
      Items.Strings = (
        'ON'
        'OFF')
      TabOrder = 3
    end
  end
  object ComPort1: TComPort
    BaudRate = br4800
    Port = 'COM4'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    Left = 344
    Top = 136
  end
end
