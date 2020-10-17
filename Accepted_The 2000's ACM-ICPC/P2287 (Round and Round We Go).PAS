{ACM ICPC 2001/2002 - North America - Greater New York
 Problem G - Round and Round We Go
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemG (input, output);
Const
  Osn = 10000;

Type
  TLong = Array [0..20] of LongInt;

Var
  Gen: Array [1..60] of String;
  A,B: TLong;
  St,S: String;
  i: Integer;
  Ok: Boolean;

Procedure StrToLong(St: String; Var A: TLong);
Var
  i,j: Integer;
Begin
  FillChar(A,SizeOf(A),0);
  for i:=1 to Length(St) do
    Begin
      for j:=A[0] downto 1 do
        Begin
          A[j+1]:=A[j+1]+(A[j]*10) div Osn;
          A[j]:=(A[j]*10) mod Osn;
        end;
      A[1]:=A[1]+Ord(St[i])-Ord('0');
      if A[A[0]+1] > 0 then
        Inc(A[0]);
    end;
end;

Procedure MultLong(A: TLong; X: LongInt; Var C: TLong);
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

Function LongToStr(A: TLong; L: Integer): String;
Var
  St,S,SOsn: String;
  i: Integer;
Begin
  Str(Osn,SOsn);
  Str(A[A[0]],St);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],S);
      While Length(S) < Length(SOsn) - 1 do
        S:='0'+S;
      St:=St+S;
    end;
  While Length(St) < L do
    St:='0'+St;
  LongToStr:=St;
end;

Procedure Generate(St: String);
Var
  n: Integer;
Begin
  for n:=1 to Length(St) do
    Gen[n]:=Copy(St,n,Length(St)-n+1)+Copy(St,1,n-1);
end;

Function StrInGen(St: String; L: Integer): Boolean;
Var
  i: Integer;
  Ok: Boolean;
Begin
  i:=1;
  Ok:=False;
  While (i <= L) and not Ok do
    Begin
      Ok:=(St = Gen[i]);
      Inc(i);
    end;
  StrInGen:=Ok;
end;

Begin
  While not EOF do
    Begin
      ReadLn(St);
      Generate(St);
      StrToLong(St,A);
      for i:=1 to Length(St) do
        Begin
          MultLong(A,i,B);
          Ok:=StrInGen(LongToStr(B,Length(St)),Length(St));
          if not Ok then
            Break;
        end;
      if Ok then
        WriteLn(St+' is cyclic')
      else
        WriteLn(St+' is not cyclic');
    end;
end.