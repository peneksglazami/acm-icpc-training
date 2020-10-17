Program Problem10633 (input, output);

{$APPTYPE CONSOLE}
var
  A: int64;
  d: Integer;

begin
  ReadLn(A);
  While (A <> 0) do
    Begin
      if (A mod 9 = 0) then
        WriteLn(((A-9) div 9)*10+9,' ',(A div 9)*10)
      else
        for d:=8 downto 1 do
          if ((A-d) mod 9 = 0) then
            WriteLn(((A-d) div 9)*10 + d);
      ReadLn(A);
    end;
end.
