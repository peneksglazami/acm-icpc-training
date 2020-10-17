{Problem: 10300 - Ecological Premium
 Problem A - GWCF Contest 2 - Joint Effort Contest
 Problem setter: Frank Hutter
 Solved by Andrey Grigorov}

Program Problem10300 (input, output);
Var
  i,j,N,F,S,K,A,Sum: LongInt;
Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(F);
      Sum:=0;
      for j:=1 to F do
        Begin
          ReadLn(S,K,A);
          if S*K*A <> 0 then
            Sum:=Sum+S*A;
        end;
      WriteLn(Sum);
    end;
end.