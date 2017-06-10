unit CheckLoginAndPassword;

interface

var
  LogAndPasList:Text;
  LineOfLog:integer;

function TestCorrect(S:string):boolean;
function TestOnLog(var F:Text; Log:string):boolean;
procedure AddLogAndPas(var F:Text;Log,Pas:string);
function FindUser(var F:Text; Log,Pas:string):boolean;

implementation

function TestCorrect(S:string):boolean;
var i:integer;
  begin
  result:=true;
  if not((length(S)<15)and(length(S)>2))
  then
    result:=false
  else
    begin
      for i:=1 to length(S) do
        begin
          if not(((S[i]>='a')and(S[i]<='z'))or((S[i]>='A')and(S[i]<='Z'))or((S[i]>='0')and(S[i]<='9')))
          then
            result:=false;
        end;
    end;
  end;

function TestOnLog(var F:Text; Log:string):boolean;
var
  TempLog,TempPas:string;
begin
  Reset(F);
  result:=true;
  while (not EOF(F))and result do
    begin
      readln(F,TempLog);
      readln(F,TempPas);
      if Log=TempLog then
      result:=false;
    end;
  CloseFile(F);
end;

procedure AddLogAndPas(var F:Text;Log,Pas:string);
begin
  Append(F);
  writeln(F,Log);
  writeln(F,Pas);
  CloseFile(F);
end;

function FindUser(var F:Text; Log,Pas:string):boolean;
var
  TempLog,TempPas:string;
begin
  Reset(F);
  result:=false;
  while not(EOF(F)or (TempLog=Log)) do
    begin
      readln(F,TempLog);
      readln(F,TempPas);
      if ((TempLog=Log) and (TempPas=Pas)) then
        result:=true
    end;
  CloseFile(F);
end;

end.
