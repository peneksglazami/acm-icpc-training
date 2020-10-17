{Problem: 3304 - Sudoku
 ACM ICPC - Europe - Southeastern - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem3304 (input,output);
Var
  res: Array [1..9,1..9] of Integer;
  row,col,square: Array [1..9,1..9] of Boolean;
  sq: Array [1..9,1..9] of Integer;
  st: Array [1..81] of Record r,c: Integer; end;
  i,j,N,cnt: Integer;
  Ch: Char;
  Find: Boolean;

Function CharToInt(Ch: Char): Integer;
Begin
  CharToInt:=Ord(Ch)-Ord('0');
end;

Function ToSquare(r,c: Integer): Integer;
Var
  RR,CC: Integer;
Begin
  if r mod 3 = 0 then
    RR:=r div 3-1
  else
    RR:=r div 3;
  if c mod 3 = 0 then
    CC:=c div 3
  else
    CC:=c div 3+1;
  ToSquare:=3*RR+CC;
end;

Procedure Solve(i: Integer);
Var
  j: Integer;
Begin
  if i = cnt+1 then
    Find:=True
  else
    for j:=1 to 9 do
      if row[st[i].r,j] and col[st[i].c,j] and square[sq[st[i].r,st[i].c],j] then
        Begin
          row[st[i].r,j]:=False;
          col[st[i].c,j]:=False;
          square[sq[st[i].r,st[i].c],j]:=False;
          res[st[i].r,st[i].c]:=j;
          Solve(i+1);
          if Find then
            Exit;
          row[st[i].r,j]:=True;
          col[st[i].c,j]:=True;
          square[sq[st[i].r,st[i].c],j]:=True;
        end;
end;

Begin
  for i:=1 to 9 do
    for j:=1 to 9 do
      sq[i,j]:=ToSquare(i,j);
  ReadLn(N);
  While N > 0 do
    Begin
      FillChar(row,SizeOf(row),True);
      FillChar(col,SizeOf(col),True);
      FillChar(square,SizeOf(square),True);
      cnt:=0;
      for i:=1 to 9 do
        Begin
          for j:=1 to 9 do
            Begin
              Read(Ch);
              if Ch = '0' then
                Begin
                  Inc(cnt);
                  st[cnt].r:=i;
                  st[cnt].c:=j;
                end
              else
                Begin
                  row[i,CharToInt(Ch)]:=False;
                  col[j,CharToInt(Ch)]:=False;
                  square[sq[i,j],CharToInt(Ch)]:=False;
                  res[i,j]:=CharToInt(Ch);
                end;
            end;
          ReadLn;
        end;
      Find:=False;
      Solve(1);
      for i:=1 to 9 do
        Begin
          for j:=1 to 9 do
            Write(res[i,j]);
          WriteLn;
        end;
      Dec(N);
    end;
end.