{Problem: 2646 - Cantoring Along
 ACM ICPC - North America - Mid Atlantic - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2646;
{$APPTYPE CONSOLE}
const
  MaxN = 12;
  MaxL = 797161;

var
  t: array [1..MaxL] of Char;
  f,s: array [0..MaxN] of Integer;
  i,j,up,down,N: Integer;

begin
  f[0]:=1; s[0]:=1;
  for i:=1 to MaxN do
    begin
      f[i]:=3*f[i-1];
      s[i]:=f[i-1]+s[i-1];
    end;
  t[1]:='-';
  for i:=1 to MaxN do
    for j:=s[i-1] to s[i-1]+f[i-1]-1 do
      if t[j] = '-' then
        begin
          t[3*j-1]:='-';
          t[3*j]:=' ';
          t[3*j+1]:='-';
        end
      else
        begin
          t[3*j-1]:=' ';
          t[3*j]:=' ';
          t[3*j+1]:=' ';
        end;
  while not EOF do
    begin
      ReadLn(N);
      for i:=s[N] to s[N]+f[N]-1 do
        Write(t[i]);
      WriteLn;
    end;
end.