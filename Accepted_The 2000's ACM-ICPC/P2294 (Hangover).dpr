{Problem: 2294 - Hangover
 ACM ICPC - North America - Mid Central - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2294;
{$APPTYPE CONSOLE}
var
  a: array [1..520] of Integer;
  n,z: Integer;
  c: Double;

begin
  FillChar(a,SizeOf(a),0);
  n:=2; c:=0;
  while a[520] = 0 do
    begin
      c:=c+1/n;
      if n = 102 then
        n:=102;
      z:=trunc(100*c);
      if z > 520 then
        z:=520;
      while (z > 0) and (a[z] = 0) do
        begin
          a[z]:=n-1;
          Dec(z);
        end;
      Inc(n);
    end;
  ReadLn(c);
  while c > 0.0 do
    begin
      c:=100*c;
      n:=trunc(c);
      WriteLn(a[n],' card(s)');
      ReadLn(c);
    end;
end.