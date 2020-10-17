{Problem: 10107 - What is the Median?
 Author: Sadi Khan
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 64384,0,655360}
Program Problem10107 (input,output);
Type
  Mas = Array [1..10000] of LongInt;

Var
  A: Mas;
  i,N: Integer;

Function Find(Var A: Mas; K,N: Integer): LongInt;
Var
  i,j,L,R: Integer;
  x,buf: LongInt;
Begin
  L:=1; R:=N;
  While L < R do
    Begin
      x:=A[(L+R) div 2]; i:=L; j:=R;
      Repeat
        While A[i] < x do Inc(i);
        While A[j] > x do Dec(j);
        if i <= j then
          Begin
            buf:=A[i]; A[i]:=A[j]; A[j]:=buf;
            Inc(i); Dec(j);
          end;
      Until i > j;
      if j < k then L:=i;
      if i > k then R:=j;
    end;
  Find:=A[k];
end;

Begin
  N:=0;
  While not EOF do
    Begin
      Inc(N);
      ReadLn(A[N]);
      if Odd(N) then
        WriteLn(Find(A,N div 2+1,N))
      else
        WriteLn(Trunc((Find(A,N div 2+1,N)+Find(A,N div 2,N))/2));
    end;
end.