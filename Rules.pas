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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RulesForm: TRulesForm;

implementation

{$R *.dfm}

procedure TRulesForm.FormCreate(Sender: TObject);
begin
  RulesMemo.Lines.LoadFromFile('Rules.txt');
end;

end.
