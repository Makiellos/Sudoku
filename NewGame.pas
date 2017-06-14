unit NewGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Math, jpeg, ExtCtrls, pngimage, StdCtrls, Buttons, LogIn;

type
  TNewGameForm = class(TForm)
    NewSudokuGrid: TStringGrid;
    NGFieldPic: TImage;
    NGCheckBtn: TBitBtn;
    NGSaveBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure NGCheckBtnClick(Sender: TObject);
   procedure NGSaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  end;
type
  TArrSudoku = array[0..8, 0..8] of Integer;
  TSavedSudoku = record
    Name: ShortString;
    DiffLvl: Integer;
    DateGame: TDateTime;
    MatrixOne, MatrixTwo, MatrixThree: TArrSudoku;
  end;
var
  NewGameForm: TNewGameForm;
  matrixA, matrixB, matrixC: TArrSudoku;
  count: Integer;
  Image: TImage;

implementation

uses
  DifficultyLvl, MainMenu;

{$R *.dfm}

procedure TNewGameForm.FormShow(Sender: TObject);

procedure BasicRowGenerate;
var i, k, temp: Integer;
begin
  with NewGameForm.NewSudokuGrid do
    for i:=0 to 8 do
      Cells[i,0]:= IntToStr(i+1);
    with NewGameForm.NewSudokuGrid do
    for i:=0 to 8 do
    begin
      temp:= StrToInt(Cells[i,0]);
      k:= RandomRange(0,8);
      Cells[i,0]:= Cells[k,0];
      Cells[k,0]:= IntToStr(temp);
    end;
end;

procedure NewNextRow(j: integer);
var
  i, k, n: integer;
begin
  k := 3;
  n := 0;
  with NewGameForm.NewSudokuGrid do
    for i:=0 to 2 do
    Cells[n+i,j] := Cells[k+i,j-1];
  k := k+3;
  n := n+3;
  with NewGameForm.NewSudokuGrid do
    for i:=0 to 2 do
    Cells[n+i,j] := Cells[k+i,j-1];
  k := 0;
  n := 6;
  with NewGameForm.NewSudokuGrid do
    for i:=0 to 2 do
    Cells[n+i,j] := Cells[k+i,j-1];
end;

procedure NewRow (j,r: integer);
var
  i, k, p: integer;
begin
  k := 1;
  with NewGameForm.NewSudokuGrid do
    for i:=0 to 2 do
    begin
      p := k+i*3;
      Cells[p,j] := Cells[p+1,r];
      Cells[p+1,j] := Cells[p-1,r];
      Cells[p-1,j] := Cells[p,r];
    end;
end;

procedure SwapRows(FRow, SRow: integer);
var
  i: integer;
  temp: string;
begin
  with NewGameForm.NewSudokuGrid do
  for i:=0 to 8 do
  begin
    temp := Cells[i,Frow];
    Cells[i,Frow] := Cells[i,SRow];
    Cells[i,SRow] := temp;
  end;
end;

procedure SwapCols(FCol, SCol: integer);
var
  j: integer;
  temp: string;
begin
  with NewGameForm.NewSudokuGrid do
  for j:=0 to 8 do
  begin
    temp := Cells[FCol,j];
    Cells[FCol,j] := Cells[SCol,j];
    Cells[SCol,j] := temp;
  end;
end;

procedure SwapTripleRows(FRow, SRow: integer);
var
  i, k: integer;
  temp: string;
begin
  with NewGameForm.NewSudokuGrid do
  begin
    for i:=0 to 8 do
      for k:=-1 to 1 do
      begin
        temp := Cells[i,Frow+k];
        Cells[i,Frow+k] := Cells[i,SRow+k];
        Cells[i,SRow+k] := temp;
      end;
  end
end;

procedure SwapTripleCols(FCol, SCol: integer);
var
  j, k: integer;
  temp: string;
begin
  with NewGameForm.NewSudokuGrid do
  begin
    for j:=0 to 8 do
      for k:=-1 to 1 do
      begin
        temp := Cells[FCol+k,j];
        Cells[FCol+k,j] := Cells[SCol+k,j];
        Cells[SCol+k,j] := temp;
      end;
  end;
end;

procedure Transposing;
var
  i, j: Integer;
  temp: string;
begin
  with NewGameForm.NewSudokuGrid do
  begin
    for i:=0 to 8 do
      for j:=0 to 8 do
      begin
        temp := Cells[i,j];
        Cells[i,j] := Cells[j,i];
        Cells[j,i] := temp;
      end;
  end;
end;

procedure NewSudokuGridDrawCell(ACol, ARow: Integer);
var
  x, y: integer;
begin
  Image := TImage.Create(Self);
  Image.Parent := NewsudokuGrid;
  SetCurrentDir('E:\progs\sudoku_new\sudoku\Sudoku');
  Image.Picture.LoadFromFile('Kvadrat-150x150.png');
  Image.Left := (ACol * 41);
  Image.Top := (ARow * 41);
  Image.Width := 41;
  Image.Height := 41;
  Image.Stretch := true;
  Image.Transparent := true;
end;

procedure RandomHide(Col, Row, count: integer );
var
  temp, i, j, tempCount: Integer;
