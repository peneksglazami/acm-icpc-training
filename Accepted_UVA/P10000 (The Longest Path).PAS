{Problem: 10000 - The Longest Path
 Author: Miguel Revilla
 Solution: Andrey Grigorov}
{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10000 (input, output);
Var
  A: Array [1..100,1..100] of Byte;
  R: Array [1..100] of Integer;
  T,L: Set of 1..100;
  i,j,N,S,P,Q,Step,Max,n_case,p_f: Integer;

Begin
  ReadLn(N);
  n_case:=1;
  While N <> 0 do
    Begin
      FillChar(A,SizeOf(A),0);
      FillChar(R,SizeOf(R),0);
      ReadLn(S);
      ReadLn(P,Q);
      While (P <> 0) and (Q <> 0) do
        Begin
          A[P,Q]:=1;
          ReadLn(P,Q);
        end;
      T:=[S];
      Step:=1;
      Repeat
        L:=T;
        T:=[];
        for i:=1 to N do
          if i in L then
            for j:=1 to N do
              if (A[i,j] = 1) then
                Begin
                  T:=T+[j];
                  R[j]:=Step;
                end;
        Inc(Step);
      Until T = [];
      Max:=0;
      for i:=1 to N do
        if R[i] > Max then
          Begin
            Max:=R[i];
            p_f:=i;
          end;
      WriteLn('Case ',n_case,': The longest path from ',S,' has length ',Max,', finishing at ',p_f,'.');
      ReadLn(N);
      WriteLn;
      Inc(n_case);
    end;
end.