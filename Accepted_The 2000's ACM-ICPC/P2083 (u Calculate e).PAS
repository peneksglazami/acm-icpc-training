{ACM ICPC 2000/2001 North America - Greater New York
 Problem A - u Calculate e
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Var
  F: Array [0..9] of LongInt;
  E: Double;
  i,n: Integer;

Begin
  F[0]:=1;
  for i:=1 to 9 do
    F[i]:=F[i-1]*i;
  WriteLn('n e');
  WriteLn('- -----------');
  WriteLn('0 1');
  WriteLn('1 2');
  WriteLn('2 2.5');
  for n:=3 to 9 do
    Begin
      E:=0.0;
      for i:=0 to n do
        E:=E+1/F[i];
      WriteLn(n,' ',E:0:9);
    end;
end.