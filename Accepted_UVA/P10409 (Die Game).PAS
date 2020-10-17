Program Problem10409 (input,output);
Var
  Cubic,Cubic2: Array [1..6] of Byte;
  i,N: Integer;
  Command: String;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      Cubic[1]:=1;
      Cubic[2]:=2;
      Cubic[3]:=5;
      Cubic[4]:=3;
      Cubic[5]:=4;
      Cubic[6]:=6;
      for i:=1 to N do
        Begin
          Cubic2:=Cubic;
          ReadLn(Command);
          if (Command = 'north') then
            Begin
              Cubic[1]:=Cubic2[3];
              Cubic[2]:=Cubic2[1];
              Cubic[3]:=Cubic2[6];
              Cubic[6]:=Cubic2[2];
            end;
          if (Command = 'south') then
            Begin
              Cubic[1]:=Cubic2[2];
              Cubic[2]:=Cubic2[6];
              Cubic[3]:=Cubic2[1];
              Cubic[6]:=Cubic2[3];
            end;
          if (Command = 'west') then
            Begin
              Cubic[1]:=Cubic2[5];
              Cubic[5]:=Cubic2[6];
              Cubic[6]:=Cubic2[4];
              Cubic[4]:=Cubic2[1];
            end;
          if (Command = 'east') then
            Begin
              Cubic[1]:=Cubic2[4];
              Cubic[4]:=Cubic2[6];
              Cubic[6]:=Cubic2[5];
              Cubic[5]:=Cubic2[1];
            end;
        end;
      WriteLn(Cubic[1]);
      ReadLn(N);
    end;
end.