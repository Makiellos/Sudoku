unit Rules;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TRulesForm = class(TForm)
    RulesImg: TImage;
    lRulesLabel: TLabel;
    RulesMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RulesForm: TRulesForm;

implementation

uses MainMenu;

{$R *.dfm}

procedure TRulesForm.FormCreate(Sender: TObject);
begin
  RulesMemo.Lines.LoadFromFile('Rules.txt');
end;

procedure TRulesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainMenuForm.Show;
end;

end.
