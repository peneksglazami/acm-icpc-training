{Problem: 10106 - Product
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10106 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 10000;

Type
  TLong = Array [0..130] of LongInt;

Var
  A,B,C: TLong;
  St: String;

Procedure StringToLong(St: String; Var A: TLong);
Var
  i,j: Integer;
Begin
  FillChar(A,SizeOf(A),0);
  i:=1;
  St:=St+' ';
  While not (St[i] in ['0'..'9']) and (i <= Length(St)) do
    Inc(i);
  While (St[i] in ['0'..'9']) and (i <= Length(St)) do
    Begin
      for j:=A[0] downto 1 do
        Begin
          A[j+1]:=A[j+1]+(A[j]*10) div Osn;
          A[j]:=(A[j]*10) mod Osn;
        end;
      A[1]:=A[1]+Ord(St[i])-Ord('0');
      if A[A[0]+1] > 0 then
        Inc(A[0]);
      Inc(i);
    end;
end;

Procedure SumLong(A,B: TLong; Var C: TLong);
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

Procedure MultLongByInt(A: TLong; X: Integer; Var C: TLong);
Var
  i,N: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  if X = 0 then
    C[0]:=1
  else
    Begin
      N:=A[0];
      for i:=1 to N do
        Begin
          C[i+1]:=(A[i]*X+C[i]) div Osn;
          C[i]:=(A[i]*X+C[i]) mod Osn;
        end;
      if C[N+1] > 0 then
       C[0]:=N+1
      else
        C[0]:=N;
    end;
end;

Procedure MultLong(A,B: TLong; Var C: TLong);
Var
  D: TLong;
  i,j: Integer;
Begin
  FillChar(C,SizeOf(C),0);
  if ((A[0] = 1) and (A[1] = 0)) or
     ((B[0] = 1) and (B[1] = 0)) then
       C[0]:=1
  else
    Begin
      for i:=1 to B[0] do
        Begin
          MultLongByInt(A,B[i],D);
          for j:=1 to i-1 do
            MultLongByInt(D,Osn,D);
          SumLong(C,D,C);
        end;
    end;
end;

Function LongToStr(A: TLong): String;
Var
  i,N: Integer;
  St,S: String;

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
  Result:=St;
end;


Begin
  While not EOF do
    Begin
      ReadLn(St);
      StringToLong(St,A);
      ReadLn(St);
      StringToLong(St,B);
      MultLong(A,B,C);
      WriteLn(LongToStr(C));
    end;
end.