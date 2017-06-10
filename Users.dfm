object UsersForm: TUsersForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'UsersForm'
  ClientHeight = 266
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbUsers: TListBox
    Left = 8
    Top = 16
    Width = 225
    Height = 177
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ItemHeight = 18
    ParentFont = False
    TabOrder = 0
  end
  object btnChoose: TButton
    Left = 8
    Top = 216
    Width = 97
    Height = 33
    Caption = 'Choose'
    TabOrder = 1
    OnClick = btnChooseClick
  end
  object btnDelUser: TButton
    Left = 136
    Top = 216
    Width = 97
    Height = 33
    Caption = 'Delete'
    TabOrder = 2
    OnClick = btnDelUserClick
  end
end
