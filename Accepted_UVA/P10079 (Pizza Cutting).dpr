Program P10079 (input, output);
{$APPTYPE CONSOLE}
Var
  N: Double;
Begin
  ReadLn(N);
  While (N >= 0) do
    Begin
      WriteLn((Sqr(N)+N+2)/2:0:0);
      ReadLn(N);
    end;
end.