{ACM 2004-2005 Southeastern European Regional Programming Contest
 Problem I - Count on Cantor
 Solved by Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem3034;
{$APPTYPE CONSOLE}

Var
  N,M,L,X: Integer;

Begin
  While not EOF do
    Begin
      ReadLn(X);
      N:=Trunc((Sqrt(1+8*X)-1)/2);
      if (Sqr(N)+ N) div 2 <> X then
        Inc(N);
      L:=(Sqr(N)+N) div 2;
      M:=L-X+1;
      if (N mod 2 <> 0) then
        WriteLn('TERM ',X,' IS ',M,'/',N-M+1)
      else
        WriteLn('TERM ',X,' IS ',N-M+1,'/',M);
    end;
end.