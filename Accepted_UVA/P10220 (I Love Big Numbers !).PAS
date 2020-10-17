Program Problem10220 (input, output);
Type
  TLong = Array [0..3000] of LongInt;
Var
  S: LongInt;
  A: TLong;
  N,i,j: Word;

Procedure Sum(A,B: Tlong; Var C: TLong);
Var
  i,j: Word;
Begin
  FillChar(C,SizeOf(C),0);
  if A[0] > B[0] then
    i:=A[0]
  else
    i:=B[0];
  for j:=1 to i do
    Begin
      C[j+1]:=(C[j]+A[j]+B[j]) div 1000;
      C[j]:=(C[j]+A[j]+B[j]) mod 1000;
    end;
  if C[j+1] <> 0 then
    C[0]:=j+1
  else
    C[0]:=j;
end;

Procedure Mult(A: Tlong; n: Word; Var C: TLong);
Var
  i,d: Word;
Begin
  FillChar(C,SizeOf(C),0);
  if n = 0 then
    C[0]:=1
  else
    Begin
      d:=0;
      for i:=1 to A[0]+1 do
        Begin
          C[i]:=(A[i]*n+d) mod 1000;
          d:=(A[i]*n+d) div 1000;
        end;
      if C[i] <> 0 then
        C[0]:=i
      else
        C[0]:=i-1;
    end;
end;

Begin
  While not EOF(input) do
    Begin
      ReadLn(N);
      S:=0;
      A[0]:=1;
      A[1]:=1;
      for i:=1 to N do
        Mult(A,i,A);
      for i:=1 to A[0]-1 do
        for j:=1 to 3 do
          Begin
            Inc(S,A[i] mod 10);
            A[i]:=A[i] div 10;
          end;
      While A[A[0]] <> 0 do
        Begin
          Inc(S,A[A[0]] mod 10);
          A[A[0]]:=A[A[0]] div 10;
        end;
      WriteLn(S);
    end;
end.