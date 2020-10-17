{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_I;
{$APPTYPE CONSOLE}
const
  d: array [1..4,1..2] of Integer = ((1,0),(-1,0),(0,1),(0,-1));
  MaxN = 1000;

var
  b: array [1..4] of Boolean;
  t: array [0..MaxN+1,0..MaxN+1] of Boolean;
  i,j,g,N: Integer;
  Ok: Boolean;
  Ch: Char;
begin
  ReadLn(N);
  for i:=1 to N do
    begin
      for j:=1 to N do
        begin
          Read(Ch);
          if Ch = '1' then
            t[i,j]:=True;
        end;
      ReadLn;
    end;
  FillChar(b,SizeOf(b),True);
  for i:=1 to N do
    for j:=1 to N do
      if not t[i,j] then
        for g:=1 to 4 do
          if t[i+d[g,1],j+d[g,2]] then
            b[g]:=False;
  Ok:=False;
  for i:=1 to 4 do
    Ok:=Ok or b[i];
  if Ok then
    WriteLn('Yes')
  else
    WriteLn('No');
end.