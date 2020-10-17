{Problem: 10696 - f91
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I+,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10696 (input, output);
Var
  A: LongInt;

Begin
  ReadLn(A);
  While A <> 0 do
    Begin
      if A <= 100 then
        WriteLn('f91(',A,') = 91')
      else
        WriteLn('f91(',A,') = ',A-10);
      ReadLn(A);
    end;
end.