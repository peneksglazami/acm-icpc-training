{Problem: 3642 - CubesSquared
 ACM ICPC - Europe - Southwestern - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3642;
{$APPTYPE CONSOLE}
const
  MaxN = 400000;
  MaxK = 180;

var
  a: array [1..MaxK] of Integer;
  b: array [0..MaxN] of Integer;
  i,j,N,cnt: Integer;

begin
  N:=1; cnt:=0;
  while N*N*N <= MaxN do
    begin
      inc(cnt);
      a[cnt]:=N*N*N;
      inc(N);
    end;
  N:=1; i:=1;
  while N <= MaxN do
    begin
      inc(i);
      N:=N+i*i;
      inc(cnt);
      a[cnt]:=N;
    end;
  for i:=0 to MaxN do
    b[i]:=MaxInt;
  b[0]:=0;
  for i:=1 to cnt do
    for j:=0 to MaxN-a[i] do
      if b[j]+1 < b[j+a[i]] then
        b[j+a[i]]:=b[j]+1;
  ReadLn(N);
  while N <> -1 do
    begin
      WriteLn(b[N]);
      ReadLn(N);
    end;
end.