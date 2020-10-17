{Problem: 3828 - Wavelet Compression
 ACM ICPC - North America - Rocky Mountain - 2007/2008
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3828;
{$APPTYPE CONSOLE}
const
  MaxN = 256;

var
  a, aa: array [1..MaxN] of Integer;
  i, N: Integer;

procedure Rec(N: Integer);
begin
  if N > 2 then
    Rec(N div 2);
  aa := a;
  for i := 1 to N div 2 do
    begin
      a[2 * i - 1] := (aa[i] + aa[N div 2 + i]) div 2;
      a[2 * i] := (aa[i] - aa[N div 2 + i]) div 2;
    end;
end;

begin
  Read(N);
  while N > 0 do
    begin
      for i := 1 to N do
        Read(a[i]);
      Rec(N);
      for i := 1 to N - 1 do
        Write(a[i], ' ');
      WriteLn(a[N]);
      Read(N);
    end;
end.