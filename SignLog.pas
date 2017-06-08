unit SignLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TSignLogForm = class(TForm)
    SignInPic: TImage;
    SignUpBtn: TBitBtn;
    logInBtn: TBitBtn;
    SLTextForSign: TStaticText;
    SLTextForLog: TStaticText;
    procedure SignUpBtnClick(Sender: TObject);
    procedure logInBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignLogForm: TSignLogForm;

implementation

uses
  SignUp, LogIn;

{$R *.dfm}

procedure TSignLogForm.SignUpBtnClick(Sender: TObject);
begin
  Hide;
  SignUpForm.Show;
end;

procedure TSignLogForm.logInBtnClick(Sender: TObject);
begin
  Hide;
  LogInForm.Show;
end;

end.
