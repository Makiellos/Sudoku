unit Rating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TRatingForm = class(TForm)
    SLGrid: TStringGrid;
    procedure FormShow(Sender: TObject);
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


procedure TRatingForm.FormShow(Sender: TObject);
begin
  with SLGrid do
  begin
    Cells[0,0] := 'Username:'
  end;
end;

end.
