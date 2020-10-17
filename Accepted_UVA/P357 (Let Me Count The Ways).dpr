{Problem: 357 - Let Me Count The Ways
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem357 (input,output);
{$APPTYPE CONSOLE}
Const
  Coins:  Array [1..5] of Int64 = (1,5,10,25,50);

Var
  A: Array [0..30000] of Int64;
  i,j,N: Integer;
  c: Int64;

Begin
  FillChar(A,SizeOf(A),0);
  A[0]:=1;
  for i:=1 to 5 do
    Begin
      c:=Coins[i];
      for j:=0 to 30000-c do
        A[j+c]:=A[j+c]+A[j];
    end;
  While not EOF do
    Begin
      ReadLn(N);
      if A[N] = 1 then
        WriteLn('There is only 1 way to produce ',N,' cents change.')
      else
        WriteLn('There are ',A[N],' ways to produce ',N,' cents change.');
    end;
end.