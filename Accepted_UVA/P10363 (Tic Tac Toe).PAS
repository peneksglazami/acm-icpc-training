{Problem: 10363 - Tic Tac Toe
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10363 (input,output);
Var
  t: Array [1..3,1..3] of Char;
  i,j,N,X,O: Integer;

Function Win(Ch: Char): Boolean;
Var
  i,j,cnt: Integer;
  Ok: Boolean;
Begin
  cnt:=0;
  for i:=1 to 3 do
    Begin
      Ok:=True;
      for j:=1 to 3 do
        Ok:=Ok and (t[i,j] = Ch);
      if Ok then
        Inc(cnt);
    end;
  for i:=1 to 3 do
    Begin
      Ok:=True;
      for j:=1 to 3 do
        Ok:=Ok and (t[j,i] = Ch);
      if Ok then
        Inc(cnt);
    end;
  Ok:=True;
  for i:=1 to 3 do
    Ok:=Ok and (t[i,i] = Ch);
  if Ok then
    Inc(cnt);
  Ok:=True;
  for i:=1 to 3 do
    Ok:=Ok and (t[i,4-i] = Ch);
  if Ok then
    Inc(cnt);
  Win:=cnt <> 0;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      for i:=1 to 3 do
        Begin
          for j:=1 to 3 do
            Read(t[i,j]);
          ReadLn;
        end;
      X:=0; O:=0;
      for i:=1 to 3 do
        for j:=1 to 3 do
          Case t[i,j] of
            'X': Inc(X);
            'O': Inc(O);
           end;
      if (X = O) then
        if Win('X') then
          WriteLn('no')
        else
          WriteLn('yes')
      else
        if (X = O+1) then
          if not Win('O') then
            WriteLn('yes')
          else
            WriteLn('no')
        else
          WriteLn('no');
      Dec(N);
      if N > 0 then
        ReadLn;
    end;
end.