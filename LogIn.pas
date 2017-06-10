unit LogIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, CheckLoginAndPassword;

type
  TLogInForm = class(TForm)
    LIText: TStaticText;
    LILoginMask: TMaskEdit;
    LITextLogin: TStaticText;
    LIPasswordMask: TMaskEdit;
    LITextPassword: TStaticText;
    btnConfirmTheReg: TButton;
    btnBack: TButton;
    btnUsers: TButton;
    procedure btnConfirmTheRegClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LILoginMaskClick(Sender: TObject);
    procedure LIPasswordMaskClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogInForm: TLogInForm;

implementation

uses
MainMenu, SignLog, Users;

{$R *.dfm}


procedure TLogInForm.btnBackClick(Sender: TObject);
begin
  Close;
  SignLogForm.Show;
end;

procedure TLogInForm.btnConfirmTheRegClick(Sender: TObject);
var LogUser,PasUser:string;
begin
  UsersForm.Reload;
  LogUser:=LILoginMask.Text;
  PasUser:=LIPasswordMask.Text;
  if FindUser(LogAndPasList,LogUser,PasUser)
  then
    begin
      MessageBox(handle,PChar('Success'),PChar('OK'),(MB_OK+MB_ICONINFORMATION));
      LogInForm.Visible:=false;
      MainMenuForm.Show;
    end
  else
    MessageBox(handle,PChar('Wrong login or password'),PChar('OK'),(MB_OK+MB_ICONERROR));
end;


procedure TLogInForm.btnUsersClick(Sender: TObject);
begin
  UsersForm.Reload;
  UsersForm.ShowModal;
end;

procedure TLogInForm.FormShow(Sender: TObject);
begin
  LILoginMask.Text:='Login';
  LIPasswordMask.PasswordChar:='•';
  LIPasswordMask.Text:='Password';
  AssignFile(LogAndPasList,'RegistrationName.txt');
end;


procedure TLogInForm.LILoginMaskClick(Sender: TObject);
begin
  LILoginMask.Text := ('');
end;

procedure TLogInForm.LIPasswordMaskClick(Sender: TObject);
begin
  LIPasswordMask.Text := ('');
end;

end.
