Program Problem10050 (input, output);
Var
  Hartals: Array [1..3660] of Boolean;
  i,j,k,Test,N,P,H,Day: Integer;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      FillChar(Hartals,SizeOf(Hartals),False);
      ReadLn(N);
      ReadLn(P);
      for j:=1 to P do
        Begin
          ReadLn(H);
          k:=H;
          While (k <= N) do
            Begin
              Hartals[k]:=True;
              Inc(k,H);
            end;
        end;
      k:=7;
      While (k-7 <= N) do
        Begin
          Hartals[k-1]:=False;
          Hartals[k]:=False;
          Inc(k,7);
        end;
      Day:=0;
      for j:=1 to N do
        if Hartals[j] then
          Inc(Day);
      WriteLn(Day);
    end;
end.