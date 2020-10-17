Program Problem10071 (input,output);
Var
  V,T: LongInt;
Begin
  While not EOF(input) do
    Begin
      ReadLn(V,T);
      WriteLn(2*V*T);
    end;
end.