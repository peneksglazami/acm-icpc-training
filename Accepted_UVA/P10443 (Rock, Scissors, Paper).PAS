Program Problem10443 (input, output);
Var
  Map,NewMap: Array [0..101,0..101] of Char;
  i,j,g,k,Test,R,C,N: Integer;
  St: String;
  F_Char,S_Char: Char;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(R,C,N);
      for j:=1 to R do
        Begin
          ReadLn(St);
          for g:=1 to C do
            NewMap[j,g]:=St[g];
        end;
      for j:=1 to N do
        Begin
          Map:=NewMap;
          for g:=1 to R do
            for k:=1 to C do
              Begin
                F_Char:=Map[g,k];
                Case Map[g,k] of
                  'R': S_Char:='S';
                  'S': S_Char:='P';
                  'P': S_Char:='R';
                 end;
                if Map[g-1,k] = S_Char then
                  NewMap[g-1,k]:=F_Char;
                if Map[g+1,k] = S_Char then
                  NewMap[g+1,k]:=F_Char;
                if Map[g,k-1] = S_Char then
                  NewMap[g,k-1]:=F_Char;
                if Map[g,k+1] = S_Char then
                  NewMap[g,k+1]:=F_Char;
              end;
        end;
      for j:=1 to R do
        Begin
          for g:=1 to C do
            Write(NewMap[j,g]);
          WriteLn;
        end;
      WriteLn;
    end;
end.