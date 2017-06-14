unit SignUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, CheckLoginAndPassword;

type
  TSignUpForm = class(TForm)
    SUText: TStaticText;
    SULoginMask: TMaskEdit;
    SUPasswordMask: TMaskEdit;
    SUTextLogin: TStaticText;
    SUTextPassword: TStaticText;
    btnConfirmTheReg: TButton;
    btnBack: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btnConfirmTheRegClick(Sender: TObject);
    procedure SULoginMaskClick(Sender: TObject);
    procedure SUPasswordMaskClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpForm: TSignUpForm;
  LoginUser, PassUser: shortstring;


implementation

uses
  DifficultyLvl, SignLog;

{$R *.dfm}

procedure TSignUpForm.btn1Click(Sender: TObject);
begin
  Hide;
  DifficultyLvlForm.Show;
end;

procedure TSignUpForm.btnConfirmTheRegClick(Sender: TObject);
begin
    LoginUser:=Trim(SULoginMask.Text);
    PassUser:=Trim(SUPasswordMask.Text);
    if (TestCorrect(LoginUser)and TestCorrect(PassUser)) then
    begin
      if TestOnLog(LogAndPasList,LoginUser) then
        begin
          AddLogAndPas(LogAndPasList,LoginUser,PassUser);
          MessageBox(Handle,PChar('Registration was a success'),PChar('OK'),(MB_OK+MB_ICONINFORMATION));
          CreateDir(LoginUser);
          Close;
          SignLogForm.Show;
        end
      else
        MessageBox(Handle,PChar('Login or password included invalid characters'),PChar('Error'),(MB_OK+MB_ICONERROR));
    end;
end;

procedure TSignUpForm.FormCreate(Sender: TObject);
begin
  SULoginMask.Text := ('');
  SUPasswordMask.Text := ('');
end;

procedure TSignUpForm.btnBackClick(Sender: TObject);
begin
  Hide;
  SignLogForm.Show;
end;

procedure TSignUpForm.SULoginMaskClick(Sender: TObject);
begin
  SULoginMask.Text := ('');
end;


procedure TSignUpForm.SUPasswordMaskClick(Sender: TObject);
begin
  SUPasswordMask.Text:=('');
end;


end.
