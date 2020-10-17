{Problem: 3625 - Rounders
 ACM ICPC - North America - South Central - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3625;
{$APPTYPE CONSOLE}
var
  i, N, nn, x: Integer;
begin
  ReadLn(N);
  for i := 1 to N do
    begin
      ReadLn(x);
      nn := 10;
      while nn < x do
        begin
          if x mod nn >= 5*(nn div 10) then
            x := (x div nn + 1) * nn
          else
            x := x div nn * nn;
          nn := 10 * nn;
        end;
      WriteLn(x);
    end;
end.
