{Problem: 562 - Dividing coins
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem562 (input,output);
Type
  Mas = Array [0..50000] of Boolean;

Var
  Coins: Array [1..100] of Integer;
  A,B: ^Mas;
  Sum,D,S: LongInt;
  i,j,N,M: Integer;

Begin
  New(A);
  New(B);
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(M);
      Sum:=0;
      for i:=1 to M do
        Begin
          Read(Coins[i]);
          Inc(Sum,Coins[i]);
        end;
      for i:=1 to Sum do
        A^[i]:=False;
      A^[0]:=True;
      for i:=1 to M do
        Begin
          for j:=1 to Sum do
            B^[j]:=False;
          for j:=0 to Sum-Coins[i] do
            if A^[j] then
              Begin
                B^[j]:=True;
                B^[j+Coins[i]]:=True;
              end;
          for j:=0 to Sum do
            A^[j]:=B^[j];
        end;
      S:=Sum div 2;
      D:=0;
      While not (A^[S-D] or A^[S+D]) do
        Inc(D);
      D:=2*D;
      if Odd(Sum) then
        Inc(D);
      WriteLn(D);
      Dec(N);
    end;
  Dispose(A);
  Dispose(B);
end.