object LogInForm: TLogInForm
  Left = 503
  Top = 259
  Width = 361
  Height = 316
  Caption = 'LogInForm'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LIText: TStaticText
    Left = 112
    Top = 16
    Width = 99
    Height = 43
    Caption = 'Log In'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object LILoginMask: TMaskEdit
    Left = 144
    Top = 120
    Width = 140
    Height = 21
    Hint = ' Enter your login of 7 and less chars'
    Color = clScrollBar
    EditMask = 'aaaaaaa;0;_'
    MaxLength = 7
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object LITextLogin: TStaticText
    Left = 32
    Top = 120
    Width = 58
    Height = 26
    Caption = 'Login:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object LIPasswordMask: TMaskEdit
    Left = 144
    Top = 184
    Width = 142
    Height = 21
    Hint = 'Enter your password between 4 and 7 chars'
    Color = clScrollBar
    EditMask = 'AAAAaaa;0;_'
    MaxLength = 7
    ParentShowHint = False
    PasswordChar = #8226
    ShowHint = True
    TabOrder = 3
  end
  object LITextPassword: TStaticText
    Left = 24
    Top = 184
    Width = 94
    Height = 26
    Caption = 'Password:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
