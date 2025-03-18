program PrimoCheck;
uses crt;

function EhPrimo(n: Integer): Boolean;
var
  i: Integer;
begin
  if (n < 2) then
    EhPrimo := False
  else
  begin
    EhPrimo := True;
    for i := 2 to n div 2 do
    begin
      if (n mod i = 0) then
      begin
        EhPrimo := False;
        Break;
      end;
    end;
  end;
end;

var
  num: Integer;
begin
  clrscr;
  Write('Digite um número: ');
  ReadLn(num);

  if EhPrimo(num) then
    WriteLn('O número ', num, ' é primo.')
  else
    WriteLn('O número ', num, ' não é primo.');

  ReadLn;
end.
