Program Problem10041 (input, output);
Var
  Street: Array [1..30000] of Word;
  i,j,k,RightSum,LeftSum,MinSum,Test,R,S: LongInt;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      FillChar(Street,SizeOf(Street),0);
      Read(R);
      for j:=1 to R do
        Begin
          Read(S);
          Inc(Street[S]);
        end;
      RightSum:=0;
      k:=0;
      for j:=1 to 30000 do
        if (Street[j] <> 0) then
          Inc(RightSum,(j-1)*Street[j]);
      LeftSum:=0;
      MinSum:=RightSum;
      j:=1;
      k:=0;
      While (k <> R) do
        Begin
          if (LeftSum + RightSum < MinSum) then
            MinSum:=LeftSum+RightSum;
          if (Street[j] <> 0) then
            Inc(k,Street[j]);
          Inc(j);
          Inc(LeftSum,k);
          Dec(RightSum,R-k);
        end;
      WriteLn(MinSum);
    end;
end.