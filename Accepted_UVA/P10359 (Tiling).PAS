{Problem: 10359 - Tiling
 Problem source: University of Alberta Local Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10359 (input,output);
Const
  MaxN = 250;
  MaxL = 30;
  Osn = 1000;

Type
  TLong = Array [0..MaxL] of Integer;

Var
  a: Array [0..MaxN] of TLong;
  i: Integer;

Procedure Sum(A,B: TLong; Var C: TLong);
Var
  i,N: Integer;
Begin
  FillChar(C,SizeOf(C),0);
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

Procedure Print(A: TLong);
Var
  St,S: String;
  i,N: Integer;
Begin
  Str(Osn,St);
  N:=Length(St)-1;
  Str(A[A[0]],St);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],S);
      While Length(S) < N do
        S:='0'+S;
      St:=St+S;
    end;
  WriteLn(St);
end;

Begin
  FillChar(a,SizeOf(a),0);
  a[0][0]:=1;
  a[0][1]:=1;
  a[1][0]:=1;
  a[1][1]:=1;
  for i:=2 to MaxN do
    Begin
      Sum(a[i-1],a[i-2],a[i]);
      Sum(a[i-2],a[i],a[i]);
    end;
  While not EOF do
    Begin
      ReadLn(i);
      Print(a[i]);
    end;
end.