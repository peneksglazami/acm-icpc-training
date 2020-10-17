{Problem: 2296 - Image Perimeters
 ACM ICPC - North America - Mid Central - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2296;
{$APPTYPE CONSOLE}
const
  MaxL = 20;
  d: array [1..8,1..2] of Integer = ((0,-1),(1,-1),(1,0),(1,1),(0,1),(-1,1),(-1,0),(-1,-1));
  d2: array [1..4,1..2] of Integer = ((1,0),(0,1),(-1,0),(0,-1));

var
  a: array [0..MaxL+1,0..MaxL+1] of Char;
  v: array [0..MaxL+1,0..MaxL+1] of Boolean;
  i,j,r,c,mr,mc: Integer;
  St: String;

function per(r,c: Integer): Integer;
var
  i: Integer;
begin
  Result:=0;
  v[r,c]:=True;
  for i:=1 to 4 do
    if a[r+d2[i,1],c+d2[i,2]] = '.' then
      Inc(Result);
  for i:=1 to 8 do
    if not v[r+d[i,1],c+d[i,2]] and (a[r+d[i,1],c+d[i,2]] = 'X') then
      Inc(Result,per(r+d[i,1],c+d[i,2]));
end;

begin
  ReadLn(r,c,mr,mc);
  while (r <> 0) or (c <> 0) or (mr <> 0) or (mc <> 0) do
    begin
      FillChar(a,SizeOf(a),'.');
      for i:=1 to r do
        begin
          ReadLn(St);
          for j:=1 to c do
            a[i,j]:=St[j];
        end;
      FillChar(v,SizeOf(v),True);
      for i:=1 to r do
        for j:=1 to c do
          v[i,j]:=False;
      if not v[mr,mc] and (a[mr,mc] = 'X') then
        WriteLn(per(mr,mc))
      else
        WriteLn(0);
      ReadLn(r,c,mr,mc);
    end;
end.