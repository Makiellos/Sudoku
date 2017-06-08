unit SignUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TSignUpForm = class(TForm)
    SUText: TStaticText;
    SULoginMask: TMaskEdit;
    SUPasswordMask: TMaskEdit;
    SUTextLogin: TStaticText;
    SUTextPassword: TStaticText;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpForm: TSignUpForm;

implementation

uses
  DifficultyLvl;

{$R *.dfm}

procedure TSignUpForm.btn1Click(Sender: TObject);
begin
  Hide;
  DifficultyLvlForm.Show;
end;

end.
