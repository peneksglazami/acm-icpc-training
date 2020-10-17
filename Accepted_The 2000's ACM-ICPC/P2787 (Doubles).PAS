{ACM ICPC 2003/2004 - North America - Mid Central
 Problem F - Doubles
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2787 (input, output);
Var
  A: Array [1..16] of Integer;
  i,j,N,Change,Amount: Integer;

Begin
  Read(A[1]);
  N:=1;
  While A[1] <> -1 do
    Begin
      Read(A[N+1]);
      While A[N+1] <> 0 do
        Begin
          Inc(N);
          Read(A[N+1]);
        end;
      ReadLn;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if A[i] > A[j] then
            Begin
              Change:=A[i];
              A[i]:=A[j];
              A[j]:=Change;
            end;
      Amount:=0;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if 2*A[i] = A[j] then
            Inc(Amount);
      WriteLn(Amount);
      Read(A[1]);
      N:=1;
    end;
end.