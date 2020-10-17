Program Problem10167 (input, output);
Type
  Cherry = Record
    X,Y: Integer;
   end;

Var
  i,j,g,Lucy,Lily,N: LongInt;
  Cherries: Array [1..100] of Cherry;
  Ok: Boolean;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      for i:=1 to 2*N do
        With Cherries[i] do
          ReadLn(X,Y);
      for i:=-500 to 500 do
        Begin
          for j:=-500 to 500 do
            Begin
              Lucy:=0;
              Lily:=0;
              Ok:=True;
              for g:=1 to 2*N do
                With Cherries[g] do
                  if (i*X+j*Y > 0) then
                    Inc(Lucy)
                  else
                    if (i*X+j*Y < 0) then
                      Inc(Lily)
                    else
                      Begin
                        Ok:=False;
                        Break;
                      end;
              if Ok and (Lucy = Lily) then
                Break
              else
                Ok:=False;
            end;
          if Ok then
            Begin
              WriteLn(i,' ',j);
              Break;
            end;
        end;
      ReadLn(N);
    end;
end.