unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TMainMenuForm = class(TForm)
    MMBtnNewGame: TBitBtn;
    MMBtnList: TBitBtn;
    MMBtnAbout: TBitBtn;
    MMImgCopyleft: TImage;
    MMFieldImg: TImage;
    MMLabel: TLabel;
    MMRightsLabel: TLabel;
    procedure MMBtnNewGameClick(Sender: TObject);
    procedure MMBtnListClick(Sender: TObject);
    procedure MMBtnRulesClick(Sender: TObject);
    procedure MMBtnAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainMenuForm: TMainMenuForm;

implementation

uses DifficultyLvl, SavedGame, Rating, Rules, About, SavedList;

{$R *.dfm}

procedure TMainMenuForm.MMBtnNewGameClick(Sender: TObject);
begin
  Hide;
  DifficultyLvlForm.Show;
end;

procedure TMainMenuForm.MMBtnListClick(Sender: TObject);
begin
  Hide;
  SavedListForm.Show;
end;

procedure TMainMenuForm.MMBtnRulesClick(Sender: TObject);
begin
  Hide;
  RulesForm.Show;
end;

procedure TMainMenuForm.MMBtnAboutClick(Sender: TObject);
begin
  Hide;
  AboutForm.Show;
end;

end.
