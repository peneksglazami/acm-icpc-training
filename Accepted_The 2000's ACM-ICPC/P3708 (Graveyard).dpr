{Problem: 3708 - Graveyard
 ACM ICPC - Europe - Northeastern Europe & Russian Republic - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
program Problem3708;
{$APPTYPE CONSOLE}
var
  i,n,m,x: Integer;
  res: Double;

begin
  while not EOF do
    begin
      ReadLn(n,m);
      res:=0;
      for i:=1 to n-1 do
        begin
          x:=i*(n+m) div n;
          if i*(n+m) mod n > n div 2 then
            inc(x);
          res:=res+abs(x/(n+m)-i/n);
        end;
      WriteLn(10000*res:0:4);
    end;
end.
