{ACM ICPC 2001/2002 - North America - Greater New York
 Problem A - Color Me Less
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Type
  RGB = Record
    R,G,B: LongInt;
   end;

Var
  Colors: Array [1..16] of RGB;
  i,MinN,R,G,B: LongInt;
  X: RGB;

Function Dist(A,B: RGB): LongInt;
Begin
  Dist:=Sqr(A.R-B.R)+Sqr(A.G-B.G)+Sqr(A.B-B.B);
end;

Begin
  for i:=1 to 16 do
    With Colors[i] do
      ReadLn(R,G,B);
  With X do
    ReadLn(R,G,B);
  While (X.R <> -1) or (X.G <> -1) or (X.B <> -1) do
    Begin
      MinN:=1;
      for i:=1 to 16 do
        if Dist(X,Colors[i]) < Dist(X,Colors[MinN]) then
          MinN:=i;
      WriteLn('(',X.R,',',X.G,',',X.B,') maps to (',Colors[MinN].R,',',Colors[MinN].G,',',Colors[MinN].B,')');
      With X do
        ReadLn(R,G,B);
    end;
end.