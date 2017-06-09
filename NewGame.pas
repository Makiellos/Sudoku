unit NewGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Math, jpeg, ExtCtrls, pngimage;

type
  TNewGameForm = class(TForm)
    NewSudokuGrid: TStringGrid;
    NGFieldPic: TImage;
    procedure FormShow(Sender: TObject);
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

procedure TNewGameForm.FormShow(Sender: TObject);
procedure BasicRowGenetate();
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
  Image: TImage;
  x, y: integer;
begin
  Image := TImage.Create(Self);
  Image.Parent := NewsudokuGrid;
  Image.Picture.LoadFromFile('Kvadrat-150x150.png');
  Image.Left := (ACol * 41);
  Image.Top := (ARow * 41);
  Image.Width := 41;
  Image.Height := 41;
  Image.Stretch := true;
  Image.Transparent := true;
end;

procedure RandomHide(Col, Row, diff, count: integer);
var
  tempCount, tempCol, tempRow, i, j: Integer;
begin
  tempCount := 0;
  for i:=Col to Col+2 do
  begin
    for j:=Row to Row+2 do
    begin
      Randomize;
      tempCol := RandomRange(Col,Col+1);
      tempRow := RandomRange(Row,Row+1);
      if (diff>0) and (tempCount < count)  then
      begin
        NewSudokuGridDrawCell(tempCol, tempRow);
        dec(diff);
        inc(tempCount);
      end;
    end;
  end;
end;

procedure HideCells;
var
  diff, temp, i, j, tempCol, tempRow, count, tempCount: Integer;
begin
  diff:=0;
  if DifficultyLvlForm.DiffEasy then
  begin
    diff:=63;
    count:=7;
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

  repeat
    RandomHide(0,0,diff,count);
    RandomHide(0,3,diff,count);
    RandomHide(0,6,diff,count);

    RandomHide(3,0,diff,count);
    RandomHide(3,3,diff,count);
    RandomHide(3,6,diff,count);

    RandomHide(6,0,diff,count);
    RandomHide(6,3,diff,count);
    RandomHide(6,6,diff,count);
  until diff<0;

end;

procedure RandomSwap();
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
  temp, i, tempF, tempS: Integer;
begin
  BasicRowGenetate();
  NewNextRow(1);
  NewNextRow(2);

  NewRow (3, 0);
  NewNextRow(4);
  NewNextRow(5);

  NewRow (6, 3);
  NewNextRow(7);
  NewNextRow(8);

  BasicRowGenetate();
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
    RandomSwap();

  temp := RandomRange(0,3);
  for i:=0 to temp do
    Transposing();
  HideCells();
end;

//procedure TNewGameForm.NewSudokuGridDrawCell(Sender: TObject; ACol,
//  ARow: Integer; Rect: TRect; State: TGridDrawState);
//begin
//
//end;

end.
