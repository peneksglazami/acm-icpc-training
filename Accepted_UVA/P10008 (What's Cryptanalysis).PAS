Program Problem10008 (input, output);
Type
  Letter = Record
     Ch: Char;
     Amount: Integer;
   end;

Var
  i,j,N: Integer;
  L: Array ['A'..'Z'] of Integer;
  St: String;
  Ch: Char;
  Letters: Array[1..26] of Letter;
  B: Letter;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(St);
      for j:=1 to Length(St) do
        Begin
          Ch:=UpCase(St[j]);
          if (Ch >= 'A') and (Ch <= 'Z') then
            Inc(L[Ch]);
        end;
    end;
  i:=1;
  for Ch:='A' to 'Z' do
    Begin
      Letters[i].Ch:=Ch;
      Letters[i].Amount:=L[Ch];
      Inc(i);
    end;
  for i:=1 to 25 do
    for j:=i+1 to 26 do
      Begin
        if (Letters[i].Amount < Letters[j].Amount) then
          Begin
            B:=Letters[i];
            Letters[i]:=Letters[j];
            Letters[j]:=B;
          end;
        if (Letters[i].Amount = Letters[j].Amount) and
           (Letters[i].Ch > Letters[j].Ch) then
          Begin
            B:=Letters[i];
            Letters[i]:=Letters[j];
            Letters[j]:=B;
          end;

      end;
  i:=1;
  While Letters[i].Amount <> 0 do
    Begin
      WriteLn(Letters[i].Ch,' ',Letters[i].Amount);
      Inc(i);
    end;
end.