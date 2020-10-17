{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_C;
{$APPTYPE CONSOLE}
const
  MaxN = 100000;

type
  Segment = record
    a,b,c: Integer;
  end;

var
  p,q: array [1..MaxN+1] of Segment;
  sa,sb: array [0..MaxN+1] of Integer;
  i,j,N,S1,S2,l,r,m: Integer;

procedure SortA(l,r: Integer);
var
  i,j,ax: Integer;
  buf: Segment;
begin
  i:=l;
  j:=r;
  ax:=p[(l+r) div 2].a;
  repeat
    while p[i].a < ax do inc(i);
    while p[j].a > ax do dec(j);
    if i <= j then
      begin
        buf:=p[i]; p[i]:=p[j]; p[j]:=buf;
        inc(i); dec(j);
      end;
  until i > j;
  if i < r then SortA(i,r);
  if j > l then SortA(l,j);
end;

procedure SortB(l,r: Integer);
var
  i,j,bx: Integer;
  buf: Segment;
begin
  i:=l;
  j:=r;
  bx:=q[(l+r) div 2].b;
  repeat
    while q[i].b < bx do inc(i);
    while q[j].b > bx do dec(j);
    if i <= j then
      begin
        buf:=q[i]; q[i]:=q[j]; q[j]:=buf;
        inc(i); dec(j);
      end;
  until i > j;
  if i < r then SortB(i,r);
  if j > l then SortB(l,j);
end;

begin
  ReadLn(N);
  ReadLn(p[1].a,p[1].b,p[1].c);
  for i:=1 to N do
    ReadLn(p[i+1].a,p[i+1].b,p[i+1].c);
  SortA(1,N+1);
  q:=p;
  SortB(1,N+1);
  sa[0]:=0;
  sb[0]:=0;
  for i:=1 to N+1 do
    begin
      sa[i]:=sa[i-1]+p[i].c;
      sb[i]:=sb[i-1]+q[i].c;
    end;
  for i:=1 to N do
    begin
      l:=0; r:=N+2;
      while r - l > 1 do
        begin
          m:=(l+r) div 2;
          if p[m].a <= i then
            l:=m
          else
            r:=m;
        end;
      while (l <= N+1) and (p[l].a <= i) do
        inc(l);
      S1:=sa[N+1]-sa[l-1];
      l:=0; r:=N+2;
      while r - l > 1 do
        begin
          m:=(l+r) div 2;
          if q[m].b >= i then
            r:=m
          else
            l:=m;
        end;
      while (r >= 1) and (q[r].b >= i) do
        dec(r);
      S2:=sb[r];
      Write(sa[N+1]-S1-S2,' ');
    end;
end.