program Sudoku;



uses
  Forms,
  MainMenu in 'MainMenu.pas' {MainMenuForm},
  NewGame in 'NewGame.pas' {NewGameForm},
  SavedGaming in 'SavedGaming.pas' {SavedGamingForm},
  SavedList in 'SavedList.pas' {SavedListForm},
  Rules in 'Rules.pas' {RulesForm},
  About in 'About.pas' {AboutForm},
  SignLog in 'SignLog.pas' {SignLogForm},
  SignUp in 'SignUp.pas' {SignUpForm},
  LogIn in 'LogIn.pas' {LogInForm},
  DifficultyLvl in 'DifficultyLvl.pas' {DifficultyLvlForm},
  CheckLoginAndPassword in 'CheckLoginAndPassword.pas',
  Users in 'Users.pas' {UsersForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSignLogForm, SignLogForm);
  Application.CreateForm(TSignUpForm, SignUpForm);
  Application.CreateForm(TLogInForm, LogInForm);
  Application.CreateForm(TMainMenuForm, MainMenuForm);
  Application.CreateForm(TNewGameForm, NewGameForm);
  Application.CreateForm(TSavedGamingForm, SavedGamingForm);
  Application.CreateForm(TSavedListForm, SavedListForm);
  Application.CreateForm(TRulesForm, RulesForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TDifficultyLvlForm, DifficultyLvlForm);
  Application.CreateForm(TUsersForm, UsersForm);
  Application.Run;
end.
