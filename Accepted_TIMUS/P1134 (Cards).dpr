{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem B - Cards
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemB;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;
  
var
  a: array [0..MaxN] of Integer;
  b: array [1..MaxN] of Boolean;
  i,j,N,M: Integer;

procedure YES;
begin
  WriteLn('YES');
  Halt(0);
end;

procedure NO;
begin
  WriteLn('NO');
  Halt(0);
end;

begin
  ReadLn(N,M);
  for i:=1 to M do
    begin
      Read(j);
      if (j < 0) or (j > N) then
        NO;
      inc(a[j]);
    end;
  if a[0] = 1 then
    b[1]:=true
  else
    if a[0] > 1 then
      NO;
  for i:=1 to N-1 do
    case a[i] of
      1: b[i+1]:=b[i];
      2: if b[i] then
           NO
         else
           begin
             b[i]:=true;
             b[i+1]:=true;
           end;
    else
      if a[i] > 0 then
        NO;
    end;
  if (a[n] = 1) and b[n] then
    NO;
  YES;
end.
