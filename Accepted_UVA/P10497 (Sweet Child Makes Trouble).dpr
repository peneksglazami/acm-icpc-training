{Problem: 10497 - Sweet Child Makes Trouble
 Problemsetter: Tanveer Ahsan (Idea from Shamsul Alam)
 Solved by Andrey Grigorov
 Method: S(1)=0; S(n)=n*S(n-1)+(-1)^(n-1)}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10497 (input,output);
{$APPTYPE CONSOLE}
Const
  Osn = 1000000;

Type
  TLong = Array [0..1000] of Integer;

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

Procedure Sub(A,B: TLong; Var C: TLong);
Var
  i,j: Integer;
Begin
  for i:=1 to A[0] do
    Begin
      Dec(A[i],B[i]);
      j:=i;
      While (A[j] < 0) and (j <= A[0]) do
        Begin
          Dec(A[j+1]);
          Inc(A[j],Osn);
          Inc(j);
        end;
    end;
  C:=A;
  While (C[C[0]] = 0) and (C[0] > 1) do
    Dec(C[0]);
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
  S: String;
Begin
  Str(Osn,S);
  N:=Length(S)-1;
  Str(A[A[0]],Result);
  for i:=A[0]-1 downto 1 do
    Begin
      Str(A[i],S);
      While Length(S) < N do
        S:='0'+S;
      Result:=Result+S;
    end;
end;

Var
  C: Array [1..800] of TLong;
  A: TLong;
  i,N: Integer;

Begin
  FillChar(C,SizeOf(C),0);
  FillChar(A,SizeOf(A),0);
  A[0]:=1;
  A[1]:=1;
  C[1][0]:=1;
  C[1][1]:=0;
  for i:=2 to 800 do
    Begin
      Mult(C[i-1],i,C[i]);
      if not Odd(i-1) then
        Sub(C[i],A,C[i])
      else
        Sum(C[i],A,C[i]);
    end;
  ReadLn(N);
  While (N <> -1) do
    Begin
      WriteLn(LongToStr(C[N]));
      ReadLn(N);
    end;
end.