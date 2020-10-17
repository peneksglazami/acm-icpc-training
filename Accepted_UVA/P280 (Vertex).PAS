{Problem: 280 - Vertex
 Problem C - Southwestern European Regionals 1993
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem280 (input, output);
Var
  A: Array [1..100,1..100] of Boolean;
  X: Array [0..101] of Byte;
  i,j,m,N,Test,S,Amount: Integer;
  Ok: Boolean;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(A,SizeOf(A),False);
      Ok:=True;
      While Ok do
        Begin
          FillChar(X,SizeOf(X),101);
          i:=0;
          While not EOLn and (X[i] <> 0) do
            Begin
              Inc(i);
              Read(X[i]);
            end;
          ReadLn;
          if X[1] <> 0 then
            for j:=1 to i-2 do
              A[X[1],X[j+1]]:=True
          else
            Ok:=False;
        end;
      for m:=1 to N do
        for i:=1 to N do
          for j:=1 to N do
            A[i,j]:=A[i,j] or A[i,m] and A[m,j];
      Read(Test);
      for i:=1 to Test do
        Begin
          Read(S);
          Amount:=0;
          for j:=1 to N do
            if not A[S,j] then
              Inc(Amount);
          Write(Amount);
          for j:=1 to N do
            if not A[S,j] then
              Write(' ',j);
          WriteLn;
        end;
      ReadLn;
      ReadLn(N);
    end;
end.