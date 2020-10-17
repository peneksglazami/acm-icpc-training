{Problem: 3053 - Primary X-Subfactor Series
 ACM ICPC - North America - Mid Central - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3053;
{$APPTYPE CONSOLE}
const
  MaxL = 9;

type
  TMas = array [1..512] of Integer;

var
  cur,best: array [1..MaxL] of Integer;
  i,N,BestLen: Integer;

procedure QuickSort(var a: TMas; N: Integer);

  procedure Sort(l,r: Integer);
  var
    i,j,x,buf: Integer;
  begin
    i:=l;
    j:=r;
    x:=a[(l+r) div 2];
    repeat
      while a[i] < x do inc(i);
      while x < a[j] do dec(j);
      if i <= j then
        begin
          buf:=a[i]; a[i]:=a[j]; a[j]:=buf;
          inc(i); dec(j);
        end;
    until i > j;
    if i < r then Sort(i,r);
    if j > l then Sort(l,j);
  end;

begin
  Sort(1,N);
end;

procedure Solve(n,Len: Integer);
var
  a,b: array [1..MaxL+1] of Integer;
  mn: TMas;
  i,j,buf,nn,d,sub,sub_cnt: Integer;
  zero,first: Boolean;

begin
  cur[Len]:=n;
  d:=0;
  nn:=n;
  while nn > 0 do
    begin
      inc(d);
      a[d]:=nn mod 10;
      nn:=nn div 10;
    end;
  if d = 0 then
    begin
      d:=1;
      a[1]:=0;
    end;
  sub_cnt:=0;
  FillChar(b,SizeOf(b),0);
  b[1]:=1;
  repeat
    sub:=0;
    nn:=0;
    zero:=False;
    first:=True;
    for i:=d downto 1 do
      if b[i] = 1 then
        begin
          zero:=zero or (first and (a[i] = 0));
          sub:=10*sub+a[i];
          first:=False;
        end
      else
        nn:=10*nn+a[i];
    if not zero and (sub > 1) and (n mod sub = 0) and (sub <> n) then
      begin
        inc(sub_cnt);
        mn[sub_cnt]:=nn;
      end;
    i:=1;
    while b[i] = 1 do
      begin
        b[i]:=0;
        inc(i);
      end;
    b[i]:=1;
  until b[d+1] = 1;
  if sub_cnt = 0 then
    begin
      if Len > BestLen then
        begin
          BestLen:=Len;
          best:=cur;
        end;
    end
  else
    begin
      QuickSort(mn,sub_cnt);
      for i:=1 to sub_cnt do
        Solve(mn[i],Len+1);
    end;
end;

begin
  ReadLn(N);
  while N > 0 do
    begin
      BestLen:=0;
      Solve(N,1);
      Write(best[1]);
      for i:=2 to BestLen do
        Write(' ',best[i]);
      WriteLn;  
      ReadLn(N);
    end;
end.