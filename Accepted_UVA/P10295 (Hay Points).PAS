Program Problem10295 (input, output);
Type
  Words = Record
    S: String[16];
    Value: Real;
   end;

Var
  St,St2: String;
  i,j,g,M,N,Er: Integer;
  W: Array [1..1000] of Words;
  Sum: Real;

Begin
  ReadLn(M,N);
  for i:=1 to M do
    With W[i] do
      Begin
        ReadLn(St);
        S:=Copy(St,1,Pos(' ',St)-1);
        Delete(St,1,Pos(' ',St));
        Val(St,Value,Er);
      end;
  for i:=1 to N do
    Begin
      Sum:=0;
      ReadLn(St);
      While (St <> '.') do
        Begin
          j:=1;
          While (j <= Length(St)) do
            Begin
              St2:='';
              While (St[j] <> ' ') and (j <= Length(St)) do
                Begin
                  St2:=St2+St[j];
                  Inc(j);
                end;
              While (St[j] = ' ')  do
                Inc(j);
              for g:=1 to M do
                With W[g] do
                  if (St2 = S) then
                    Sum:=Sum+Value;
            end;
          ReadLn(St);
        end;
      WriteLn(Sum:0:0)
    end;
end.