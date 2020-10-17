{Problem: 10201 - Adventures in Moving - Part IV
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10201 (input,output);
{$APPTYPE CONSOLE}
Var
  A,OldA: Array [0..200] of Integer;
  i,j,N,L,D,OldD,P,Min,Er: Integer;
  St: String;

Begin
  ReadLn(N);
  ReadLn;
  While N > 0 do
    Begin
      for i:=0 to 100 do
        A[i]:=0;
      for i:=101 to 200 do
        A[i]:=MaxInt;
      OldD:=0;
      ReadLn(L);
      ReadLn(St);
      While (St <> '') do
        Begin
          Val(Copy(St,1,Pos(' ',St)-1),D,Er);
          Delete(St,1,Pos(' ',St));
          Val(St,P,Er);
          for i:=(D-OldD) to 200 do
            OldA[i-(D-OldD)]:=A[i];
          for i:=200-(D-OldD)+1 to 200 do
            OldA[i]:=MaxInt;
          A:=OldA;
          for i:=0 to 200 do
            for j:=i to 200 do
              if OldA[i] < MaxInt then
                if OldA[i] + P*(j-i) < A[j] then
                  A[j]:=OldA[i]+P*(j-i);
          OldD:=D;
          if not EOF then
            ReadLn(St)
          else
            Break;
        end;
      D:=L;
      for i:=(D-OldD) to 200 do
        OldA[i-(D-OldD)]:=A[i];
      for i:=200-(D-OldD)+1 to 200 do
        OldA[i]:=MaxInt;
      A:=OldA;
      Min:=MaxInt;
      for i:=100 to 200 do
        if A[i] < Min then
          Min:=A[i];
      if Min < MaxInt then
        WriteLn(Min)
      else
        WriteLn('Impossible');
      if N > 1 then
        WriteLn;
      Dec(N);
    end;
end.