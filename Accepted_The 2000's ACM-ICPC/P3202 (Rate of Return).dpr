{Problem: 3202 - Rate of Return
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3202;
{$APPTYPE CONSOLE}
const
  MaxN = 100;
  approx = 1e-6;
  Osn = 1000000;

type
  Double = Extended;
  
var
  p: array [1..MaxN] of Double;
  m: array [1..MaxN] of Integer;
  i,N,fm,n_case,l,r,x: Integer;
  fp,res: Double;
  Find: Boolean;

function pow(n: Double; d: Integer): Double;
begin
  Result:=exp(d*ln(n));
end;

function Sum(rate: Double): Double;
var
  i: Integer;
begin
  Result:=0.0;
  for i:=1 to N do
    Result:=Result+p[i]*pow(rate,fm-m[i]+1);
end;

begin
  Read(N);
  n_case:=0;
  while N <> -1 do
    begin
      for i:=1 to N do
        Read(m[i],p[i]);
      Read(fm,fp);
      l:=0; r:=Osn;
      while r-l > 1 do
        begin
          x:=(r+l) div 2;
          res:=Sum(1+x*approx);
          if res > fp then
            r:=x
          else
            l:=x;
        end;
      Inc(n_case);
      WriteLn('Case ',n_case,': ',l/Osn:0:5);
      Read(N);
      if N <> -1 then
        WriteLn;
    end;
end.