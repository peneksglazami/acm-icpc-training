{Problem: 2734 - Water Tanks
 ACM ICPC - Oceania - South Pacific - 2003/2004
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2734;
{$APPTYPE CONSOLE}
const
  approx = 1e-10;
  MaxN = 200;

var
  a,b: array [1..maxN] of Integer;
  d: array [1..MaxN,1..MaxN] of Boolean;
  t: array [1..MaxN,1..MaxN] of Integer;
  St,Name: String;
  i,j,N,min,Sum: Integer;
  Level: Double;

procedure Trim(var St: String);
begin
  while (St <> '') and (St[1] = ' ') do
    Delete(St,1,1);
end;

function NextLetter(var St: String): Char;
begin
  Result:=UpCase(St[1]);
  Delete(St,1,Pos(' ',St));
  Trim(St);
end;

function next(i: Integer): Integer;
begin
  if i < N then
    next:=i+1
  else
    next:=1;
end;

function pre(i: Integer): Integer;
begin
  if i > 1 then
    pre:=i-1
  else
    pre:=N;
end;

function res(i,j: Integer): Integer;
var
  k: Integer;
begin
  if t[i,j] = -1 then
    begin
      if i < j then
        t[i,j]:=j-i
      else
        t[i,j]:=N-i+j;
      k:=i;
      while k <> j do
        begin
          if d[i,k] and d[next(k),j] and (t[i,j] > res(i,k)+res(next(k),j)) then
            t[i,j]:=res(i,k)+res(next(k),j);
          k:=next(k);
        end;
    end;
  res:=t[i,j];
end;

begin
  ReadLn(St);
  Trim(St);
  while St <> '#' do
    begin
      Name:='';
      St:=St+' ';
      while St <> '' do
        Name:=Name+NextLetter(St);
      Read(N);
      Sum:=0;
      for i:=1 to N do
        begin
          Read(a[i]);
          Inc(Sum,a[i]);
        end;
      ReadLn;
      Level:=Sum/N;
      b[1]:=a[1];
      for i:=2 to N do
        b[i]:=b[i-1]+a[i];
      for i:=1 to N do
        for j:=1 to N do
          if i <= j then
            d[i,j]:=Abs((b[j]-b[i]+a[i])/(j-i+1)-Level) < approx
          else
            d[i,j]:=Abs((b[n]-b[i]+b[j]+a[i])/(n-i+j+1)-Level) < approx;
      for i:=1 to N do
        for j:=1 to N do
          t[i,j]:=-1;
      for i:=1 to N do
        t[i,i]:=0;
      min:=N-1;
      for i:=1 to N do
        for j:=i to N do
          if d[i,j] and d[next(j),pre(i)] and (min > res(i,j)+res(next(j),pre(i))) then
            min:=res(i,j)+res(next(j),pre(i));
      WriteLn(Name,': ',min);
      ReadLn(St);
      Trim(St);
    end;
end.