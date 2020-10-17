{Problem: 3571 - Visible Lattice Points
 ACM ICPC - North America - Greater New York - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3571;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;

var
  ans: array [1..MaxN] of Integer;
  i,j,C,N: Integer;

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
  ans[1]:=3;
  for i:=2 to MaxN do
    begin
      ans[i]:=ans[i-1];
      for j:=1 to i-1 do
        if GCD(i,j) = 1 then
          inc(ans[i],2);
    end;
  ReadLn(C);
  for i:=1 to C do
    begin
      ReadLn(N);
      WriteLn(i,' ',N,' ',ans[N]);
    end;
end.