{Problem: 10596 - Morning Walk
 Problemsetter: Muhammad Abul Hasan
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10596 (input, output);
Var
  A: Array [0..199] of Integer;
  D: Array [0..199,0..199] of Boolean;
  M: Array [0..199] of Boolean;
  i,N,K,c1,c2: Integer;
  Ok: Boolean;

Procedure Fill(i: Integer);
Var
  j: Integer;
Begin
  M[i]:=False;
  for j:=0 to N-1 do
    if D[i,j] and M[j] then
      Fill(j);
end;

Begin
  While not EOF do
    Begin
      FillChar(A,SizeOf(A),0);
      FillChar(M,SizeOf(M),True);
      FillChar(D,SizeOf(D),False);
      ReadLn(N,K);
      While K >= 1 do
        Begin
          ReadLn(c1,c2);
          D[c1,c2]:=True;
          D[c2,c1]:=True;
          Inc(A[c1]);
          Inc(A[c2]);
          Dec(K);
        end;
      Fill(0);
      Ok:=True;
      for i:=0 to N-1 do
        Ok:=Ok and not M[i];
      if Ok then
        for i:=0 to N-1 do
          if Odd(A[i]) then
            Begin
              Ok:=False;
              Break;
            end;
      if Ok then
        WriteLn('Possible')
      else
        WriteLn('Not Possible');
    end;
end.