{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem G - City Blocks
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemG;
{$APPTYPE CONSOLE}
var
  N,M,G,i,a,b,sum: Integer;

function GCD(a,b: Integer): Integer;
var
  nd: Integer;
begin
  nd:=b;
  while a > 0 do
    begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;  
end;

begin
  ReadLn(N,M);
  dec(N); dec(M);
  G:=GCD(N,M);
  N:=N div G;
  M:=M div G;
  sum:=0;
  a:=0; b:=M;
  for i:=1 to N do
    begin
      inc(sum,b div n - a div n + 1);
      a:=b; b:=b+M;
    end;
  WriteLn((sum-1)*G);
end.
