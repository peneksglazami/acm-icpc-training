Program Problem10370 (input, output);
Var
  Clas: Array [1..1000] of Real;
  N,Test,i,j,Above: LongInt;
  Sum,Average: Real;
Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      Read(N);
      Sum:=0.0;
      for j:=1 to N do
        Begin
          Read(Clas[j]);
          Sum:=Sum+Clas[j];
         end;
      Average:=Sum/N;
      Above:=0;
      for j:=1 to N do
        if Clas[j] > Average then
          Above:=Above+1;
      WriteLn((Above/N*100):0:3,'%');
    end;
end.