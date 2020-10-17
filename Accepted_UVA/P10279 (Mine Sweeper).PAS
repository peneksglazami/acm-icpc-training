Program Problem10279 (input, output); {Mine Sweeper}
Var
  Map,OpenMap: Array [0..11,0..11] of Char;
  Board: Array [1..10,1..10] of Byte;
  i,j,g,Game,N: Integer;
  St: String;
  Ok: Boolean;

Begin
  ReadLn(Game);
  for i:=1 to Game do
    Begin
      ReadLn;
      ReadLn(N);
      FillChar(Map,SizeOf(Map),'.');
      FillChar(OpenMap,SizeOf(OpenMap),'.');
      FillChar(Board,SizeOf(Board),0);
      for j:=1 to N do
        Begin
          ReadLn(St);
          for g:=1 to N do
            Map[j,g]:=St[g];
        end;
      for j:=1 to N do
        Begin
          ReadLn(St);
          for g:=1 to N do
            OpenMap[j,g]:=St[g];
        end;
      Ok:=False;
      for j:=1 to N do
        for g:=1 to N do
          Begin
            if (OpenMap[j,g] = 'x') and (Map[j,g] = '.') then
              Begin
                if Map[j,g-1] = '*' then
                  Inc(Board[j,g]);
                if Map[j+1,g-1] = '*' then
                  Inc(Board[j,g]);
                if Map[j+1,g] = '*' then
                  Inc(Board[j,g]);
                if Map[j+1,g+1] = '*' then
                  Inc(Board[j,g]);
                if Map[j,g+1] = '*' then
                  Inc(Board[j,g]);
                if Map[j-1,g+1] = '*' then
                  Inc(Board[j,g]);
                if Map[j-1,g] = '*' then
                  Inc(Board[j,g]);
                if Map[j-1,g-1] = '*' then
                  Inc(Board[j,g]);
              end;
            if (OpenMap[j,g] = 'x') and (Map[j,g] = '*') then
              Ok:=True;
          end;
      for j:=1 to N do
        Begin
          for g:=1 to N do
            if Ok then
              Begin
                if (OpenMap[j,g] = 'x') and (Map[j,g] = '.') then
                  Write(Board[j,g]);
                if (OpenMap[j,g] = 'x') and (Map[j,g] = '*') then
                  Write('*');
                if (OpenMap[j,g] = '.') and (Map[j,g] = '*') then
                  Write('*');
                if (OpenMap[j,g] = '.') and (Map[j,g] = '.') then
                  Write('.');
              end
            else
              Begin
                if (OpenMap[j,g] = 'x') then
                  Write(Board[j,g])
                else
                  Write('.');
              end;
          WriteLn
        end;
      if (i < Game) then
        WriteLn;
    end;
end.