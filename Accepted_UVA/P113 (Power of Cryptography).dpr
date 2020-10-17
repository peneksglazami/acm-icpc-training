{Problem: 113 - Power of Cryptography
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem113 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 10000;
  MaxN = 450;
  MaxK = 1000000000;

Type
  TLong = Array [0..MaxN] of Integer;

Var
  k,N,l,r,m: Integer;
  St: String;
  P,A: TLong;

Procedure StrToLong(St: String; Var A: TLong);
Var
  i,j: Integer;
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
  FillChar(A,SizeOf(A),0);
  for i:=1 to Length(St) do
    Begin
      for j:=A[0] downto 1 do
        Begin
          A[j+1]:=A[j+1]+(10*A[j]) div Osn;
          A[j]:=(10*A[j]) mod Osn;
        end;
      A[1]:=A[1]+Ord(St[i])-Ord('0');
      if A[A[0]+1] > 0 then
        Inc(A[0]);
    end;
end;

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
      C[i+1]:=(C[i]+A[i]+B[i]) div Osn;
      C[i]:=(C[i]+A[i]+B[i]) mod Osn;
    end;
  if C[N+1] > 0 then
    C[0]:=N+1
  else
    C[0]:=N;
end;

Procedure Mult(A: TLong; X: Integer; Var C: TLong);
Var
  i: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  for i:=1 to A[0] do
    Begin
      C[i+1]:=(C[i]+X*A[i]) div Osn;
      C[i]:=(C[i]+X*A[i]) mod Osn;
    end;
  if C[A[0]+1] > 0 then
    C[0]:=A[0]+1
  else
    C[0]:=A[0];
end;

Procedure MultLong(A,B: TLong; Var C: TLong);
Var
  i,j: Integer;
  D: TLong;
Begin
  FillChar(C,SizeOf(C),0);
  C[0]:=1;
  for i:=1 to A[0] do
    Begin
      Mult(B,A[i],D);
      for j:=D[0] downto 1 do
        D[j+i-1]:=D[j];
      for j:=i-1 downto 1 do
        D[j]:=0;
      D[0]:=D[0]+i-1;
      Sum(C,D,C);
    end;
end;

Procedure Degree(X: TLong; N: Integer; Var C: TLong);
Var
  B: TLong;
Begin
  if N = 0 then
    Begin
      FillChar(C,SizeOf(C),0);
      C[0]:=1;
      C[1]:=1;
    end
  else
    if Odd(N) then
      Begin
        Degree(X,N-1,B);
        MultLong(X,B,C);
      end
    else
      Begin
        Degree(X,N div 2,B);
        MultLong(B,B,C);
      end;
end;

Function More(A,B: TLong): Byte;
Var
  i: Integer;
Begin
  if A[0] > B[0] then
    More:=0
  else
    if A[0] < B[0] then
      More:=1
    else
      Begin
        i:=A[0];
        While (A[i] = B[i]) and (i > 0) do
          Dec(i);
        if i = 0 then
          More:=2
        else
          if A[i] > B[i] then
            More:=0
          else
            More:=1;
      end;
end;

Begin
  While not EOF do
    Begin
      ReadLn(N);
      ReadLn(St);
      StrToLong(St,P);
      l:=0;
      r:=MaxK;
      While r-l > 1 do
        Begin
          m:=(l+r) div 2;
          Str(m,St);
          StrToLong(St,A);
          Degree(A,n,A);
          Case More(A,P) of
            0: r:=m;
            1: l:=m;
            2: Begin
                 l:=m;
                 r:=m;
               end;
           end;
        end;
      m:=(l+r) div 2;
      Str(m,St);
      StrToLong(St,A);
      Degree(A,n,A);
      if More(A,P) = 1 then
        Inc(m);
      WriteLn(m);
    end;
end.