{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem10420 (input, output); {List of Conquests}
{$APPTYPE CONSOLE}
Type
  Country = Record
    Name: String[75];
    Number: Word;
   end;

  Mas = Array [1..2000] of Country;

Var
  Countries: Mas;
  i,j,N,Amount: Word;
  St: String[75];
  Ok: Boolean;

Procedure QuickSort(Var A: Mas; Lo,Hi: Word);
  Procedure Sort(l,r: Word);
  Var
    i,j: Word;
    x: String[75];
    Change: Country;
  Begin
    i:=l;
    j:=r;
    x:=A[(l+r) div 2].Name;
    Repeat
      While (A[i].Name < X) do Inc(i);
      While (A[j].Name > X) do Dec(j);
      if (i <= j) then
        Begin
          Change:=A[i];
          A[i]:=A[j];
          A[j]:=Change;
          Inc(i);
          Dec(j);
        end;
    Until i > j;
    if (l < j) then Sort(l,j);
    if (i < r) then Sort(i,r);
  end;
Begin
  Sort(Lo,Hi);
end;

Begin
  FillChar(Countries,SizeOf(Countries),0);
  ReadLn(N);
  Amount:=0;
  for i:=1 to N do
    Begin
      ReadLn(St);
      St:=Copy(St,1,Pos(' ',St)-1);
      if (Amount = 0) then
        Begin
          Amount:=1;
          Countries[1].Name:=St;
          Countries[1].Number:=1;
        end
      else
        Begin
          Ok:=False;
          for j:=1 to Amount do
            if Countries[j].Name = St then
              Begin
                Inc(Countries[j].Number);
                Ok:=True;
              end;
          if not Ok then
            Begin
              Inc(Amount);
              Countries[Amount].Name:=St;
              Countries[Amount].Number:=1;
            end;
        end;
    end;
  QuickSort(Countries,1,Amount);
  for i:=1 to Amount do
    WriteLn(Countries[i].Name,' ',Countries[i].Number);
end.
