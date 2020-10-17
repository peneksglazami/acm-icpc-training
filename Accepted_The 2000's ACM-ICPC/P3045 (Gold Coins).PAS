{ACM ICPC 2004/2005 North America - Rocky Mountain
 Problem A - Gold Coins
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemD;
Var
  A: Array [0..10000] of LongInt;
  i,j,k,N: Integer;

Begin
  j:=1;
  for i:=1 to 10000 do
    Begin
      A[i]:=A[i-1]+j;
      Inc(k);
      if k = j then
        Begin
          Inc(j);
          k:=0;
        end;
    end;
  ReadLn(N);
  While N <> 0 do
    Begin
      WriteLn(N,' ',A[N]);
      ReadLn(N);
    end;
end.