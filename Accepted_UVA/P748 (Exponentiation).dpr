{Problem: 748 - Exponentiation
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem748 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 1000;

Type
  TLong = Array [0..200] of Integer;

Var
  A,B: TLong;
  St,S: String;
  i,N,NN,Er: Integer;

Procedure StringToLong(St: String; Var A: TLong);
Var
  i,j: Integer;
Begin
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
      C[i+1]:=(A[i]+B[i]+C[i]) div Osn;
      C[i]:=(A[i]+B[i]+C[i]) mod Osn;
    end;
  if C[N+1] > 0 then
    C[0]:=N+1
  else
    C[0]:=N;
end;

Procedure Mult(A: TLong; X: LongInt; Var C: TLong);
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

Procedure MultLong(A,B: TLong; Var C: TLong);
Var
  i,j: Integer;
  D: TLong;
Begin
  FillChar(C,SizeOf(C),0);
  C[0]:=1;
  if ((A[0] = 1) and (A[1] = 0)) or
     ((B[0] = 1) and (B[1] = 0)) then
       Exit;
  for i:=1 to B[0] do
    Begin
      Mult(A,B[i],D);
      for j:=D[0] downto 1 do
        D[j+i-1]:=D[j];
      for j:=i-1 downto 1 do
        D[j]:=0;
      D[0]:=D[0]+i-1;
      Sum(C,D,C);
    end;
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

Begin
  While not EOF do
    Begin
      ReadLn(St);
      S:=Copy(St,1,6);
      NN:=Length(S)-Pos('.',S);
      Delete(S,Pos('.',S),1);
      StringToLong(S,A);
      Delete(St,1,Pos(' ',St));
      While St[1] = ' ' do
        Delete(St,1,1);
      Val(St,N,Er);
      B:=A;
      NN:=NN*N;
      for i:=1 to N-1 do
        MultLong(A,B,A);
      St:=LongToStr(A);
      While Length(St) < NN do
        St:='0'+St;
      Insert('.',St,Length(St)-NN+1);
      While St[Length(St)] = '0' do
        Delete(St,Length(St),1);
      WriteLn(St);
    end;
end.