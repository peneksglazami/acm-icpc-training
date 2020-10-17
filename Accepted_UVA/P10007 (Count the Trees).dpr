{Problem: 10007 - Count the Trees
 Author: Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10007 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 300;
  Osn = 10000;

Type
  TLong = Array [0..1000] of Integer;
  ByPrime = Array [1..197] of Integer;

Var
  Prime: Array [0..197] of Integer;
  C: Array [1..MaxN] of TLong;
  P: Array [1..MaxN] of ByPrime;
  X,Y: ByPrime;
  i,j,g,N: Integer;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(Prime,SizeOf(Prime),0);
  for i:=2 to 4*MaxN+2 do
    Begin
      j:=1;
      Ok:=True;
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

Procedure IntToByPrime(N: Integer; Var B: ByPrime);
Var
  i: Integer;
Begin
  FillChar(B,SizeOf(B),0);
  i:=1;
  While N <> 1 do
    Begin
      While (N <> 1) and (N mod Prime[i] = 0) do
        Begin
          Inc(B[i]);
          N:=N div Prime[i];
        end;
      Inc(i);
    end;
end;

Procedure MultByPrime(A,B: ByPrime; Var C: ByPrime);
Var
  i: Integer;
Begin
  for i:=1 to Prime[0] do
    C[i]:=A[i]+B[i];
end;

Procedure DivByPrime(A,B: ByPrime; Var C: ByPrime);
Var
  i: Integer;
Begin
  for i:=1 to Prime[0] do
    C[i]:=A[i]-B[i];
end;

Procedure Mult(A: TLong; X: Integer; Var C: TLong);
Var
  i: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  if X = 0 then
    C[0]:=1
  else
    Begin
      for i:=1 to A[0] do
        Begin
          C[i+1]:=(A[i]*X+C[i]) div Osn;
          C[i]:=(A[i]*X+C[i]) mod Osn;
        end;
      if C[A[0]+1] > 0 then
        C[0]:=A[0]+1
      else
        C[0]:=A[0];
    end;
end;

Procedure WriteLong(A: TLong);
Var
  i,N: Integer;
  St: String;
Begin
  Str(Osn,St);
  N:=Length(St)-1;
  Str(A[A[0]],St);
  Write(St);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While Length(St) < N do
        St:='0'+St;
      Write(St);
    end;
  WriteLn;
end;

Begin
  CreatePrime;
  FillChar(P,SizeOf(P),0);
  C[1][0]:=1;
  C[1][1]:=1;
  for i:=1 to MaxN-1 do
    Begin
      IntToByPrime((2*i+1)*(2*i+2),X);
      IntToByPrime(i+2,Y);
      MultByPrime(P[i],X,X);
      DivByPrime(X,Y,P[i+1]);
      C[i+1][0]:=1;
      C[i+1][1]:=1;
      for j:=1 to Prime[0] do
        for g:=1 to P[i+1][j] do
          Mult(C[i+1],Prime[j],C[i+1]);
    end;
  ReadLn(N);
  While N <> 0 do
    Begin
      WriteLong(C[N]);
      ReadLn(N);
    end;
end.