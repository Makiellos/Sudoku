unit SavedList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, NewGame, LogIn, MainMenu, SavedGaming,
  StdCtrls;

type
  TPtList = ^TRList;
  TRList = record
    List: TSavedSudoku;
    Next: TPtList;
  end;
  TList = class
    FList: TPtList;
    constructor Create;
    procedure Insert(const SavedSudoku: TSavedSudoku);
    function IsEmpty: Boolean;
    function GetSize: Integer;
    property Empty: Boolean read IsEmpty;
    property Size: Integer read GetSize;
  end;
  TSavedListForm = class(TForm)
    SLGrid: TStringGrid;
    SLSortBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SLGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SLSortBtnClick(Sender: TObject);
    procedure FullSavedSudoku(var SudokuList: TList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SavedListForm: TSavedListForm;
  ACol, ARow: Integer;
  SudokuList: TList;

implementation



{$R *.dfm}


constructor TList.Create;
var
  L: TPtList;
begin
  New(FList);
  L := FList;
  L^.Next := nil;
  L^.List.Name := '';
end;

function TList.IsEmpty: Boolean;
begin
  if FList^.List.Name = '' then
    Result := True
  else
    Result := False;
end;

function TList.GetSize: integer;
var
  L: TPtList;
begin
  L := FList;
  Result := 0;
  if not Empty then
    repeat
      inc(Result);
      L := L^.Next;
    until L = nil;
end;

procedure TList.Insert(const SavedSudoku: TSavedSudoku);
var
  L: TPtList;
  i: integer;
begin
   L := FList;
  if L^.List.Name = '' then
  begin
    L^.List := SavedSudoku;
  end
  else
  begin
    for i := 1 to Size do
    begin
      if i = Size then
      begin
        New(L^.Next);
        L^.Next^.List := SavedSudoku;
        L^.Next^.Next := nil;
      end
      else
        L := L^.Next;
    end;
  end;
end;

procedure TSavedListForm.FullSavedSudoku(var SudokuList: TList);
var
  i: integer;
  L: TPtList;
  SaveSudoku: TSavedSudoku;
  F: file of TSavedSudoku;
  counter, RowN: Integer;
  P: string;
begin
    P:=getcurrentdir;
  If not (P = 'E:\progs\sudoku_new\sudoku\Sudoku\'+LogUser) then
  Chdir(LogUser);
  with SavedListForm.SLGrid do
  begin
    Cells[0,0] := 'Date:';
    Cells[1,0] := 'Name of the game:';
    Cells[2,0] := 'Difficulty;';
  end;
  counter := 1;
  RowN := 1;
  SudokuList := TList.Create;
  while FileExists(LogUser + IntToStr(counter) + '.sud') do
  begin
    AssignFile(F, LogUser + IntToStr(counter) + '.sud');
    Reset(F);
    Read(F,SaveSudoku);

    with SavedListForm.SLGrid do
    begin
      RowCount:=RowCount+1;
      Cells[0, RowN] := DateToStr(SaveSudoku.DateGame);
      Cells[1, RowN] := LogUser + IntToStr(counter);
      case SaveSudoku.DiffLvl of
        7: Cells[2, RowN] := 'Easy';
        6: Cells[2, RowN] := 'Medium';
        5: Cells[2, RowN] := 'Hard';
      end;
    end;
    SaveSudoku.Name := LogUser+IntToStr(counter);
    SudokuList.Insert(SaveSudoku);
    CloseFile(F);
    inc(counter);
    inc(RowN);
  end;
end;

procedure TSavedListForm.FormShow(Sender: TObject);
begin
  FullSavedSudoku(SudokuList);
end;

procedure TSavedListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainMenuForm.Show;
  FreeAndNil(SudokuList);
end;

procedure TSavedListForm.SLGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ACol, ARow: Integer;
begin
  SLGrid.MouseToCell(X, Y, ACol, ARow);
  SLGrid.Row:=ARow;
  Hide;
  SavedGamingForm.Show;
end;

procedure TSavedListForm.SLSortBtnClick(Sender: TObject);
var
  tmp,x:TPtList;
  tmps:TSavedSudoku;
  counter, RowN: integer;
begin
  x := SudokuList.FList;
  while x <> nil do
  begin
    tmp := x^.next;
    while tmp <> nil do
    begin
      if tmp^.List.DiffLvl < x^.List.DiffLvl then
      begin
        tmps := tmp^.List;
        tmp^.List := x^.List;
        x^.List := tmps
      end;
      tmp := tmp^.next
    end;
    x := x ^.next
  end;
  RowN := 1;
  x := SudokuList.FList;
  for counter := 1 to SudokuList.Size do
  begin
    with SLGrid do
    begin
      Cells[0, RowN] := DateToStr(x^.List.DateGame);
      Cells[1, RowN] := x^.List.Name;
      case x^.List.DiffLvl of
        7: Cells[2, RowN] := 'Easy';
        6: Cells[2, RowN] := 'Medium';
        5: Cells[2, RowN] := 'Hard';
      end;
    end;
    inc(RowN);
    x := x^.Next;
  end;

end;


end.
