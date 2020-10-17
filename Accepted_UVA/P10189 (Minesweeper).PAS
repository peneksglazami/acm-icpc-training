Program Problem10189 (input, output);
Var
  Field: Array [0..101,0..101] of Char;
  Amount: Array [1..100,1..100] of ShortInt;
  i,j,g,N,M: Integer;
  St: String;

Begin
  ReadLn(M,N);
  i:=1;
  While (N+N <> 0) do
    Begin
      FillChar(Field,SizeOf(Field),'.');
      for j:=1 to M do
        Begin
          ReadLn(St);
          for g:=1 to N do
            Field[j,g]:=St[g];
        end;
      FillChar(Amount,SizeOf(Amount),0);
      for j:=1 to M do
        for g:=1 to N do
          Begin
            if Field[j,g] <> '*' then
              Begin
                if Field[j-1,g-1] = '*' then
                  Inc(Amount[j,g]);
                if Field[j-1,g] = '*' then
                  Inc(Amount[j,g]);
                if Field[j-1,g+1] = '*' then
                  Inc(Amount[j,g]);
                if Field[j,g-1] = '*' then
                  Inc(Amount[j,g]);
                if Field[j,g+1] = '*' then
                  Inc(Amount[j,g]);
                if Field[j+1,g-1] = '*' then
                  Inc(Amount[j,g]);
                if Field[j+1,g] = '*' then
                  Inc(Amount[j,g]);
                if Field[j+1,g+1] = '*' then
                  Inc(Amount[j,g]);
              end
            else
              Amount[j,g]:=-1;
          end;
      WriteLn('Field #',i,':');
      for j:=1 to M do
        Begin
          for g:=1 to N do
            if Amount[j,g] = -1 then
              Write('*')
            else
              Write(Amount[j,g]);
          WriteLn;
        end;
      WriteLn;
      Inc(i);
      ReadLn(M,N);
    end;
end.