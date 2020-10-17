{Problem: 3055 - Symmetric Order
 ACM ICPC - North America - Mid Central - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3055;
{$APPTYPE CONSOLE}
var
  a,b: array [1..15] of String;
  buf: String;
  i,n,l,r,n_case: Integer;

begin
  n_case:=0;
  ReadLn(n);
  while n > 0 do
    begin
      for i:=1 to n do
        ReadLn(a[i]);
      l:=1;
      r:=n;
      for i:=1 to n do
        if Odd(i) then
          begin
            b[l]:=a[i];
            inc(l);
          end
        else
          begin
            b[r]:=a[i];
            dec(r);
          end;
      inc(n_case);
      WriteLn('SET ',n_case);
      for i:=1 to n do
        WriteLn(b[i]);
      ReadLn(n);
    end;
end.