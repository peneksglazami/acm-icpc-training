Program Problem10161 (input, output);
Var
  i,N: LongInt;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      i:=Trunc(Sqrt(N));
      if Sqr(i) <> N then
        Inc(i);
      if i mod 2 = 1 then
        Begin
          if (N - Sqr(i-1)) < i then
            WriteLn(i,' ',N-Sqr(i-1))
          else
            WriteLn(Sqr(i)-N+1,' ',i);
        end
      else
        Begin
          if (N - Sqr(i-1)) < i then
            WriteLn(N-Sqr(i-1),' ',i)
          else
            WriteLn(i,' ',Sqr(i)-N+1);
        end;
      ReadLn(N);
    end;
end.