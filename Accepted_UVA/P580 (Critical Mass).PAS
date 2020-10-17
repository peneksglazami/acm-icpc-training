{Problem: 580 - Critical Mass
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem580 (input,output);
Const
  Osn = 10000;
  MaxN = 100;

Type
  TLong = Array [0..50] of LongInt;

Var
  F,BB: Array [0..MaxN] of TLong;
  A,B,C,Res: TLong;
  i,N: Integer;

Procedure Sum(A,B: TLong; Var C: TLong);
Var
  i,N: Integer;
Begin
  Fillchar(C,SizeOf(C),0);
  if A[0] > B[0] then
    N:=A[0]
  else
    N:=B[0];
  for i:=1 to N do
    Begin
      C[i+1]:=(A[i]+B[i]+C[i]) div Osn;
      C[i]:=(A[i]+B[i]+C[i]) mod Osn;
    end;
  if C[N+1] > 0 then
    C[0]:=N+1
  else
    C[0]:=N;
end;

Procedure Sub(A,B: TLong; Var C: TLong);
Var
  i,j: Integer;
Begin
  C:=A;
  for i:=1 to B[0] do
    Begin
      Dec(C[i],B[i]);
      j:=i;
      While (C[j] < 0) and (j <= C[0]) do
        Begin
          Inc(C[j],Osn);
          Dec(C[j+1]);
          Inc(j);
        end;
    end;
  i:=C[0];
  While (C[i] = 0) and (i > 1) do
    Dec(i);
  C[0]:=i;
end;

Procedure Mult(A: TLong; X: LongInt; Var C: TLong);
Var
  i: Integer;
Begin
  FillChar(C,SizeOf(C),0);
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

Procedure PrintLong(A: TLong);
Var
  i,N: Integer;
  St: String;
Begin
  Str(Osn,St);
  N:=Length(St)-1;
  Write(A[A[0]]);
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
  FillChar(F,SizeOf(F),0);
  FillChar(A,SizeOf(A),0);
  FillChar(B,SizeOf(B),0);
  FillChar(C,SizeOf(C),0);
  F[0][0]:=1; F[0][1]:=2;
  A[0]:=1; A[1]:=1;
  B[0]:=1; B[1]:=1;
  C[0]:=1; C[1]:=0;
  for i:=1 to MaxN do
    Begin
      Sum(F[i],A,F[i]);
      Sum(F[i],B,F[i]);
      Sum(F[i],C,F[i]);
      C:=B;
      B:=A;
      A:=F[i];
    end;
  FillChar(BB,SizeOf(BB),0);
  BB[1][0]:=1;
  BB[1][1]:=2;
  for i:=2 to MaxN do
    Mult(BB[i-1],2,BB[i]);
  ReadLn(N);
  While N <> 0 do
    Begin
      Sub(BB[N],F[N],Res);
      PrintLong(Res);
      ReadLn(N);
    end;
end.