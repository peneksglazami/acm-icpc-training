Program Problem10424 (input, output);
Var
  Admit: Set of Char;
  Name1,Name2: Array ['A'..'Z'] of Word;
  i,A,Love1,Love2: Integer;
  St: String;
  Ch: Char;

Begin
  Admit:=['A'..'Z']+['a'..'z'];
  While not EOF do
    Begin
      FillChar(Name1,SizeOf(Name1),0);
      FillChar(Name2,SizeOf(Name2),0);
      Love1:=0;
      Love2:=0;
      ReadLn(St);
      for i:=1 to Length(St) do
        if St[i] in Admit then
          Inc(Name1[UpCase(St[i])]);
      ReadLn(St);
      for i:=1 to Length(St) do
        if St[i] in Admit then
          Inc(Name2[UpCase(St[i])]);
      for Ch:='A' to 'Z' do
        Inc(Love1,(Ord(Ch)-Ord('A')+1)*Name1[Ch]);
      While (Love1 >=10) do
        Begin
          A:=Love1;
          Love1:=0;
          While (A <> 0) do
            Begin
              Inc(Love1,A mod 10);
              A:=A div 10;
            end;
        end;
      for Ch:='A' to 'Z' do
        Inc(Love2,(Ord(Ch)-Ord('A')+1)*Name2[Ch]);
      While (Love2 >=10) do
        Begin
          A:=Love2;
          Love2:=0;
          While (A <> 0) do
            Begin
              Inc(Love2,A mod 10);
              A:=A div 10;
            end;
        end;
      if (Love1*Love2 = 0) then
        WriteLn('0.00%')
      else
        if (Love1 < Love2) then
          WriteLn(Love1/Love2*100:0:2,'%')
        else
          WriteLn(Love2/Love1*100:0:2,'%');
    end;
end.