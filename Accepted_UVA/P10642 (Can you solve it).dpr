Program ProblemA (input, output);
{$APPTYPE CONSOLE}
Var
  i,N,A,X1,Y1,X2,Y2: LongInt;
  S: Int64;
Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      S:=0;
      ReadLn(X1,Y1,X2,Y2);
      if (X1+Y1) > (X2+Y2) then
        Begin
          A:=X1; X1:=X2; X2:=A;
          A:=Y1; Y1:=Y2; Y2:=A;
        end;
      if ((X1+Y1) = (X2+Y2)) and (X1 > X2) then
        Begin
          X1:=A; X1:=X2; X2:=A;
          Y1:=A; Y1:=Y2; Y2:=A;
        end;
      if (X2+Y2) - (X1+Y1) > 1 then
        S:=(X1+Y1+X2+Y2+2)*(X2+Y2-X1-Y1-1) div 2;
      if (X2 + Y2) <> (X1 + Y1) then
        Begin
          Inc(S,X2);
          Inc(S,Y1+1);
        end;
      if (X2 + Y2) = (X1 + Y1) then
        Inc(S,Y1-Y2);
      WriteLn('Case ',i,': ',S);
    end;
end.
