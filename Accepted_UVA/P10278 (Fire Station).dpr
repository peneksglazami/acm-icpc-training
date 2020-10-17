{Problem: 10278 - Fire Station
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10278 (input,output);
Var
  A,AA,BB: Array [1..500] of Integer;
  S,M: Array [0..500] of Integer;
  B: Array [1..500,1..20] of Record Int,Dist: Integer; end;
  F: Array [1..500] of Integer;
  i,j,N,K,Test,X,Y,L,MinMax,MinMaxN,Max,Er: Integer;
  St: String;
  Nadoelo: Boolean;

Begin
  ReadLn(Test);
  ReadLn;
  While Test > 0 do
    Begin
      FillChar(B,SizeOf(B),0);
      FillChar(BB,SizeOf(BB),0);
      ReadLn(K,N);
      for i:=1 to N do
        A[i]:=MaxInt div 2;
      for i:=1 to K do
        Begin
          ReadLn(F[i]);
          A[F[i]]:=0;
        end;
      St:=' ';
      While (St <> '') and not EOF do
        Begin
          ReadLn(St);
          if St <> '' then
            Begin
              Val(Copy(St,1,Pos(' ',St)-1),X,Er);
              Delete(St,1,Pos(' ',St));
              Val(Copy(St,1,Pos(' ',St)-1),Y,Er);
              Delete(St,1,Pos(' ',St));
              Val(St,L,Er);
              Inc(BB[X]);
              B[X,BB[X]].Int:=Y;
              B[X,BB[X]].Dist:=L;
              Inc(BB[Y]);
              B[Y,BB[Y]].Int:=X;
              B[Y,BB[Y]].Dist:=L;
            end;
        end;
      for i:=1 to K do
        Begin
          S[0]:=1;
          S[1]:=F[i];
          Repeat
            Nadoelo:=True;
            M:=S;
            S[0]:=0;
            for j:=1 to M[0] do
              for k:=1 to BB[M[j]] do
                if A[M[j]]+B[M[j],k].Dist < A[B[M[j],k].Int] then
                  Begin
                    Nadoelo:=False;
                    Inc(S[0]);
                    S[S[0]]:=B[M[j],k].Int;
                    A[B[M[j],k].Int]:=A[M[j]]+B[M[j],k].Dist;
                  end;
          Until Nadoelo;
        end;
      MinMax:=MaxInt;
      for i:=1 to N do
        Begin
          AA:=A;
          S[0]:=1;
          S[1]:=i;
          AA[i]:=0;
          Repeat
            Nadoelo:=True;
            M:=S;
            S[0]:=0;
            for j:=1 to M[0] do
              for k:=1 to BB[M[j]] do
                if AA[M[j]]+B[M[j],k].Dist < AA[B[M[j],k].Int] then
                  Begin
                    Nadoelo:=False;
                    Inc(S[0]);
                    S[S[0]]:=B[M[j],k].Int;
                    AA[B[M[j],k].Int]:=AA[M[j]]+B[M[j],k].Dist;
                  end;
          Until Nadoelo;
          Max:=0;
          for j:=1 to N do
            if AA[j] > Max then
              Max:=AA[j];
          if MinMax > Max then
            Begin
              MinMax:=Max;
              MinMaxN:=i;
            end;
        end;
      WriteLn(MinMaxN);
      WriteLn;
      Dec(Test);
    end;
end.