{Problem: 10814 - Simplifying Fractions
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10814 (input,otuput);
Const
  Osn = 10000;
  MaxN = 10;

Type
  TLong = Array [0..MaxN] of LongInt;

Var
  A,B: TLong;
  St: String;
  Test: Integer;

Procedure StrToLong(St: String; Var A: TLong);
Var
  i,j: Integer;
Begin
  While not (St[1] in ['0'..'9']) do
    Delete(St,1,1);
  While not (St[Length(St)] in ['0'..'9']) do
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
  LongToStr:=St;
end;

Procedure Sub(Var A: TLong; B: TLong; sd: Integer);
Var
  i,j: Integer;
Begin
  for i:=1 to B[0] do
    Begin
      Dec(A[i+sd],B[i]);
      j:=i;
      While (A[j+sd] < 0) and (j+sd <= A[0]) do
        Begin
          Inc(A[j+sd],Osn);
          Dec(A[j+sd+1]);
          Inc(j);
        end;
    end;
  i:=A[0];
  While (i > 1) and (A[i] = 0) do
    Dec(i);
  A[0]:=i;
end;

Procedure Mul(A: TLong; X: Integer; Var C: TLong);
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
          C[i+1]:=(C[i]+A[i]*X) div Osn;
          C[i]:=(C[i]+A[i]*X) mod Osn;
        end;
      if C[A[0]+1] > 0 then
        C[0]:=A[0]+1
      else
        C[0]:=A[0];
    end;
end;

Function More(A,B: TLong; sd: Integer): Byte;
Var
  i: Integer;
Begin
  if A[0] > B[0]+sd then
    More:=0
  else
    if A[0] < B[0]+sd then
      More:=1
    else
      Begin
        i:=A[0];
        While (i > sd) and (A[i] = B[i-sd]) do
          Dec(i);
        if i = sd then
          Begin
            More:=0;
            for i:=sd downto 1 do
              if A[i] > 0 then
                Exit;
            More:=2;
          end
        else
          More:=Byte(A[i] < B[i-sd]);
      end;
end;

Function FindBin(Var Ost: TLong; B: TLong; sd: Integer): LongInt;
Var
  Up,Down: Integer;
  C: TLong;
Begin
  Down:=0; Up:=Osn;
  While Up-1 > Down do
    Begin
      Mul(B,(Up+Down) div 2,C);
      Case More(Ost,C,sd) of
        0: Down:=(Up+Down) div 2;
        1: Up:=(Up+Down) div 2;
        2: Begin
             Up:=(Up+Down) div 2;
             Down:=Up;
           end;
       end;
    end;
  Mul(B,(Up+Down) div 2,C);
  if More(Ost,C,sd) <> 1 then
    Sub(Ost,C,sd);
  FindBin:=(Up+Down) div 2;
end;

Procedure MakeDiv(A,B: TLong; Var Res,Ost: TLong);
Var
  sd: Integer;
Begin
  Ost:=A;
  sd:=A[0]-B[0];
  if More(A,B,sd) = 1 then
    Dec(sd);
  Res[0]:=sd+1;
  While sd >= 0 do
    Begin
      Res[sd+1]:=FindBin(Ost,B,sd);
      Dec(sd);
    end;
end;

Procedure DivLong(A,B: TLong; Var Res,Ost: TLong);
Begin
  FillChar(Res,SizeOf(Res),0);
  FillChar(Ost,SizeOf(Ost),0);
  Case More(A,B,0) of
    0: MakeDiv(A,B,Res,Ost);
    1: Begin
         Res[0]:=1;
         Ost:=A;
       end;
    2: Begin
         Res[0]:=1;
         Res[1]:=1;
         Ost[0]:=1;
       end;
   end;
end;

Procedure GCD(A,B: TLong; Var C: TLong);
Var
  nd,Zero,rr: TLong;
Begin
  FillChar(Zero,SizeOf(Zero),0);
  Zero[0]:=1;
  nd:=B;
  While More(A,Zero,0) <> 2 do
    Begin
      nd:=A;
      DivLong(B,A,rr,A);
      B:=nd;
    end;
  C:=nd;
end;

Procedure Simple(Var A,B: TLong);
Var
  nod,ss: TLong;
Begin
  GCD(A,B,nod);
  DivLong(A,nod,A,ss);
  DivLong(B,nod,B,ss);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(St);
      StrToLong(Copy(St,1,Pos(' ',St)-1),A);
      Delete(St,1,Pos('/',St)+1);
      StrToLong(St,B);
      Simple(A,B);
      WriteLn(LongToStr(A),' / ',LongToStr(B));
      Dec(Test);
    end;
end.