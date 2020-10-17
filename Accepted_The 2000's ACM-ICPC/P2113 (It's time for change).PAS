{ACM ICPC 2000/2001 North America - Mid Atlantic
 Problem G - It's time for change
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G+,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemG (input, output);
Const
  Coins: Array [1..5] of Integer = (1,5,10,25,50);
  MaxN = 200;

Var
  A: Array [0..MaxN] of Integer;
  V: Real;
  i,j,c,N: LongInt;

Begin
  A[0]:=1;
  for i:=1 to 5 do
    Begin
      c:=Coins[i];
      j:=0;
      While j+c <= MaxN do
        Begin
          Inc(A[j+c],A[j]);
          Inc(j);
        end;
    end;
  ReadLn(V);
  N:=Round(100*V);
  While N > 0 do
    Begin
      WriteLn('There are ',A[N],' ways to make $',V:0:2);
      ReadLn(V);
      N:=Round(100*V);
    end;
  WriteLn('End of Output');
end.