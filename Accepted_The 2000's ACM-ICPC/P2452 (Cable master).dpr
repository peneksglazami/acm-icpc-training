{Problem: 2452 - Cable master
 ACM ICPC - Europe - Northeastern - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2452;
{$APPTYPE CONSOLE}
const
  MaxN = 10000;

var
  a: array [1..MaxN] of Integer;
  i,l,r,m,cnt,Test,N,K: Integer;
  x: Real;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(N,K);
      l:=0; r:=0;
      for i:=1 to N do
        begin
          ReadLn(x);
          a[i]:=Round(100*x);
          if r < a[i] then
            r:=a[i];
        end;
      while r-l > 1  do
        begin
          m:=(l+r) div 2;
          cnt:=0;
          if m <> 0 then
            for i:=1 to N do
              inc(cnt,a[i] div m);
          if cnt < K then
            r:=m-1
          else
            l:=m;
        end;
      m:=l;
      repeat
        inc(m);
        cnt:=0;
        if m <> 0 then
          for i:=1 to N do
            inc(cnt,a[i] div m);
      until cnt < K;
      WriteLn((m-1)/100:0:2);
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.