begin
  tempCount := 0;
  for i:=Col to Col+2 do
  begin
    for j:=Row to Row+2 do
    begin
      temp:=RandomRange(1,10);
      if temp < count then
      begin
        NewSudokuGridDrawCell(i, j);
        matrixA [j,i]:=0;
        matrixC [j,i] := 10;
      end
      else
      begin
        with NewGameForm.NewSudokuGrid do
        begin
          Cells[i,j]:= '';
          matrixC [j,i] := 0;
        end;
      end;
    end;
  end;
end;

procedure HideCells;
begin
  if DifficultyLvlForm.DiffEasy then
  begin
    count:=7;
  end;
  if DifficultyLvlForm.DiffMedium then
  begin
    count:=6;
  end;
  if DifficultyLvlForm.DiffHard then
  begin
    count:=5;
  end;

  RandomHide(0,0,count);
  RandomHide(0,3,count);
  RandomHide(0,6,count);

  RandomHide(3,0,count);
  RandomHide(3,3,count);
  RandomHide(3,6,count);

  RandomHide(6,0,count);
  RandomHide(6,3,count);
  RandomHide(6,6,count);
end;

procedure RandomSwap;
var
  temp, tempF, tempS: Integer;
begin
  temp := RandomRange(1,3);
  if temp=1 then
  begin
    case RandomRange(1,3) of
      1: tempF := 0;
      2: tempF := 1;
      3: tempF := 2;
    end;
    case RandomRange(1,3) of
      1: tempS := 0;
      2: tempS := 1;
      3: tempS := 2;
    end;
  end;
  if temp=2 then
  begin
    case RandomRange(1,3) of
      1: tempF := 3;
      2: tempF := 4;
      3: tempF := 5;
    end;
    case RandomRange(1,3) of
      1: tempS := 3;
      2: tempS := 4;
      3: tempS := 5;
    end;
  end;
  if temp=3 then
  begin
    case RandomRange(1,3) of
      1: tempF := 6;
      2: tempF := 7;
      3: tempF := 8;
    end;
    case RandomRange(1,3) of
      1: tempS := 6;
      2: tempS := 7;
      3: tempS := 8;
    end;
  end;
  SwapRows(tempF, tempS);
  SwapCols(tempF, tempS);
end;

var
  temp, i, j, tempF, tempS: Integer;
begin
  Randomize;

  BasicRowGenerate;
  NewNextRow(1);
  NewNextRow(2);

  NewRow (3, 0);
  NewNextRow(4);
  NewNextRow(5);

  NewRow (6, 3);
  NewNextRow(7);
  NewNextRow(8);

  case RandomRange(1,3) of
    1: tempF := 1;
    2: tempF := 4;
    3: tempF := 7;
  end;
  case RandomRange(1,3) of
    1: tempS := 1;
    2: tempS := 4;
    3: tempS := 7;
  end;
  temp := RandomRange(0,5);
  for i:=0 to temp do
    SwapTripleRows(tempF, tempS);

  case RandomRange(1,3) of
    1: tempF := 1;
    2: tempF := 4;
    3: tempF := 7;
  end;
  case RandomRange(1,3) of
    1: tempS := 1;
    2: tempS := 4;
    3: tempS := 7;
  end;
  temp := RandomRange(0,5);
  for i:=0 to temp do
    SwapTripleCols(tempF, tempS);

  temp := RandomRange(0,5);
  for i:=0 to temp do
    RandomSwap;

  temp := RandomRange(0,3);
  for i:=0 to temp do
    Transposing;

  with NewGameForm.NewSudokuGrid do
  for i:= 0 to 8 do
    for j:= 0 to 8 do
    begin
      matrixA [j,i] := StrToInt(NewSudokuGrid.Cells [i,j]);
      matrixB [j,i] := StrToInt(NewSudokuGrid.Cells [i,j]);
    end;

  HideCells;
end;

procedure TNewGameForm.NGCheckBtnClick(Sender: TObject);
var
  i,j,choose: integer;
  IfAllCorrect: Boolean;
begin
  choose:=0;
  IfAllCorrect:=True;
  with NewGameForm.NewSudokuGrid do
  for i:= 0 to 8 do
  begin
    for j:= 0 to 8 do
    begin
      if NewSudokuGrid.Cells[i,j]='' then
      begin
        ShowMessage('Oops! You did not fill all cells!'+#13#10+'Try again.');
        IfAllCorrect:=False;
        Exit;
      end
      else
      begin
        if (matrixA[j,i]<>0) then
        begin
          if (matrixA[j,i]<>StrToInt(NewSudokuGrid.Cells[i,j])) then
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
      MessageBox(Handle,PChar('You have successfully completed the game!'
        +#13#10+ 'Congratulations!'), PChar(''), MB_OK);
  end;
end;

procedure SaveTheGame (Sender: TObject);
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
  while FileExists(LogUser + IntToStr(counter) + '.sud') do
  begin
    inc(counter);
  end;
  AssignFile(F, LogUser + IntToStr(counter) + '.sud');
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

procedure TNewGameForm.NGSaveBtnClick(Sender: TObject);
var
  SaveSudoku: TSavedSudoku;
  F: file of TSavedSudoku;
  counter, i, j: Integer;
  P: string;
begin
  SaveTheGame(NewSudokuGrid);
end;

procedure TNewGameForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i, j:Integer;
    c:TControl;
begin
  MainMenuForm.Show;
end;

end.


