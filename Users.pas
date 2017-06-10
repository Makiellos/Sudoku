unit Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, CheckLoginAndPassword;

type
  TUsersForm = class(TForm)
    lbUsers: TListBox;
    btnChoose: TButton;
    btnDelUser: TButton;
    procedure btnChooseClick(Sender: TObject);
    procedure btnDelUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Reload;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsersForm: TUsersForm;

implementation

uses
LogIn;

{$R *.dfm}

procedure TUsersForm.Reload;
var Log,Pass:string;
begin
  LBUsers.Items.Clear;
  begin
    AssignFile(LogAndPasList,'RegistrationName.txt');
    Reset(LogAndPasList);
    while not(EOF(LogAndPasList)) do
      begin
        readln(LogAndPasList,Log);
        readln(LogAndPasList,Pass);
        LBUsers.Items.Add(Log);
      end;
    CloseFile(LogAndPasList);
    end;
end;

procedure TUsersForm.btnChooseClick(Sender: TObject);
begin
  UsersForm.Close;
  LogInForm.LILoginMask.Text := lbUsers.Items.Strings[lbUsers.ItemIndex];
end;

procedure TUsersForm.btnDelUserClick(Sender: TObject);
var
  Response:integer;
  F:TStringList;
  Log,Pas:string;
begin
  Response:=MessageBox(handle,PChar('Are you sure?'),PChar('Delete?'),(MB_YESNO+MB_ICONQUESTION));
  if Response=IDYES then
    begin
      Log:=LBUsers.Items.Strings[LBUsers.ItemIndex];
      FindUser(LogAndPasList, Log,Pas);
      F:=TStringList.Create;
      F.LoadFromFile('RegistrationName.txt');
      F.Delete(LineOfLog);
      F.Delete(LineOfLog);
      F.SaveToFile('RegistrationName.txt');
      F.Free;
      MessageBox(handle,PChar('The user is deleted'),PChar('OK'),(MB_OK+MB_ICONINFORMATION));
      Reload;
    end;

end;

procedure TUsersForm.FormCreate(Sender: TObject);
begin
  Reload;
end;

end.
