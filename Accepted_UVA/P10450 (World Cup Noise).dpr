Program Problem10450 (input, output);
{$APPTYPE CONSOLE}
Var
  i,Test,N: Integer;
  Table: Array [0..50] of Int64;

Begin
  Table[0]:=0;
  Table[1]:=2;
  Table[2]:=3;
  for i:=3 to 50 do
    Table[i]:=Table[i-1]+Table[i-2];
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn(N);
      WriteLn('Scenario #',i,':');
      WriteLn(Table[N]);
      WriteLn;
    end;
end.