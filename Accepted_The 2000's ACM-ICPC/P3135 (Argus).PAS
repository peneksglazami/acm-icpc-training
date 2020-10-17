{ACM ICPC 2004/2005 Asia - Beijing
 Problem C - Argus
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program ProblemC (input,output);
Type
  TRecord = Record
    ID,Period: Integer;
   end;

  Mas = Array [1..1000] of TRecord;

Var
  A: Mas;
  N,Step,S: LongInt;
  i,j,K,Er: Integer;
  St: String;


Function GCD(a,b: LongInt): LongInt;
Var
  nd: LongInt;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end; {GCD}

Procedure QuickSort(Var A: Mas; Lo,Hi: Word);
  Procedure Sort(l,r: Word);
  Var
    i,j: Word;
    x: Integer;
    Change: TRecord;
  Begin
    i:=l;
    j:=r;
    x:=A[(l+r) div 2].ID;
    Repeat
      While A[i].ID < X do Inc(i);
      While A[j].ID > X do Dec(j);
      if i <= j then
        Begin
          Change:=A[i];
          A[i]:=A[j];
          A[j]:=Change;
          Inc(i);
          Dec(j);
        end;
    Until i > j;
    if j > l then Sort(l,j);
    if i < r then Sort(i,r);
  end; {Sort}

Begin
  Sort(Lo,Hi);
end; {QuickSort}

Begin
  N:=0;
  ReadLn(St);
  Step:=0;
  While St <> '#' do
    Begin
      Inc(N);
      Delete(St,1,9);
      i:=1;
      While St[i] in ['0'..'9'] do
        Inc(i);
      Val(Copy(St,1,i-1),A[N].ID,Er);
      Delete(St,1,i);
      Val(Copy(St,1,Length(St)),A[N].Period,Er);
      Step:=GCD(Step,A[N].Period);
      ReadLn(St);
    end;
  QuickSort(A,1,N);
  ReadLn(K);
  i:=0;
  j:=0;
  S:=Step;
  While i < K do
    if j < N then
      Begin
        Inc(j);
        if (S mod A[j].Period = 0) then
          Begin
            WriteLn(A[j].ID);
            Inc(i);
          end;
      end
    else
      Begin
        j:=0;
        Inc(S,Step);
      end;
end.