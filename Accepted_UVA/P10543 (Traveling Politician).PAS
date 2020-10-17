{Problem: 10543 - Traveling Politician
 Author: Igor Naverniouk
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10543 (input, output);
Var
  A: Array [0..50,0..50] of Boolean;
  P: Array [0..50] of Byte;
  S,L: Set of 0..50;
  i,j,g,N,M,K,V,U: Integer;

Begin
  ReadLn(N,M,K);
  While (N <> 0) or (M <> 0) or (K <> 0) do
    Begin
      FillChar(A,SizeOf(A),False);
      FillChar(P,SizeOf(P),0);
      While M >= 1 do
        Begin
          ReadLn(U,V);
          A[U,V]:=True;
          Dec(M);
        end;
      S:=[0];
      P[0]:=1;
      for i:=2 to K do
        Begin
          L:=S;
          S:=[];
          for j:=0 to N-1 do
            if (j in L) then
              for g:=0 to N-1 do
                if A[j,g] and (j <> g) then
                  Begin
                    S:=S+[g];
                    P[g]:=i;
                  end;
        end;
      if P[N-1] = K then
        WriteLn(P[N-1])
      else
        Begin
          for i:=K+1 to 20 do
            Begin
              L:=S;
              S:=[];
              for j:=0 to N-1 do
                Begin
                  if (j in L) then
                    for g:=0 to N-1 do
                      if A[j,g] and (j <> g) then
                        Begin
                          S:=S+[g];
                          P[g]:=i;
                          if g = N-1 then
                            Break;
                        end;
                  if P[N-1] > K then
                    Break;
                end;
            end;
          if P[N-1] > K then
            WriteLn(P[N-1])
          else
            WriteLn('LOSER');
        end;
      ReadLn(N,M,K);
    end;
end.