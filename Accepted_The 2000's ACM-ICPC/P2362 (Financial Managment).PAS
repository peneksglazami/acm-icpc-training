{ACM ICPC 2001/2002 North America - Mid Atlantic
 Problem A - Financial Managment
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Var
  i: Integer;
  M: Double;
  S: LongInt;
Begin
  for i:=1 to 12 do
    Begin
      ReadLn(M);
      S:=S+Round(M*100);
    end;
  S:=Round(S/12);
  WriteLn('$',S/100:0:2);
end.