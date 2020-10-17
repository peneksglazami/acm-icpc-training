Program Problem10415 (input, output);
Var
  Fingers: Array [1..10] of LongInt;
  NowPress,Press: Array [1..10] of Boolean;
  i,j,g,Test: Integer;
  St: String;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(St);
      FillChar(Fingers,SizeOf(Fingers),0);
      FillChar(NowPress,SizeOf(NowPress),False);
      for j:=1 to Length(St) do
        Begin
          Press:=NowPress;
          FillChar(NowPress,SizeOf(NowPress),False);
          Case St[j] of
            'c': Begin
                   for g:=2 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   for g:=7 to 10 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                 end;
            'd': Begin
                   for g:=2 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   for g:=7 to 9 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                 end;
            'e': Begin
                   for g:=2 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   for g:=7 to 8 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                 end;
            'f': Begin
                   for g:=2 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   NowPress[7]:=True;
                   if not Press[7] then
                     Inc(Fingers[7]);
                 end;
            'g': for g:=2 to 4 do
                   Begin
                     NowPress[g]:=True;
                     if not Press[g] then
                       Inc(Fingers[g]);
                   end;
            'a': for g:=2 to 3 do
                   Begin
                     NowPress[g]:=True;
                     if not Press[g] then
                       Inc(Fingers[g]);
                   end;
            'b': Begin
                   NowPress[2]:=True;
                   if not Press[2] then
                     Inc(Fingers[2]);
                 end;
            'C': Begin
                   NowPress[3]:=True;
                   if not Press[3] then
                     Inc(Fingers[3]);
                 end;
            'D': Begin
                   for g:=1 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   for g:=7 to 9 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                 end;
            'E': Begin
                   for g:=1 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   for g:=7 to 8 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                 end;
            'F': Begin
                   for g:=1 to 4 do
                     Begin
                       NowPress[g]:=True;
                       if not Press[g] then
                         Inc(Fingers[g]);
                     end;
                   NowPress[7]:=True;
                   if not Press[7] then
                     Inc(Fingers[7]);
                 end;
            'G': for g:=1 to 4 do
                   Begin
                     NowPress[g]:=True;
                     if not Press[g] then
                       Inc(Fingers[g]);
                   end;
            'A': for g:=1 to 3 do
                   Begin
                     NowPress[g]:=True;
                     if not Press[g] then
                       Inc(Fingers[g]);
                   end;
            'B': for g:=1 to 2 do
                   Begin
                     NowPress[g]:=True;
                     if not Press[g] then
                       Inc(Fingers[g]);
                   end;
           end;
        end;
      for j:=1 to 10 do
        Write(Fingers[j],' ');
      WriteLn;
    end;
end.