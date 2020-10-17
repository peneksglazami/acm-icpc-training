{Problem: 10323 - Factorial! You Must be Kidding!!!
 Problem M - GWCF Contest 4 - The Decider Contest
 Author: Shahriar Manzoor
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10323 (input, output);
Var
  A: Array [8..12] of LongInt;
  i,X: LongInt;
Begin
  X:=1;
  for i:=2 to 7 do
    X:=X*i;
  for i:=8 to 12 do
    Begin
      X:=X*i;
      A[i]:=X;
    end;
  While not EOF do
    Begin
      ReadLn(X);
      if (X >= 0) and (X <= 7) then
        WriteLn('Underflow!');
      if (X >= 14) then
        WriteLn('Overflow!');
      if (X < 0) then
        if (X mod 2 <> 0) then
          WriteLn('Overflow!')
        else
          WriteLn('Underflow!');
      if (X >= 8) and (X <= 12) then
        WriteLn(A[X]);
      if X = 13 then
        WriteLn('6227020800');
    end;
end.