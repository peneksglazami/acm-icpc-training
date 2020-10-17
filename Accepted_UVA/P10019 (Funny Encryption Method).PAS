Program Problem10019 (input, output);
Var
  i,j,N,M,A,B1,B2: Integer;
  St,Ch: String;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(M);
      A:=M;
      St:='';
      While (A <> 0) do
        Begin
          Str(A mod 2,Ch);
          St:=Ch+St;
          A:=A div 2;
        end;
      B1:=0;
      for j:=1 to Length(St) do
        if (St[j] = '1') then
          Inc(B1);
      A:=M;
      St:='';
      While (A <> 0) do
        Begin
          Case A mod 10 of
            0: St:='0000'+St;
            1: St:='0001'+St;
            2: St:='0010'+St;
            3: St:='0011'+St;
            4: St:='0100'+St;
            5: St:='0101'+St;
            6: St:='0110'+St;
            7: St:='0111'+St;
            8: St:='1000'+St;
            9: St:='1001'+St;
           end;
          A:=A div 10;
        end;
      B2:=0;
      for j:=1 to Length(St) do
        if (St[j] = '1') then
          Inc(B2);
      WriteLn(B1,' ',B2);
    end;
end.