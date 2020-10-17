Program Problem10523 (input, output);
Type
  TLong = Array [0..1000] of LongInt;

Var
  i,A,N: Integer;
  X,Y,S: TLong;

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

Procedure Mult(A: TLong; N: Word; Var B: TLong);
Var
  i,d: Word;
Begin
  FillChar(B,SizeOf(B),0);
  if N = 0 then
    B[0]:=1
  else
    Begin
      d:=0;
      for i:=1 to A[0]+1 do
        Begin
          B[i]:=(A[i]*N+d) mod 1000;
          d:=(A[i]*N+d) div 1000;
        end;
      if B[i] = 0 then
        B[0]:=i-1
      else
        B[0]:=i;
    end;
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

Begin
  While not EOF do
    Begin
      ReadLn(N,A);
      FillChar(S,SizeOf(S),0);
      FillChar(X,SizeOf(X),0);
      S[0]:=1;
      S[0]:=0;
      X[0]:=1;
      X[1]:=1;
      for i:=1 to N do
        Begin
          Mult(X,A,X);
          Mult(X,i,Y);
          Sum(Y,S,S);
        end;
      WriteTLong(S);
    end;
end.