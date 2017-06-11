unit SavedList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, NewGame, LogIn, MainMenu, SavedGaming;

type
  TSavedListForm = class(TForm)
    SLGrid: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SLGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SavedListForm: TSavedListForm;
  ACol, ARow: Integer;

implementation



{$R *.dfm}


procedure TSavedListForm.FormShow(Sender: TObject);
var
  SaveSudoku: TSavedSudoku;
  F: file of TSavedSudoku;
  counter, RowN: Integer;
  P: string;
begin
  P:=getcurrentdir;
  If not (P = 'E:\progs\sudoku_new\sudoku\Sudoku\'+LogUser) then
  Chdir(LogUser);
  with SLGrid do
  begin
    Cells[0,0] := 'Date:';
    Cells[1,0] := 'Name of the game:';
    Cells[2,0] := 'Difficulty;';
  end;
  counter := 1;
  RowN := 1;
  while FileExists(LogUser + IntToStr(counter) + '.hui') do
  begin
    AssignFile(F, LogUser + IntToStr(counter) + '.hui');
    Reset(F);
    Read(F,SaveSudoku);
    with SLGrid do
    begin
      SLGrid.RowCount:=SLGrid.RowCount+1;
      Cells[0, RowN] := DateToStr(SaveSudoku.DateGame);
      Cells[1, RowN] := LogUser + IntToStr(counter);
      case SaveSudoku.DiffLvl of
        7: Cells[2, RowN] := 'Easy';
        6: Cells[2, RowN] := 'Medium';
        5: Cells[2, RowN] := 'Hard';
      end;
    end;
    CloseFile(F);
    inc(counter);
    inc(RowN);
  end;
end;

procedure TSavedListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainMenuForm.Show;
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

end.
