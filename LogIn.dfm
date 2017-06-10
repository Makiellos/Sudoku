object LogInForm: TLogInForm
  Left = 470
  Top = 188
  Width = 378
  Height = 316
  Caption = 'LogInForm'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
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
    Top = 104
    Width = 140
    Height = 21
    Hint = ' Enter your login of 7 and less chars'
    Color = clScrollBar
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = LILoginMaskClick
  end
  object LITextLogin: TStaticText
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
    TabOrder = 2
  end
  object LIPasswordMask: TMaskEdit
    Left = 144
    Top = 168
    Width = 142
    Height = 21
    Hint = 'Enter your password between 4 and 7 chars'
    Color = clScrollBar
    ParentShowHint = False
    PasswordChar = #8226
    ShowHint = True
    TabOrder = 3
    OnClick = LIPasswordMaskClick
  end
  object LITextPassword: TStaticText
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
    Left = 216
    Top = 224
    Width = 78
    Height = 33
    Caption = 'Confirm'
    TabOrder = 5
    OnClick = btnConfirmTheRegClick
  end
  object btnBack: TButton
    Left = 24
    Top = 224
    Width = 81
    Height = 33
    Caption = 'Back'
    TabOrder = 6
    OnClick = btnBackClick
  end
  object btnUsers: TButton
    Left = 120
    Top = 224
    Width = 82
    Height = 33
    Caption = 'Users'
    TabOrder = 7
    OnClick = btnUsersClick
  end
end
