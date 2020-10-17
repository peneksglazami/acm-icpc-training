{Problem: 2678 - Subsequence
 ACM ICPC - Europe - Southeastern - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2678;
{$APPTYPE CONSOLE}
const
  MaxN = 100000;

var
  a: array [1..MaxN] of Integer;
  d: array [0..MaxN] of Integer;
  i,N,S,cnt,l,r,m: Integer;

begin
  while not EOF do
    begin
      ReadLn(N,S);
      d[0]:=0;
      for i:=1 to N do
        begin
          Read(a[i]);
          d[i]:=d[i-1]+a[i];
        end;
      ReadLn;
      if d[N] < S then
        WriteLn(0)
      else
        begin
          cnt:=N;
          for i:=0 to N do
            if d[N]-d[i] >= S then
              begin
                l:=i; r:=N;
                while r-l > 1 do
                  begin
                    m:=(l+r) div 2;
                    if d[m]-d[i] < S then
                      l:=m+1
                    else
                      r:=m;
                  end;
                while d[r]-d[i] < S do
                  inc(r);
                while d[r-1]-d[i] >= S do
                  dec(r);
                if r-i < cnt then
                  cnt:=r-i;
              end
            else
              Break;
          WriteLn(cnt);
        end;
    end;
end.