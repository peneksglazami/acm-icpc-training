Program Problem10310 (input, output);
Type
  Hole = Record
    X,Y: Real;
   end;

Var
  Holes: Array [1..1000] of Hole;
  i,N: Integer;
  gX,gY,dX,dY: Real;
  Ok: Boolean;

Begin
  While not EOF do
    Begin
      ReadLn(N,gX,gY,dX,dY);
      for i:=1 to N do
        ReadLn(Holes[i].X,Holes[i].Y);
      Ok:=False;
      for i:=1 to N do
        With Holes[i] do
          if 4*(Sqr(X-gX)+Sqr(Y-gY)) <= (Sqr(X-dX)+Sqr(Y-dY)) then
            Begin
              Ok:=True;
              WriteLn('The gopher can escape through the hole at (',X:0:3,',',Y:0:3,').');
              Break;
            end;
      if not Ok then
        WriteLn('The gopher cannot escape.');
      ReadLn;
    end;
end.