{Problem: 151 - Power Crisis
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem151 (input, output);
Var
  A: Array [1..100] of Boolean;
  i,j,m,All,N: Integer;
  Ok: Boolean;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      m:=1;
      Ok:=False;
      While not Ok do
        Begin
          FillChar(A,SizeOf(A),False);
          A[1]:=True;
          All:=N-1;
          i:=1;
          While not A[13] do
            Begin
              j:=0;
              While (j < m) do
                Begin
                  if not A[i] then
                    Inc(j);
                  if (j = m) then
                    Begin
                      A[i]:=True;
                      Dec(All);
                    end;
                  i:=(i+1) mod N;
                  if (i = 0) then
                    i:=N;
                end;
            end;
          if All = 0 then
            Ok:=True;
          Inc(m);
        end;
      WriteLn(m-1);
      ReadLn(N);
    end;
end.