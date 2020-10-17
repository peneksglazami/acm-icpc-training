{Program: 10303 - How Many Trees?
 The Joint Effort Contest, Problem setter: Rodrigo Malta Schmidt
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10303 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 1000000;

Type
  ByPrime = Array [1..551] of Integer;
  TLong = Array [0..101] of Integer;
  TCatalan = Record
    A,B: ByPrime;
   end; 

Var
  Prime: Array [0..551] of Integer;
  Catalan: Array [1..1000] of TLong;
  N: Integer;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(Prime,SizeOf(Prime),0);
  for i:=2 to 4002 do
    Begin
      Ok:=True;
      j:=1;
      While Ok and (j <= Prime[0]) and (Sqr(Prime[j]) <= i) do
        Begin
          Ok:=i mod Prime[j] <> 0;
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(Prime[0]);
          Prime[Prime[0]]:=i;
        end;
    end;
end;

Procedure ToPrime(A: Integer; Var B: ByPrime);
Var
  i: Integer;
Begin
  FillChar(B,SizeOf(B),0);
  i:=1;
  While (A <> 0) and (i <= Prime[0]) do
    Begin
      While (A mod Prime[i] = 0) and (A <> 0) do
        Begin
          A:=A div Prime[i];
          Inc(B[i]);
        end;
      Inc(i);
    end;
end;

Procedure MultLongByInt(A: TLong; X: Integer; Var C: TLong);
Var
  i,N: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  if X = 0 then
    C[0]:=1
  else
    Begin
      N:=A[0];
      for i:=1 to N do
        Begin
          C[i+1]:=(A[i]*X+C[i]) div Osn;
          C[i]:=(A[i]*X+C[i]) mod Osn;
        end;
      if C[N+1] > 0 then
        C[0]:=N+1
      else
        C[0]:=N;
    end;
end;

Procedure CreateCatalan;
Var
  n,i,j: Integer;
  C: ByPrime;
  D: TCatalan;
Begin
  FillChar(Catalan,SizeOf(Catalan),0);
  FillChar(C,SizeOf(C),0);
  Catalan[1][0]:=1;
  Catalan[1][1]:=1;
  for n:=1 to 999 do
    Begin
      Catalan[n+1][0]:=1;
      Catalan[n+1][1]:=1;
      ToPrime(4*n+2,D.A);
      ToPrime(n+2,D.B);
      for i:=1 to Prime[0] do
        Begin
          Inc(C[i],D.A[i]-D.B[i]);
          for j:=1 to C[i] do
            MultLongByInt(Catalan[n+1],Prime[i],Catalan[n+1]);
        end;
    end;
end;

Function LongToString(A: TLong): String;
Var
  i,N: Integer;
  St: String;
Begin
  Str(Osn,St);
  N:=Length(St)-1;
  Str(A[A[0]],Result);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While Length(St) < N do
        St:='0'+St;
      Result:=Result+St;
    end;
end;

Begin
  CreatePrime;
  CreateCatalan;
  While not EOF do
    Begin
      ReadLn(N);
      WriteLn(LongToString(Catalan[N]));
    end;
end.