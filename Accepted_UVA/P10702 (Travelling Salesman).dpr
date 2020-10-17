{Problem: 10702 - Travelling Salesman
 Solution: Andrey Grigorov}
 
{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem10702 (input, output);
{$APPTYPE CONSOLE}
Var
  A: Array [1..100,1..100] of Integer;
  P,L: Array [1..100] of Integer;
  M,N,CanEnd: Set of 1..100;
  i,j,g,C,S,E,T,Max: Integer;

Begin
  ReadLn(C,S,E,T);
  While (C <> 0) or (S <> 0) or (E <> 0) or (T <> 0) do
    Begin
      for i:=1 to C do
        Begin
          for j:=1 to C do
            Read(A[i,j]);
          ReadLn;
        end;
      CanEnd:=[];
      for i:=1 to E do
        Begin
          Read(j);
          CanEnd:=CanEnd+[j];
        end;
      ReadLn;
      ReadLn;
      FillChar(P,SizeOf(P),0);
      M:=[S];
      for i:=1 to T do
        Begin
          L:=P;
          FillChar(P,SizeOf(P),0);
          N:=M;
          M:=[];
          for j:=1 to C do
            if j in N then
              for g:=1 to C do
                if (L[j]+A[j,g] > P[g]) and (j <> g) then
                  Begin
                    P[g]:=L[j]+A[j,g];
                    M:=M+[g];
                  end;
        end;
      Max:=0;
      CanEnd:=CanEnd*M;
      for i:=1 to C do
        if (i in CanEnd) and (Max < P[i]) then
          Max:=P[i];
      WriteLn(Max);
      ReadLn(C,S,E,T);
    end;
end.