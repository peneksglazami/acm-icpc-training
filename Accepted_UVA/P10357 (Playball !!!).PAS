Program Problem10357 (input, output);
Const
  Approx = 10e-7;
Type
  Player = Record
    X,Y,V: Integer;
   end;

Var
  Players: Array [1..20] of Player;
  i,j,A,B,C,D,E,F,G,Time,All_P,Balls,X,Y: LongInt;
  Er: Integer;
  t: Real;
  Ok: Boolean;
  St: String;

Begin
  ReadLn(St);
  Delete(St,1,8);
  Val(St,All_P,Er);
  for i:=1 to All_P do
    With Players[i] do
      ReadLn(X,Y,V);
  ReadLn(St);
  Delete(St,1,6);
  Val(St,Balls,Er);
  for i:=1 to Balls do
    Begin
      ReadLn(A,B,C,D,E,F,G);
      t:=(-b-Sqrt(Sqr(b)-4*a*c))/(2*a);
      if Frac(t) > Approx then
        Time:=Trunc(t)+1
      else
        Time:=Trunc(t);
      X:=D*Time+E;
      Y:=F*Time+G;
      if (X < 0) or (Y < 0) then  {Although the description states that a ball
        is safe if both X and Y are positive, a ball can be safe if X or Y is
        non-negative.}
        WriteLn('Ball ',i,' was foul at (',X,',',Y,')')
      else
        Begin
          Ok:=False;
          for j:=1 to All_P do
            Begin
              if (Sqrt(Sqr(X-Players[j].X)+Sqr(Y-Players[j].Y)) <= Players[j].V*Time) then
                Begin
                  Ok:=True;
                  Break;
                end;
            end;
          if Ok then
            WriteLn('Ball ',i,' was caught at (',X,',',Y,')')
          else
            WriteLn('Ball ',i,' was safe at (',X,',',Y,')');
        end;
    end;
end.