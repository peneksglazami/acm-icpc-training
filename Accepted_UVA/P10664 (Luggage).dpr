Program ProblemF (input, output); {Luggage}
{$APPTYPE CONSOLE}
Var
  Mas: Array [1..20] of Integer;
  i,j,N,Test,Er,Sum: Integer;
  St,St2: String;
  Ok: Boolean;

Procedure Rec(S,i: Integer);
Var
  j: Integer;
Begin
  if (not OK) then
    Begin
      if S = (Sum div 2) then
        Ok:=True
      else
        Begin
          for j:=i+1 to N do
            if S+Mas[j] <= (Sum div 2) then
              Rec(S+Mas[j],j);
        end;
    end;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(St);
      j:=1;
      N:=0;
      Sum:=0;
      While j <= Length(St) do
        Begin
          While (St[j] = ' ') and (j <= Length(St)) do
            Inc(j);
          St2:='';
          While (St[j] <> ' ') and (j <= Length(St)) do
            Begin
              St2:=St2+St[j];
              Inc(j);
            end;
          if (St2 <> '') then
            Begin
              Inc(N);
              Val(St2,Mas[N],Er);
              Inc(Sum,Mas[N]);
            end;
        end;
      if Sum mod 2 = 0 then
        Begin
          Ok:=False;
          Rec(0,1);
          if Ok then
            WriteLn('YES')
          else
            WriteLn('NO');
        end
      else
        WriteLn('NO');
    end;
end.
