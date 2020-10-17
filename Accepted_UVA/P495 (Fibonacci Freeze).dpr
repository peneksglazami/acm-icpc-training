{Problem: 495 - Fibonacci Freeze
 Solution: Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem495 (input, output);
{$APPTYPE CONSOLE}
Const
  Osn = 100000;

Type
  TLong = Array [0..210] of Integer;

Var
  A: Array [0..5000] of TLong;
  i,N: Integer;

Procedure Sum(A,B: TLong; Var C: TLong);
Var
  i,D: Integer;
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
  if C[N+1] = 0 then
    C[0]:=N
  else
    C[0]:=N+1;
end;

Procedure WriteTLong(A: TLong);
Var
  i: Integer;
  St: String;
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
  FillChar(A,SizeOf(A),0);
  A[0][0]:=1;
  A[1][0]:=1;
  A[1][1]:=1;
  for i:=2 to 5000 do
    Sum(A[i-1],A[i-2],A[i]);
  While not EOF do
    Begin
      ReadLn(N);
      Write('The Fibonacci number for ',N,' is ');
      WriteTLong(A[N]);
    end;
end.
