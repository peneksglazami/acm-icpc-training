{Problem: 3392 - Triangular Sums
 ACM ICPC - North America - Greater New York - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3392;
{$APPTYPE CONSOLE}
var
  i,Test,N: Integer;

function W(N: Integer): Int64;
var
  i: Integer;
begin
  Result:=0;
  for i:=1 to N do
    Result:=Result+i*(i+1)*(i+2) div 2;
end;

begin
  ReadLn(Test);
  for i:=1 to Test do
    begin
      ReadLn(N);
      WriteLn(i,' ',N,' ',W(N));
    end;
end.
