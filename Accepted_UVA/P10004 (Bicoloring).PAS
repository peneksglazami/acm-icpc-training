Program Problem10004 (input, output);
Type
  Nod = Record
    Connection: Array [0..200] of Boolean;
    Color: Byte;
   end;

Var
  Nods: Array [0..200] of Nod;
  i,j,L,N,A,B: Integer;
  Ok: Boolean;

Begin
  ReadLn(N);
  While (N <> 0) do
    Begin
      ReadLn(L);
      FillChar(Nods,SizeOf(Nods),0);
      for i:=1 to L do
        Begin
          ReadLn(A,B);
          With Nods[A] do
            Connection[B]:=True;
          With Nods[B] do
            Connection[A]:=True;
        end;
      Nods[0].Color:=1;
      Ok:=True;
      for i:=0 to N-1 do
        Begin
          for j:=0 to N-1 do
            Begin
              if (i <> j) then
                Begin
                  if (Nods[i].Connection[j]) then
                    if (Nods[j].Color <> 0) then
                      Begin
                        if (Nods[i].Color = Nods[j].Color) then
                          Begin
                            Ok:=False;
                            Break;
                          end;
                      end
                    else
                      Begin
                        if (Nods[i].Color = 1) then
                          Nods[j].Color:=2
                        else
                          Nods[j].Color:=1;
                      end;
                end;
            end;
          if not Ok then
            Break;
        end;
      if Ok then
        WriteLn('BICOLORABLE.')
      else
        WriteLn('NOT BICOLORABLE.');
      ReadLn(N);
    end;
end.