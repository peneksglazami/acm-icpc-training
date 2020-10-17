{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem A - Fibonacci Sequence
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program ProblemA;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;
  MaxF = 2000000000;

var
  f: array [-MaxN..MaxN] of Int64;
  i,j,k,fi,fj,n,buf: Integer;
  down,up,m: Int64;

begin
  for i:=-MaxN to MaxN do
    f[i]:=-MaxF-1;
  ReadLn(i,fi,j,fj,n);
  f[i]:=fi;
  f[j]:=fj;
  if i > j then
    begin
      buf:=i; i:=j; j:=buf;
    end;
  if f[i+1] = -MaxF-1 then
    begin
      down:=-MaxF; up:=MaxF;
      while up-down > 1 do
        begin
          m:=(up+down) div 2;
          f[i+1]:=m;
          k:=i+2;
          while k < j do
            begin
              f[k]:=f[k-1]+f[k-2];
              if f[k] > MaxF then
                begin
                  up:=m;
                  Break;
                end
              else
                if f[k] < -MaxF then
                  begin
                    down:=m;
                    Break;
                  end;
              inc(k);
            end;
            if k = j then
              if f[k-2]+f[k-1] = f[j] then
                begin
                  up:=m;
                  down:=m;
                end
              else
                if f[k-2]+f[k-1] < f[j] then
                  down:=m
                else
                  up:=m;
        end;
      f[i+1]:=m;
    end;
  if n < i then
    while i > n do
      begin
        f[i-1]:=f[i+1]-f[i];
        dec(i);
      end
  else
    begin
      inc(i);
      while i < n do
        begin
          f[i+1]:=f[i]+f[i-1];
          inc(i);
        end;
    end;
  WriteLn(f[n]);
end.