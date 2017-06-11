unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  StdCtrls, jpeg, ExtCtrls;

type
  TAboutForm = class(TForm)
    AboutImg: TImage;
    AboutLbl: TLabel;
    AboutMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses MainMenu;

{$R *.dfm}

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  AboutMemo.Lines.LoadFromFile('About.txt');
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainMenuForm.Show;
end;

end.
