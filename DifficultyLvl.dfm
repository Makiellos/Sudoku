object DifficultyLvlForm: TDifficultyLvlForm
  Left = 640
  Top = 219
  Width = 374
  Height = 477
  Hint = 'Choose level from 1 to 5'
  Align = alClient
  Caption = 'DifficultyLvlForm'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object DiffLvlLabel: TLabel
    Left = 72
    Top = 16
    Width = 222
    Height = 39
    Caption = 'Difficulty Level'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object DifflvlHelpLabel: TLabel
    Left = 56
    Top = 72
    Width = 256
    Height = 20
    Caption = 'Please, choose your difficulty level:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clSilver
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object DiffLvlEasyLabel: TLabel
    Left = 200
    Top = 168
    Width = 85
    Height = 17
    Caption = 'For beginners'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object DiffLvlMediumLabel: TLabel
    Left = 200
    Top = 232
    Width = 102
    Height = 17
    Caption = 'For well-trainedl'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object DiffLvlHardLabel: TLabel
    Left = 200
    Top = 296
    Width = 102
    Height = 17
    Caption = 'For experienced'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object DiffLvlEasyBtn: TButton
    Left = 40
    Top = 160
    Width = 105
    Height = 41
    Caption = 'Easy'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = DiffLvlEasyBtnClick
  end
  object DiffLvlMediumBtn: TButton
    Left = 40
    Top = 224
    Width = 105
    Height = 41
    Caption = 'Medium'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DiffLvlMediumBtnClick
  end
  object DiffLvlHardBtn: TButton
    Left = 40
    Top = 288
    Width = 105
    Height = 41
    Caption = 'Hard'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = DiffLvlHardBtnClick
  end
  object DiffLvlEsc: TButton
    Left = 240
    Top = 376
    Width = 75
    Height = 25
    Caption = 'exit'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = DiffLvlEscClick
  end
end
