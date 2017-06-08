object SignUpForm: TSignUpForm
  Left = 544
  Top = 236
  Width = 361
  Height = 316
  Caption = 'SignUpForm'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SUText: TStaticText
    Left = 112
    Top = 16
    Width = 121
    Height = 43
    Caption = 'Sign Up'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object SULoginMask: TMaskEdit
    Left = 144
    Top = 120
    Width = 140
    Height = 24
    Hint = ' Enter your login of 7 and less chars'
    Color = clScrollBar
    EditMask = 'aaaaaaa;0;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object SUPasswordMask: TMaskEdit
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
    TabOrder = 2
  end
  object SUTextLogin: TStaticText
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
    TabOrder = 3
  end
  object SUTextPassword: TStaticText
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
  object btn1: TButton
    Left = 32
    Top = 32
    Width = 49
    Height = 33
    Caption = 'btn1'
    TabOrder = 5
    OnClick = btn1Click
  end
end
