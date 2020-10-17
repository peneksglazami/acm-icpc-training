{Problem: 10334 - Ray Through Glasses
 Author: Mohammad Sajjad Hossain
 Solution: Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem10334 (input, output);
{$APPTYPE CONSOLE}
Const
  Osn = 1000;

Type
  TLong = Array [0..100] of Integer;

Var
  X: Array [0..1000] of TLong;
  g,N: Integer;

Procedure Sum(A,B: TLong; Var C: Tlong);
Var
  i,D,N: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  if A[0] > B[0] then
    N:=A[0]
  else
    N:=B[0];
  D:=0;
  for i:=1 to N+1 do
    Begin
      C[i]:=(A[i]+B[i]+D) mod Osn;
      D:=(A[i]+B[i]+D) div Osn;
    end;
  if C[N+1] <> 0 then
    C[0]:=N+1
  else
    C[0]:=N;
end;

Procedure WriteLong(A: TLong);
Var
  i: Integer;
  St: String;
Begin
  Write(A[A[0]]);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While Length(St) < 3 do
        St:='0'+St;
      Write(St);
    end;
  WriteLn;
end;

Begin
  FillChar(X,SizeOf(X),0);
  X[0][0]:=1;
  X[0][1]:=1;
  X[1][0]:=1;
  X[1][1]:=2;
  for g:=2 to 1000 do
    Sum(X[g-2],X[g-1],X[g]);
  While not EOF do
    Begin
      ReadLn(N);
      WriteLong(X[N]);
    end;
end.
