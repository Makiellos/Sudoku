unit Rating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TRatingForm = class(TForm)
    Registration: TStringGrid;
   // procedure RegistrationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RatingForm: TRatingForm;

implementation

uses NewGame;

{$R *.dfm}

{procedure TRatingForm.RegistrationClick(Sender: TObject);
begin
  with NewGameForm.Registration do
    Cells[0,0] := 'Player';
    Cells[0,1] := 'Date';
    Cells[0,2] := 'Total Score';
    Cells[0,3] := 'Difficulty';
    Cells[0,4] := 'GameName';
end; }

end.
