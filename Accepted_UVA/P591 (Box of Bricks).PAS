{Problem: 591 - Box of Bricks
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem591 (input,output);
Var
  a: Array [1..50] of LongInt;
  i,Sum,N,M,n_case: LongInt;

Begin
  n_case:=0;
  ReadLn(N);
  While N <> 0 do
    Begin
      Sum:=0;
      for i:=1 to N do
        Begin
          Read(a[i]);
          Inc(Sum,a[i]);
        end;
      M:=0;
      for i:=1 to N do
        if a[i] > Sum div N then
          Inc(M,a[i]-(Sum div N));
      Inc(n_case);
      WriteLn('Set #',n_case);
      WriteLn('The minimum number of moves is ',M,'.');
      WriteLn;
      ReadLn(N);
    end;
end.