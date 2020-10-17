{Problem: 10550 - Combination Lock
 Author: G. V. Cormack
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10550 (input, output);
Var
  s,a,b,c,Angle: Integer;

Begin
  ReadLn(s,a,b,c);
  While (s <> 0) or (a <> 0) or (b <> 0) or (c <> 0) do
    Begin
      Angle:=1080;
      if a > s then
        Inc(Angle,360-9*(a-s))
      else
        Inc(Angle,9*(s-a));
      if a > b then
        Inc(Angle,360-9*(a-b))
      else
        Inc(Angle,9*(b-a));
      if b < c then
        Inc(Angle,360-9*(c-b))
      else
        Inc(Angle,9*(b-c));
      WriteLn(Angle);
      ReadLn(s,a,b,c);
    end;
end.