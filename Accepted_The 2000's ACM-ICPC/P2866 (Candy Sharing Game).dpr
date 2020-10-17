{ACM ICPC 2003/2004 North America - Greater New York
 Problem B - Candy Sharing Game
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2866 (input, output);
{$APPTYPE CONSOLE}
Var
  A,B: Array [0..1000] of Integer;
  i,j,N,Whistle: Integer;
  IsSame: Boolean;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      Whistle:=0;
      for i:=0 to N-1 do
        ReadLn(A[i]);
      IsSame:=True;
      i:=0;
      While IsSame and (i <= N-1) do
        Begin
          IsSame:=IsSame and (A[i mod N] = A[(i+1) mod N]);
          Inc(i);
        end;
      if not IsSame then
        Repeat
          B:=A;
          for i:=0 to N-1 do
            Begin
              Inc(A[(i+1) mod N],B[i mod N] div 2);
              Dec(A[i mod N],B[i mod N] div 2);
            end;
          for i:=0 to N-1 do
            if Odd(A[i]) then
              Inc(A[i]);
          IsSame:=True;
          i:=0;
          While IsSame and (i <= N-1) do
            Begin
              IsSame:=IsSame and (A[i mod N] = A[(i+1) mod N]);
              Inc(i);
            end;
          Inc(Whistle);
        Until IsSame;
      WriteLn(Whistle,' ',A[0]);
      ReadLn(N);
    end;
end.