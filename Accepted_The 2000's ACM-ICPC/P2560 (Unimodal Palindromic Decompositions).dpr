{ACM ICPC 2002/2003 North America - Greater New York
 Problem E - Unimodal Palindromic Decompositions
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program ProblemE (input, output);
{$APPTYPE CONSOLE}
Const
  MaxN = 750;

Var
  A,B: Array [0..MaxN] of Int64;
  i,j,g,N: Integer;
  Sum: Int64;

Procedure CreateA;
Var
  i,j: Integer;
Begin
  FillChar(A,SizeOf(A),0);
  A[0]:=1;
  for i:=1 to MaxN do
    Begin
      j:=0;
      While j+i <= MaxN do
        Begin
          Inc(A[j+i],A[j]);
          Inc(j);
        end;
    end;
end;

Begin
  CreateA;
  ReadLn(N);
  While N <> 0 do
    Begin
      Sum:=0;
      if not Odd(N) then
        Sum:=A[N div 2];
      for i:=0 to N do
        if not Odd(N - i) then
          Begin
            FillChar(B,SizeOf(B),0);
            B[0]:=1;
            for j:=1 to i do
              Begin
                g:=0;
                While g+j <= (N-i) div 2 do
                  Begin
                    Inc(B[g+j],B[g]);
                    Inc(g);
                  end;
              end;
            Inc(Sum,B[(N-i) div 2]);
          end;
      WriteLn(N,' ',Sum);
      ReadLn(N);
    end;
end.