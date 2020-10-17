Program Problem10465 (input, output);
Var
  i,M,N,T,Change,Best,Def: Integer;

Begin
  While not EOF do
    Begin
      ReadLn(M,N,T);
      if (M > N) then
        Begin
          Change:=M;
          M:=N;
          N:=Change;
        end;
      if (T mod M = 0) then
        WriteLn(T div M)
      else
        Begin
          Best:=T div M;
          Def:=T-(T div M)*M;
          i:=0;
          While (i < T) do
            Begin
              if (T-i >= N) and ((T-i)-((T-i) div N)*N < Def) or
                 (((T-i)-((T-i) div N)*N = Def) and (((T-i) div N) + (i div M) > Best)) then
                Begin
                  Best:=((T-i) div N) + (i div M);
                  Def:=(T-i)-((T-i) div N)*N
                end;
              Inc(i,M);
            end;
          if (Def = 0) then
            WriteLn(Best)
          else
            WriteLn(Best,' ',Def);
        end;
    end;
end.