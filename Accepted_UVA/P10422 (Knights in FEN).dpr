{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10422 (input, output); {Knight in FEN}
{$APPTYPE CONSOLE}
Var
  EnabledBoard: Array [-1..7,-1..7] of Boolean;
  Board,FinalBoard: Array [1..5,1..5] of Byte;
  i,j,g,N,Min: Integer;
  St: String;

Procedure Init;
Var
  i,j: Integer;
Begin
  FillChar(EnabledBoard,SizeOf(EnabledBoard),False);
  for i:=1 to 5 do
    for j:=1 to 5 do
      EnabledBoard[i,j]:=True;
end;

Procedure InitBoard;
Var
  i,j: Integer;
Begin
  FillChar(Board,SizeOf(Board),0);
  for i:=1 to 5 do
    for j:=i to 5 do
      Board[i,j]:=1;
  Board[4,4]:=0;
  Board[5,5]:=0;
  Board[3,3]:=2;
end;

Function EqualityBoards: Boolean;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  Ok:=True;
  for i:=1 to 5 do
    for j:=1 to 5 do
      if (Board[i,j] <> FinalBoard[i,j]) then
        Begin
          Ok:=False;
          Break;
        end;
  EqualityBoards:=Ok;
end;

Procedure Solve(Step,x,y: Integer);
Const
  d: Array [1..8,1..2] of Integer = ((1,-2),(2,-1),(2,1),(1,2),
                                     (-1,2),(-2,1),(-2,-1),(-1,-2));
Var
  i,change: Integer;
Begin
  if Step = Min then
    Exit;
  if (FinalBoard[x,y] = 2) then
    if EqualityBoards and (Step < Min) then
      Begin
        Min:=Step;
        Exit;
      end;
  for i:=1 to 8 do
    if EnabledBoard[x+d[i,1],y+d[i,2]] then
      Begin
        change:=Board[x+d[i,1],y+d[i,2]];
        Board[x,y]:=Board[x+d[i,1],y+d[i,2]];
        Board[x+d[i,1],y+d[i,2]]:=2;
        Solve(Step+1,x+d[i,1],y+d[i,2]);
        Board[x+d[i,1],y+d[i,2]]:=change;
        Board[x,y]:=2;
      end;
end;

Begin
  Init;
  ReadLn(N);
  for i:=1 to N do
    Begin
      InitBoard;
      for j:=1 to 5 do
        Begin
          ReadLn(St);
          for g:=1 to 5 do
            Case St[g] of
              '0': FinalBoard[j,g]:=0;
              '1': FinalBoard[j,g]:=1;
              ' ': FinalBoard[j,g]:=2;
             end;
        end;
      Min:=11;
      Solve(0,3,3);
      if Min = 11 then
        WriteLn('Unsolvable in less than 11 move(s).')
      else
        WriteLn('Solvable in ',Min,' move(s).');
    end;
end.
