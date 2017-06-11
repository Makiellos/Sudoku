object SavedListForm: TSavedListForm
  Left = 242
  Top = 292
  Width = 913
  Height = 574
  Caption = 'SavedListForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SLGrid: TStringGrid
    Left = 64
    Top = 64
    Width = 465
    Height = 465
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnMouseDown = SLGridMouseDown
    ColWidths = (
      83
      261
      96)
  end
  object SLSortBtn: TButton
    Left = 592
    Top = 112
    Width = 129
    Height = 49
    Caption = 'Sort by difficulty'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = SLSortBtnClick
  end
end
