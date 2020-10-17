{Problem: 3619 - Sum of Different Primes
 ACM ICPC - Asia - Yokohama - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3619;
{$APPTYPE CONSOLE}
const
  MaxN = 1120;
  MaxK = 14;
  MaxP = 200;

var
  a: array [0..MaxN,0..MaxK,0..MaxP] of Integer;
  p: array [0..MaxP] of Integer;
  i,j,g,N,K: Integer;

procedure CreatePrime;
var
  i,j: Integer;
  Ok: Boolean;
begin
  p[0]:=1;
  p[1]:=2;
  i:=3;
  while i <= MaxN do
    begin
      j:=1;
      Ok:=True;
      while Ok and (j <= p[0]) and (p[j]*p[j] <= i) do
        begin
          Ok:=i mod p[j] <> 0;
          inc(j);
        end;
      if Ok then
        begin
          inc(p[0]);
          p[p[0]]:=i;
        end;
      inc(i,2);
    end;
end;

function Res(n,k,max_p: Integer): Integer;
var
  j: Integer;
begin
  if a[n,k,max_p] = -1 then
    begin
      a[n,k,max_p]:=0;
      j:=1;
      while (p[j] <= n) and (j <= max_p) do
        begin
          a[n,k,max_p]:=a[n,k,max_p]+Res(n-p[j],k-1,j-1);
          inc(j);
        end;
      end;
  Res:=a[n,k,max_p];
end;

begin
  CreatePrime;
  for i:=1 to MaxN do
    for j:=1 to MaxK do
      for g:=1 to MaxP do
        a[i,j,g]:=-1;
  for i:=0 to MaxP do
    a[0,0,i]:=1;
  ReadLn(N,K);
  while (N <> 0) or (K <> 0) do
    begin
      WriteLn(Res(N,K,p[0]));
      ReadLn(N,K);
    end;
end.