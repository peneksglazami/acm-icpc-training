{Problem: 3600 - Root of the Problem
 ACM ICPC - North America - Mid Central - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3600;
{$APPTYPE CONSOLE}
const
  MaxA: array [1..9] of Integer = (1000000,1000,100,32,16,10,8,6,5);

var
  i,B,N,l,r,m,min,m1,m2: Integer;

function pow(a,n: Integer): Integer;
var
  i: Integer;
begin
  Result:=1;
  for i:=1 to n do
    Result:=Result*a;
end;

begin
  ReadLn(B,N);
  while (B <> 0) or (N <> 0) do
    begin
      l:=1; r:=MaxA[N];
      while r-l > 1 do
        begin
          m1:=(l+r) div 2;
          if pow(m1,N) > B then
            r:=m1-1
          else
            l:=m1;
        end;
      m1:=l;
      l:=1; r:=MaxA[N];
      while r-l > 1 do
        begin
          m2:=(l+r) div 2;
          if pow(m2,N) < B then
            l:=m2+1
          else
            r:=m2;
        end;
      m2:=r;
      min:=abs(B-pow(m1,N));
      m:=m1;
      for i:=m1+1 to m2 do
        if min > abs(B-pow(i,N)) then
          begin
            min:=abs(B-pow(i,N));
            m:=i;
          end;
      WriteLn(m);
      ReadLn(B,N);
    end;
end.