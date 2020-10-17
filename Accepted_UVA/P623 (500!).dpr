Program Problem623 (input, output);

{$APPTYPE CONSOLE}

Const
  Osn = 100000;

Type
  TLong = Array [0..2000] of LongInt;

Var
  A: TLong;
  X: Array [1..1000] of TLong;
  N,i,j: LongInt;

Procedure Mult(A: TLong; N: LongInt; Var B: Tlong);
Var
  i,d: LongInt;
Begin
  FillChar(B,SizeOf(B),0);
  if (N = 0) then
    B[0]:=1
  else
    Begin
      d:=0;
      i:=1;
      While (i <= A[0]+1) do
        Begin
          B[i]:=(A[i]*N+d) mod Osn;
          d:=(A[i]*N+d) div Osn;
          Inc(i);
        end;
      Dec(i);
      if B[i] = 0 then
        B[0]:=i-1
      else
        B[0]:=i;
    end;
end;

Procedure WriteTLong(A: TLong);
Var
  St: String;
  i: LongInt;
Begin
  Write(A[A[0]]);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While Length(St) < 5 do
        St:='0'+St;
      Write(St);
    end;
  WriteLn;
end;

Begin
  FillChar(X,SizeOf(X),0);
  A[0]:=1;
  A[1]:=1;
  for i:=1 to 1000 do
    Begin
      Mult(A,i,A);
      X[i]:=A;
    end;
  While not EOF do
    Begin
      ReadLn(N);
      WriteLn(N,'!');
      if N = 0 then
        WriteLn('1')
      else
        WriteTLong(X[N]);
    end;
end.