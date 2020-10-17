Program Problem10469 (input, output);
{$APPTYPE CONSOLE}
Var
  A,B: Cardinal;
Begin
  While not EOF do
    Begin
      ReadLn(A,B);
      WriteLn(A xor B);
    end;
end.
