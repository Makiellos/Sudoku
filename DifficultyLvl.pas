unit DifficultyLvl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TDifficultyLvlForm = class(TForm)
    DiffLvlLabel: TLabel;
    DifflvlHelpLabel: TLabel;
    DiffLvlEasyBtn: TButton;
    DiffLvlMediumBtn: TButton;
    DiffLvlHardBtn: TButton;
    DiffLvlEsc: TButton;
    DiffLvlEasyLabel: TLabel;
    DiffLvlMediumLabel: TLabel;
    DiffLvlHardLabel: TLabel;
    procedure DffLvlBtnClick(Sender: TObject);
    procedure DiffLvlEasyBtnClick(Sender: TObject);
    procedure DiffLvlMediumBtnClick(Sender: TObject);
    procedure DiffLvlHardBtnClick(Sender: TObject);
    procedure DiffLvlEscClick(Sender: TObject);
  private
    { Private declarations }
  public
    DiffEasy, DiffMedium, DiffHard: Boolean;
  end;

var
  DifficultyLvlForm: TDifficultyLvlForm;

implementation

uses
  NewGame, MainMenu;
  
{$R *.dfm}

procedure TDifficultyLvlForm.DffLvlBtnClick(Sender: TObject);
begin
  Hide;
  NewGameForm.Show;
end;

procedure TDifficultyLvlForm.DiffLvlEasyBtnClick(Sender: TObject);
begin
  DiffEasy:=True;
  DiffMedium:=False;
  DiffHard:=False;
  Hide;
  NewGameForm.Show;
end;

procedure TDifficultyLvlForm.DiffLvlMediumBtnClick(Sender: TObject);
begin
  DiffEasy:=False;
  DiffMedium:=True;
  DiffHard:=False;
  Hide;
  NewGameForm.Show;
end;

procedure TDifficultyLvlForm.DiffLvlHardBtnClick(Sender: TObject);
begin
  DiffEasy:=False;
  DiffMedium:=False;
  DiffHard:=True;
  Hide;
  NewGameForm.Show;
end;

procedure TDifficultyLvlForm.DiffLvlEscClick(Sender: TObject);
begin
  Hide;
  MainMenuForm.Show;
end;

end.
