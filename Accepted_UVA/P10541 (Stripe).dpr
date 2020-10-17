{Problem: 10541 - Stripe
 Problem source: Kirov regional team contest 2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10541 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 10000;
  MaxN = 200;
  MaxK = (MaxN+1) div 2;

Type
  TLong = Array [0..20] of Integer;

Var
  Table: Array [1..MaxN,1..MaxK] of TLong;
  F: Array [1..MaxN,1..MaxK] of Boolean;
  a,b: Array [0..MaxK] of Integer;
  i,j,T,N,K: Integer;

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

Function LongToStr(A: TLong): String;
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

Function Rec(g,i: Integer): TLong;
Var
  j: Integer;
Begin
  if i = K+1 then
    Begin
      FillChar(Result,SizeOf(Result),0);
      Result[0]:=1;
      Result[1]:=1;
    end
  else
    if not F[g,i] then
      Begin
        F[g,i]:=True;
        FillChar(Table[g,i],SizeOf(Table[g,i]),0);
        Table[g,i][0]:=1;
        for j:=g to b[i]-a[i]+1 do
          Sum(Table[g,i],Rec(j+a[i]+1,i+1),Table[g,i]);
        Rec:=Table[g,i];
      end
    else
      Rec:=Table[g,i];
end;

Begin
  ReadLn(T);
  While T > 0 do
    Begin
      Read(N,K);
      for i:=1 to K do
       Read(a[i]);
      ReadLn;
      b[K]:=N;
      for i:=K-1 downto 1 do
        b[i]:=b[i+1]-a[i+1]-1;
      FillChar(F,SizeOf(F),False);
      WriteLn(LongToStr(Rec(1,1)));
      Dec(T);
    end;
end.