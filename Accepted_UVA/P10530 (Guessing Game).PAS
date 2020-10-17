Program Problem10530 (input, output);
Var
  Numbers: Set of 1..10;
  i,N: Byte;
  St: String;
  First: Boolean;

Begin
  ReadLn(N);
  First:=True;
  While (N <> 0) do
    Begin
      ReadLn(St);
      if First then
        Begin
          Numbers:=[1,2,3,4,5,6,7,8,9,10];
          First:=False;
        end;
      if St = 'too high' then
        for i:=N to 10 do
          ExClude(Numbers,i);
      if St = 'too low' then
        for i:=N downto 1 do
          ExClude(Numbers,i);
      if St = 'right on' then
        Begin
          if N in Numbers then
            WriteLn('Stan may be honest')
          else
            WriteLn('Stan is dishonest');
          First:=True;
        end;
      ReadLn(N);
    end;
end.