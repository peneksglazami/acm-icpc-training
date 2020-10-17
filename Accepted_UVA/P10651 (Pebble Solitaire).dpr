Program Problem10651 (input, output);
{$APPTYPE CONSOLE}
Type
  TMas = Array [1..12] of Boolean;

Var
  Table: TMas;
  i,j,All,Max,Test: Integer;
  St: String;

Procedure Rec(Amount: Integer; Mas: TMas);
Var
  M1,M2: TMas;
  i: Integer;
Begin
  M1:=Mas;
  M2:=Mas;
  if Amount > Max then
    Max:=Amount;
  for i:=1 to 10 do
    Begin
      if (not M1[i]) and M1[i+1] and M1[i+2] then
        Begin
          M1[i]:=True;
          M1[i+1]:=False;
          M1[i+2]:=False;
          Rec(Amount+1,M1);
        end;
      if M2[i] and M2[i+1] and (not M2[i+2]) then
        Begin
          M2[i]:=False;
          M2[i+1]:=False;
          M2[i+2]:=True;
          Rec(Amount+1,M2);
        end;
    end;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(St);
      All:=0;
      for j:=1 to 12 do
        Begin
          Table[j]:=(St[j]='o');
          if Table[j] then
            Inc(All);
        end;
      Max:=0;
      Rec(0,Table);
      WriteLn(All-Max);
    end;
end.
