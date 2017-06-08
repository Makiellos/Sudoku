unit NewGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Math, jpeg, ExtCtrls;

type
  TNewGameForm = class(TForm)
    NewSudokuGrid: TStringGrid;
    NGFieldPic: TImage;
    procedure FormShow(Sender: TObject);
    //ocedure NewSudokuGridDrawCell(Sender: TObject; ACol, ARow: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewGameForm: TNewGameForm;

implementation

uses
  DifficultyLvl;

{$R *.dfm}

procedure BasicRowGenetate(Sender: TObject);
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

procedure NewNextRow(j: integer; Sender: TObject);
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

procedure NewRow (j,r: integer; Sender: TObject);
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

procedure SwapRows(FRow, SRow: integer; Sender: TObject);
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

procedure SwapCols(FCol, SCol: integer; Sender: TObject);
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

procedure SwapTripleRows(FRow, SRow: integer; Sender: TObject);
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

procedure SwapTripleCols(FCol, SCol: integer; Sender: TObject);
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

procedure Transposing(Sender: TObject);
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

procedure NewSudokuGridDrawCell(Sender: TObject; ACol, ARow: Integer);
//type
  //TRect = record
   // Left, Right: Integer;
  //end;
//var
  //Point: TRect;
begin
  //NewGameForm.NewSudokuGrid.Canvas.Brush.Color := clRed;
  //NewGameForm.NewSudokuGrid.Canvas.Rectangle(32+ACol*40, 24+ARow*40, 32+(ACol+1)*40, 24+(ARow+1)*40);
  //Point.Left:=24+ACol*40;
  //Point.Right:=32+(ACol+1)*40;
  //NewGameForm.NewSudokuGrid.Canvas.FillRect(Rect(ACol*40, ARow*40, (ACol+1)*40, (ARow+1)*40));
  //With NewGameForm.NewSudokuGrid do
  //NewGameForm.NewSudokuGrid.Canvas.TextOut(20+ACol*40, 20+ARow*40, Cells[ACol, ARow]);
end;

procedure HideCells(Sender: TObject);
var
  diff, temp, i, j, tempCol, tempRow, count, tempCount: Integer;
begin
  diff:=0;
  if DifficultyLvlForm.DiffEasy then
  begin
    diff:=18;
    count:=2;
  end;
  if DifficultyLvlForm.DiffMedium then
  begin
    diff:=25;
    count:=3;
  end;
  if DifficultyLvlForm.DiffHard then
  begin
    diff:=29;
    count:=4;
  end;
  tempCount := 0;
  for i:=0 to 3 do
  begin
    for j:=0 to 3 do
      tempCol := RandomRange(0,3);
      tempRow := RandomRange(0,3);
      if (diff>0) and (tempCount < count)  then
      begin
        NewSudokuGridDrawCell(NewGameForm, tempCol, tempRow);
        //dec ()
      end;
  end;
end;

procedure RandomSwap (Sender: TObject);
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
  SwapRows(tempF, tempS, NewGameForm.NewSudokuGrid);
  SwapCols(tempF, tempS, NewGameForm.NewSudokuGrid);
end;


procedure TNewGameForm.FormShow(Sender: TObject);
var
  temp, i, tempF, tempS: Integer;
begin
  NewSudokuGrid.Options := NewSudokuGrid.Options+[goEditing];

  BasicRowGenetate(NewSudokuGrid);
  NewNextRow(1, NewSudokuGrid);
  NewNextRow(2, NewSudokuGrid);

  NewRow (3, 0, NewSudokuGrid);
  NewNextRow(4, NewSudokuGrid);
  NewNextRow(5, NewSudokuGrid);

  NewRow (6, 3, NewSudokuGrid);
  NewNextRow(7, NewSudokuGrid);
  NewNextRow(8, NewSudokuGrid);

  BasicRowGenetate(NewSudokuGrid);
  NewNextRow(1, NewSudokuGrid);
  NewNextRow(2, NewSudokuGrid);

  NewRow (3, 0, NewSudokuGrid);
  NewNextRow(4, NewSudokuGrid);
  NewNextRow(5, NewSudokuGrid);

  NewRow (6, 3, NewSudokuGrid);
  NewNextRow(7, NewSudokuGrid);
  NewNextRow(8, NewSudokuGrid);

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
    SwapTripleRows(tempF, tempS, NewSudokuGrid);

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
    SwapTripleCols(tempF, tempS, NewSudokuGrid);

  temp := RandomRange(0,5);
  for i:=0 to temp do
    RandomSwap (NewSudokuGrid);

  temp := RandomRange(0,3);
  for i:=0 to temp do
    Transposing(NewSudokuGrid);

  HideCells(NewSudokuGrid);
end;

end.
