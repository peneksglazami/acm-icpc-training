Program Problem10221 (input, input);
Const
  R = 6440;
  Approx = 10e-10;

Var
  S,A: LongInt;
  AngleCos,Deg,Arc_D,Chord_D: Real;
  St: String;

Begin
  While not EOF do
    Begin
      ReadLn(S,A,St);
      St:=Copy(St,1,4);
      if (St = ' deg') then
        Begin
          A:=A mod 360;
          if A > 180 then
            A:=360-A;
          Arc_D:=2*pi*(R+S)*A/360;
          AngleCos:=Cos(A/180*pi);
          if (1 - AngleCos) < Approx then
            AngleCos:=1;
          Chord_D:=Sqrt(2*Sqr(R+S)*(1-AngleCos));
        end
      else
        Begin
          Deg:=A/60;
          if Deg > 360 then
            Deg:=Deg/360-Trunc(Deg/360);
          if Deg > 180 then
            Deg:=360-Deg;
          Arc_D:=2*pi*(R+S)*Deg/360;
          AngleCos:=Cos(Deg/180*pi);
          if (1 - AngleCos) < Approx then
            AngleCos:=1;
          Chord_D:=Sqrt(2*Sqr(R+S)*(1-AngleCos));
        end;
      WriteLn(Arc_D:0:6,' ',Chord_D:0:6);
    end;
end.