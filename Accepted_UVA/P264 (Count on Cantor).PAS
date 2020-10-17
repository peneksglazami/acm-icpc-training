{Problem: 264 - Count on Cantor
 Problem C - East Central Regionals 1993
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem264 (input, output);
Const
  Approx = 10e-10;

Var
  X,N,S: LongInt;
  NReal: Double;

Begin
  While not EOF do
    Begin
      ReadLn(X);
      NReal:=(Sqrt(1+8*X)-1)/2;
      if Abs(Frac(NReal)) > Approx then
        N:=Trunc(NReal)+1
      else
        N:=Trunc(NReal);
      S:=(N*(N+1)) div 2;
      if N mod 2 = 0 then
        Write('TERM ',X,' IS ',N-(S-X),'/',1+(S-X))
      else
        Write('TERM ',X,' IS ',1+(S-X),'/',N-(S-X));
      if not EOF then
        WriteLn
    end;
end.