{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem F - Integer Percentage
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemF;
{$APPTYPE CONSOLE}
const
  MaxN = 10000;
  
var
  a: array [1..MaxN] of Integer;
  i,j,N,S: Integer;

begin
  ReadLn(N,S);
  if N < S then
    begin
      WriteLn(0);
      Halt(0);
    end;
  a[S]:=1;
  for i:=S to N do
    if a[i] > 0 then
      for j:=i+1 to N do
        if (a[i]+1 > a[j]) and (100*j mod i = 0) then
          a[j]:=a[i]+1;
  j:=S;
  for i:=S+1 to N do
    if a[i] > a[j] then
      j:=i;
  WriteLn(a[j]);
end.