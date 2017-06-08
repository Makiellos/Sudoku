unit LogIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TLogInForm = class(TForm)
    LIText: TStaticText;
    LILoginMask: TMaskEdit;
    LITextLogin: TStaticText;
    LIPasswordMask: TMaskEdit;
    LITextPassword: TStaticText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogInForm: TLogInForm;

implementation

{$R *.dfm}

end.
