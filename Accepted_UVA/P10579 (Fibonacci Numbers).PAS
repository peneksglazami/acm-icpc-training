Program Problem10579 (input,output);
Type
  TLong = Array[0..400] of Word;
Var
  A,B,C: TLong;

Procedure Sum(A,B: TLong; Var C: TLong);
Var
  i,j: Word;
Begin
  FillChar(C,SizeOf(C),0);
  if A[0] > B[0] then
    j:=A[0]
  else
    j:=B[0];
  for i:=1 to j do
    Begin
      C[i+1]:=(A[i]+B[i]+C[i]) div 1000;
      C[i]:=(A[i]+B[i]+C[i]) mod 1000;
    end;
  if C[i+1] = 0 then
    C[0]:=i
  else
    C[0]:=i+1;
end;

Procedure WriteTLong(A: TLong);
Var
  i: Word;
  St: String;
Begin
  Write(A[A[0]]);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While (Length(St) < 3) do
        St:='0'+St;
      Write(St);
    end;
  WriteLn;
end;

Var
  i,n: Word;

Begin
  While not EOF(input) do
    Begin
      A[0]:=1;
      A[1]:=1;
      B[0]:=1;
      B[1]:=1;
      ReadLn(n);
      if n = 1 then
        WriteTLong(A);
      if n = 2 then
        WriteTlong(B);
      if n >= 3 then
        Begin
          for i:=1 to n-2 do
            Begin
              Sum(A,B,C);
              A:=B;
              B:=C;
            end;
          WriteTLong(C);
        end;
    end;
  ReadLn;
end.