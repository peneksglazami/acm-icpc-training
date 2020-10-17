{Problem: 2457 - Pairs of integers
 ACM ICPC - Europe - Northeastern - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2457;
{$APPTYPE CONSOLE}
const
  MaxP = 100000;
  MaxL = 10;

var
  X,Y: array [1..MaxP] of Int64;
  a,b,c: array [1..MaxL] of Integer;
  i,N,NN,Test,d,p_cnt,cnt: Integer;

procedure Sort(l,r: Integer);
var
  i,j,xx,yy,buf: Integer;
begin
  i:=l;
  j:=r;
  xx:=x[(l+r) div 2];
  yy:=y[(l+r) div 2];
  repeat
    while (x[i] < xx) or ((x[i] = xx) and (y[i] < yy)) do inc(i);
    while (xx < x[j]) or ((xx = x[j]) and (yy < y[j])) do dec(j);
    if i <= j then
      begin
        buf:=x[i]; x[i]:=x[j]; x[j]:=buf;
        buf:=y[i]; y[i]:=y[j]; y[j]:=buf;
        inc(i); dec(j);
      end;
  until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

procedure solve(i,n,carry,bi: Integer);
var
  j: Integer;
begin
  if i = n then
    begin
      if n = bi then
        begin
          for j:=1 to 9 do
            begin
              a[i]:=j;
              solve(n,n,0,0);
            end;
          Exit;
        end;
      if a[n] <> 0 then
        begin
          inc(p_cnt);
          x[p_cnt]:=0;
          for i:=n downto 1 do
            x[p_cnt]:=10*x[p_cnt]+a[i];
          y[p_cnt]:=0;
          for i:=n-1 downto 1 do
            y[p_cnt]:=10*y[p_cnt]+b[i];
          if x[p_cnt]+y[p_cnt] <> NN then
            Dec(p_cnt);
        end
    end
  else
    if i < bi then
      begin
        if Odd(c[i]-carry) then
          Exit;
        a[i]:=(c[i]-carry) div 2;
        b[i]:=a[i];
        solve(i+1,n,0,bi);
        a[i]:=(10+c[i]-carry) div 2;
        b[i]:=a[i];
        solve(i+1,n,1,bi);
      end
    else
      if i = bi then
        begin
          for j:=0 to 9 do
            begin
              a[i]:=j;
              if a[i] <= c[i]-carry then
                begin
                  b[i]:=c[i]-carry-a[i];
                  a[i+1]:=b[i];
                  solve(i+1,n,0,bi);
                end;
              if c[i]-carry < a[i] then
                begin
                  b[i]:=10+c[i]-carry-a[i];
                  a[i+1]:=b[i];
                  solve(i+1,n,1,bi);
                end;
            end;
        end
      else
        begin
          if a[i] <= c[i]-carry then
            begin
              b[i]:=c[i]-carry-a[i];
              a[i+1]:=b[i];
              solve(i+1,n,0,bi);
            end;
          if c[i]-carry < a[i] then
            begin
              b[i]:=10+c[i]-carry-a[i];
              a[i+1]:=b[i];
              solve(i+1,n,1,bi);
            end;
        end;
end;

function St(X,L: Int64): String;
begin
  Str(X,Result);
  while Length(Result) < L do
    Result:='0'+Result;
end;

function DLen(X: Int64): Integer;
var
  S: String;
begin
  Str(X,S);
  DLen:=Length(S);
end;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(N);
      d:=0;
      NN:=N;
      while N <> 0 do
        begin
          inc(d);
          c[d]:=N mod 10;
          N:=N div 10;
        end;
      p_cnt:=0;
      for i:=1 to d do
        solve(1,d,0,i);
      if c[d] = 1 then
        for i:=1 to d-1 do
          solve(1,d-1,0,i);
      cnt:=0;
      if p_cnt > 0 then
        begin
          Sort(1,p_cnt);
          cnt:=1;
          for i:=2 to p_cnt do
            if (x[i] <> x[i-1]) or (y[i] <> y[i-1]) then
              inc(cnt);
        end;
      WriteLn(cnt);
      if p_cnt > 0 then
        begin
          dec(d);
          if DLen(X[1]) > d then
            inc(d);
          WriteLn(X[1],' + ',St(Y[1],d-1),' = ',NN);
          for i:=2 to p_cnt do
            if (x[i] <> x[i-1]) or (y[i] <> y[i-1]) then
              begin
                if DLen(X[i]) > d then
                  inc(d);
                WriteLn(X[i],' + ',St(Y[i],d-1),' = ',NN);
              end;
        end;
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.