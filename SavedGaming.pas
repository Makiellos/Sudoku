unit SavedGaming;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, jpeg, ExtCtrls, NewGame, DifficultyLvl, MainMenu,
  LogIn, StdCtrls, Buttons;

type
//  TSavedSudoku = record
//    Name: ShortString;
//    DiffLvl: Integer;
//    DateGame: TDateTime;
//    MatrixOne, MatrixTwo, MatrixThree: TArrSudoku;
//  end;
  TPtList = ^TRList;
  TRList = record
//  razbudit' v 16.20!!!!!!!!!!!!!!!!!!!
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
  TSavedGamingForm = class(TForm)
    SGMainImg: TImage;
    SavedSudGrid: TStringGrid;
    SGCheckBtn: TBitBtn;
    SGSaveBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SGCheckBtnClick(Sender: TObject);
    procedure SGSaveBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SavedGamingForm: TSavedGamingForm;
  matrixA, matrixB, matrixC: TArrSudoku;

implementation

uses SavedList;

{$R *.dfm}

constructor TList.Create;
begin
  New(FList);
  FList^.Next := nil;
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
  if FList^.List.Name = '' then
  begin
    FList^.List := SavedSudoku;
  end
  else
  begin
    L := FList;
    for i := 1 to Size do
    begin
      if i = Size then
      begin
        New(L^.Next);
        L^.Next^.List := SavedSudoku;
      end
      else
        L := L^.Next;
    end;
  end;
end;

procedure TSavedGamingForm.FormShow(Sender: TObject);

procedure SavedSudGridDrawCell(ACol, ARow: Integer);
var
  Image: TImage;
  x, y: integer;
begin
  Image := TImage.Create(Self);
  Image.Parent := SavedSudGrid;
  SetCurrentDir('E:\progs\sudoku_new\sudoku\Sudoku');
  Image.Picture.LoadFromFile('Kvadrat-150x150.png');
  Image.Left := (ACol * 41);
  Image.Top := (ARow * 41);
  Image.Width := 41;
  Image.Height := 41;
  Image.Stretch := true;
  Image.Transparent := true;
end;

procedure SortSavedSudoku(var SudokuList);
var
  i: integer;
  L: TPtList;
begin
  
end;

var
  SaveSudoku: TSavedSudoku;
  F: file of TSavedSudoku;
  counter, RowN, i, j: Integer;
begin
  with SavedSudGrid do
  begin
    AssignFile(F, LogUser + IntToStr(SavedListForm.SLGrid.Row) + '.hui');
    Reset(F);
    Read(F,SaveSudoku);
    CloseFile(F);
    MatrixA := SaveSudoku.MatrixOne;
    MatrixB := SaveSudoku.MatrixTwo;
    matrixC := SaveSudoku.MatrixThree;
    for i:= 0 to 8 do
      for j:= 0 to 8 do
      begin
        Cells [i,j] := IntToStr(matrixB [j,i]);
        if matrixA [j,i] = 0 then
          SavedSudGridDrawCell(i,j);
        if (matrixC[j,i] <> 0) and (matrixC[j,i] <> 10) then
          Cells[i,j]:= IntToStr(matrixC [j,i]);
        if (matrixC[j,i] = 0) then
          Cells[i,j]:= '';
      end;
  end;
end;

procedure TSavedGamingForm.SGCheckBtnClick(Sender: TObject);
var
  i,j,choose, RowN: integer;
  IfAllCorrect: Boolean;
  F: file of TSavedSudoku;
begin
  choose:=0;
  IfAllCorrect:=True;
  with SavedSudGrid do
  for i:= 0 to 8 do
  begin
    for j:= 0 to 8 do
    begin
      if SavedSudGrid.Cells[i,j]='' then
      begin
        ShowMessage('Oops! You did not fill all cells!'+#13#10+'Try again.');
        IfAllCorrect:=False;
        Exit;
      end
      else
      begin
        if (matrixA[j,i]<>0) then
        begin
          if (matrixA[j,i]<>StrToInt(SavedSudGrid.Cells[i,j])) then
            inc(choose);
        end;
      end;
    end;
  end;
  if (choose <> 0) then
    ShowMessage('Oops! You had mistaken!'+#13#10+'Try again.')
  else
  begin
    if IfAllCorrect then
    begin
      MessageBox(Handle,PChar('You have successfully completed the game!'
        +#13#10+ 'Congratulations!'), PChar(''), MB_OK);
      DeleteFile(LogUser + IntToStr(SavedListForm.SLGrid.Row) + '.hui');
    end;
  end;
end;

procedure TSavedGamingForm.SGSaveBtnClick(Sender: TObject);
var
  SaveSudoku: TSavedSudoku;
  F: file of TSavedSudoku;
  counter, i, j: Integer;
  P: string;
begin
  with NewGameForm.NewSudokuGrid do
  for i:= 0 to 8 do
    for j:= 0 to 8 do
    begin
      if (Cells[i,j] <> '') and (matrixC [j,i]<>10) then
      matrixC [j,i] := StrToInt(Cells [i,j]);
    end;
  P:=getcurrentdir;
  If not (P = 'E:\progs\sudoku_new\sudoku\Sudoku\'+LogUser) then
  Chdir(LogUser);
  counter:=1;
  while FileExists(LogUser + IntToStr(counter) + '.hui') do
  begin
    inc(counter);
  end;
  AssignFile(F, LogUser + IntToStr(counter) + '.hui');
  Rewrite(F);

  SaveSudoku.Name := LogUser;
  SaveSudoku.DiffLvl := count;
  SaveSudoku.MatrixOne := MatrixA;
  SaveSudoku.MatrixTwo := MatrixB;
  SaveSudoku.MatrixThree := MatrixC;

  SaveSudoku.DateGame := Date;
  write(F, SaveSudoku);
  CloseFile(F);
end;

end.
