Program Problem10591 (input, output);
Var
  i,j,k,Test,N,N2,S: LongInt;
  Ok: Boolean;
  Mas: Array [1..10000] of LongInt;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(N);
      N2:=N;
      j:=1;
      Ok:=True;
      While (N <> 1) and Ok do
        Begin
          Mas[j]:=N;
          S:=0;
          While N <> 0 do
            Begin
              S:=S+Sqr(N mod 10);
              N:=N div 10;
            end;
          N:=S;
          for k:=1 to j do
            if N = Mas[k] then
              Begin
                Ok:=False;
                Break;
              end;
          Inc(j);
        end;
      if N = 1 then
        WriteLn('Case #',i,': ',N2,' is a Happy number.')
      else
        WriteLn('Case #',i,': ',N2,' is an Unhappy number.')
    end;
end.