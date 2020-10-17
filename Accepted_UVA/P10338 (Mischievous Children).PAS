{Problem: 10338 - Mischievous Children
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10338 (input, output);
Const
  Prime: Array [1..8] of Integer = (2,3,5,7,11,13,17,19);
  Osn = 1000;

Type
  ByPrime = Array [1..8] of Integer;
  TLong = Array [0..10] of Integer;

Var
  A: Array ['A'..'Z'] of Integer;
  F: Array [0..20] of ByPrime;
  St: String[20];
  i,j,N: Integer;
  R: ByPrime;
  RR: TLong;
  Ch: Char;

Procedure Fact;
Var
  i,j,N: Integer;
Begin
  FillChar(F,SizeOf(F),0);
  for i:=1 to 20 do
    Begin
      F[i]:=F[i-1];
      N:=i;
      j:=1;
      While N <> 1 do
        Begin
          While N mod Prime[j] = 0 do
            Begin
              N:=N div Prime[j];
              Inc(F[i][j]);
            end;
          Inc(j);
        end;
    end;
end;

Procedure Divide(A,B: ByPrime; Var C: ByPrime);
Var
  i: Integer;
Begin
  for i:=1 to 8 do
    C[i]:=A[i]-B[i];
end;

Procedure Mult(A: TLong; X: Integer; Var C: TLong);
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

Function LongToStr(A: TLong): String;
Var
  i,N: Integer;
  St,Res: String;
Begin
  Str(Osn,St);
  N:=Length(St)-1;
  Str(A[A[0]],Res);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],St);
      While Length(St) < N do
        St:='0'+St;
      Res:=Res+St;
    end;
  LongToStr:=Res;
end;

Begin
  Fact;
  ReadLn(N);
  for i:=1 to N do
    Begin
      FillChar(A,SizeOf(A),0);
      ReadLn(St);
      for j:=1 to Length(St) do
        Inc(A[St[j]]);
      R:=F[Length(St)];
      for Ch:='A' to 'Z' do
        Divide(R,F[A[Ch]],R);
      FillChar(RR,SizeOf(RR),0);
      RR[0]:=1;
      RR[1]:=1;
      for j:=1 to 8 do
        While R[j] > 0 do
          Begin
            Mult(RR,Prime[j],RR);
            Dec(R[j]);
          end;
      WriteLn('Data set ',i,': ',LongToStr(RR));
    end;
end.