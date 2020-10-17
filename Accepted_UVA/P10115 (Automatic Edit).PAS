Program Problem10115 (input, output);
Type
  Rule = Record
    Find,Replace: String;
  end;

Var
  Rules: Array [1..10] of Rule;
  St: String;
  N,i,j: Integer;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      for i:=1 to N do
        With Rules[i] do
          Begin
            ReadLn(Find);
            ReadLn(Replace);
          end;
      ReadLn(St);
      i:=1;
      While (i <= N) do
        Begin
          j:=Pos(Rules[i].Find,St);
          if (j <> 0) then
            Begin
              Delete(St,j,Length(Rules[i].Find));
              Insert(Rules[i].Replace,ST,j);
            end
          else
            Inc(i);
        end;
      WriteLn(St);
      ReadLn(N);
    end;
end.