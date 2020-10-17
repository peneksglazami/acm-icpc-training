{Problem: 10408 - Farey sequences
 Problem Setter: Piotr Rudnicki
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $01000000}
Program Problem10408 (input,output);
{$APPTYPE CONSOLE}

Type
  Fraction = Record
    A,B: Integer;
   end;

  Mas = Array [1..304192] of Fraction;

Procedure QuickSort(Var A: Mas; Lo,Hi: Integer);
  Function Less(X,Y: Fraction): Boolean;
  Begin
    Less:=X.A*Y.B < Y.A*X.B;
  end;

  Procedure Sort(l,r: Integer);
  Var
    i,j: Integer;
    X,Change: Fraction;
  Begin
    i:=l;
    j:=r;
    x:=A[(l+r) div 2];
    Repeat
      While Less(A[i],X) do Inc(i);
      While Less(X,A[j]) do Dec(j);
      if i <= j then
        Begin
          Change:=A[i];
          A[i]:=A[j];
          A[j]:=Change;
          Inc(i);
          Dec(j);
        end;
    Until i > j;
    if l < j then Sort(l,j);
    if i < r then Sort(i,r);
  end;
Begin
  Sort(Lo,Hi);
end;

Function GCD(a,b: Integer): Integer;
Var
  nd: Integer;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Var
  A: Mas;
  i,j,N,K,Amount: Integer;

Begin
  While not EOF do
    Begin
      Amount:=0;
      ReadLn(N,K);
      for i:=N downto 1 do
        for j:=1 to i do
          if GCD(i,j) = 1 then
            Begin
              Inc(Amount);
              With A[Amount] do
                Begin
                  A:=j;
                  B:=i;
                end;
            end;
      QuickSort(A,1,Amount);
      WriteLn(A[K].A,'/',A[K].B);
    end;
end.