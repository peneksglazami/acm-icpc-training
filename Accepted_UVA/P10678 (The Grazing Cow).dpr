{$D-,I-,N+,Q-,R-,S-}
Program Problem10678 (input, output); {The Grazing Cow}
{$APPTYPE CONSOLE}
Var
  i,N: Byte;
  D,L: Word;
  pi_1,a,b,S: Double;

Begin
  pi_1:=4*ArcTan(1);
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(D,L);
      S:=pi_1*L*Sqrt(Sqr(L)-Sqr(D))/4;
      WriteLn(S:0:3);
    end;
end.
