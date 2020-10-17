{Problem: 2116 - The Mobius Function
 ACM ICPC - North America - North Central - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2116;
{$APPTYPE CONSOLE}
const
  MaxN = 10000;

var
  p: array [0..1229] of Integer;
  n: Integer;

procedure Primes;
var
  i,j: Integer;
  Ok: Boolean;
begin
  p[0]:=1;
  p[1]:=2;
  i:=3;
  while i <= MaxN do
    begin
      Ok:=True;
      j:=1;
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

function M(n: Integer): Integer;
var
  i,pp: Integer; 
begin
  if n = 1 then
    M:=1
  else
    begin
      pp:=0;
      i:=1;
      M:=0;
      while n > 1 do
        begin
          if n mod p[i] = 0 then
            begin
              n:=n div p[i];
              inc(pp);
              if n mod p[i] = 0 then
                Exit;
            end;
          inc(i);
        end;
      if Odd(pp) then
        M:=-1
      else
        M:=1;
    end;
end;

begin
  Primes;
  Read(n);
  while n <> -1 do
    begin
      WriteLn('M(',n,') = ',M(n));
      Read(n);
      if n <> -1 then
        WriteLn;
    end;        
end.