object SignUpForm: TSignUpForm
  Left = 463
  Top = 293
  Width = 363
  Height = 316
  Caption = 'SignUpForm'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
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
    Top = 104
    Width = 140
    Height = 24
    Hint = ' Enter your login of 7 and less chars'
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = SULoginMaskClick
  end
  object SUPasswordMask: TMaskEdit
    Left = 144
    Top = 168
    Width = 142
    Height = 21
    Hint = 'Enter your password between 4 and 7 chars'
    Color = clScrollBar
    ParentShowHint = False
    PasswordChar = #8226
    ShowHint = True
    TabOrder = 2
    OnClick = SUPasswordMaskClick
  end
  object SUTextLogin: TStaticText
    Left = 32
    Top = 104
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
    Top = 168
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
  object btnConfirmTheReg: TButton
    Left = 163
    Top = 224
    Width = 121
    Height = 33
    Caption = 'Confirm'
    TabOrder = 5
    OnClick = btnConfirmTheRegClick
  end
  object btnBack: TButton
    Left = 24
    Top = 224
    Width = 121
    Height = 33
    Caption = 'Back'
    TabOrder = 6
  end
end
