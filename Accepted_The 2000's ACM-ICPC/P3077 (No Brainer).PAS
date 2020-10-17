{ACM ICPC 2004/2005 North America - South Central
 Problem H - No Brainer
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemH (input, output);
Var
  N,X,Y: LongInt;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(X,Y);
      if X >= Y then
        WriteLn('MMM BRAINS')
      else
        WriteLn('NO BRAINS');
      Dec(N);
    end;
end.