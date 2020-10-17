Program ProblemB (input, output); {Citizen attention offices}
{$APPTYPE CONSOLE}
Type
  Office = Record
    X,Y: Integer;
   end;
Var
  Best,Table: Array [1..5] of Office;
  Map: Array [0..4,0..4] of Integer;
  i,j,g,Test,N,X,Y,P,Min: Integer;

Procedure Rec(A,N: Integer);
Var
  i,j,g,k,Sum,min_d: Integer;
Begin
  if (N = 6) then
    Begin
      Sum:=0;
      for i:=0 to 4 do
        for j:=0 to 4 do
          Begin
            min_d:=High(Integer);
            for g:=1 to 5 do
              if min_d > (Abs(i-Table[g].X)+Abs(j-Table[g].Y)) then
                min_d:=Abs(i-Table[g].X)+Abs(j-Table[g].Y);
            Inc(Sum,Map[i,j]*min_d);
          end;
      if Sum < Min then
        Begin
          Min:=Sum;
          Best:=Table;
        end;
    end
  else
    for i:=A to 24-(5-N) do
      Begin
        Table[N].X:=i div 5;
        Table[N].Y:=i mod 5;
        Rec(i+1,N+1);
      end;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      FillChar(Table,SizeOf(Table),False);
      FillChar(Map,SizeOf(Map),0);
      Min:=High(Integer);
      ReadLn(N);
      for j:=1 to N do
        Begin
          ReadLn(X,Y,P);
          Map[X,Y]:=P;
        end;
      Rec(0,1);
      for j:=1 to 4 do
        Write(Best[j].X*5+Best[j].Y,' ');
      WriteLn(Best[5].X*5+Best[5].Y);
    end;
end.
