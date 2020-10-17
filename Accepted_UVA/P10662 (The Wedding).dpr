Program ProblemD (input, output); {The Wedding} 
{$APPTYPE CONSOLE}
Type
  Thing = Record
    Price: Integer;
    Yes: Array [1..20] of Byte;
   end;

Var
  Best: Array [1..3] of Integer;
  Tr,Re,Ho: Array[1..20] of Thing;
  i,j,g,Min,T,R,H: Integer;
  Ok: Boolean;

Begin
  While not EOF do
    Begin
      ReadLn(T,R,H);
      for i:=1 to T do
        With Tr[i] do
          Begin
            Read(Price);
            for j:=1 to R do
              Read(Yes[j]);
            ReadLn;
          end;
      for i:=1 to R do
        With Re[i] do
          Begin
            Read(Price);
            for j:=1 to H do
              Read(Yes[j]);
            ReadLn;
          end;
      for i:=1 to H do
        With Ho[i] do
          Begin
            Read(Price);
            for j:=1 to T do
              Read(Yes[j]);
            ReadLn;
          end;
      Ok:=False;
      Min:=High(Integer);
      for i:=1 to T do
        for j:=1 to R do
          if Tr[i].Yes[j] = 0 then
            for g:=1 to H do
              if (Re[j].Yes[g] = 0) and (Ho[g].Yes[i] = 0) then
                if Tr[i].Price+Re[j].Price+Ho[g].Price < Min then
                  Begin
                    Ok:=True;
                    Min:=Tr[i].Price+Re[j].Price+Ho[g].Price;
                    Best[1]:=i-1;
                    Best[2]:=j-1;
                    Best[3]:=g-1;
                  end;
      if Ok then
        WriteLn(Best[1],' ',Best[2],' ',Best[3],':',Min)
      else
        WriteLn('Don''t get married!');
    end;
end.
