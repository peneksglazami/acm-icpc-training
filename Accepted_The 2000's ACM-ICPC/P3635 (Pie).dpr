{Problem: 3635 - Pie
 ACM ICPC - Europe - Northwestern - 2006/2007
 Solve by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3635;
{$APPTYPE CONSOLE}
const
  MaxN = 10000;

var
  v: array [1..MaxN] of Double;
  i,Test,N,F: Integer;
  cnt: Int64;
  l,r,m: Double;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(N,F);
      for i:=1 to N do
        begin
          Read(r);
          v[i]:=100000*r*r;
        end;
      ReadLn;
      l:=1; r:=10000000000000;
      while r-l > 1 do
        begin
          m:=(l+r)/2;
          cnt:=0;
          for i:=1 to N do
            cnt:=cnt+trunc(v[i]/m);
          if cnt >= F+1 then
            l:=m
          else
            r:=m;
        end;
      m:=(l+r)/2;
      WriteLn(pi*m/100000:0:4);
      dec(Test);
    end;
end.