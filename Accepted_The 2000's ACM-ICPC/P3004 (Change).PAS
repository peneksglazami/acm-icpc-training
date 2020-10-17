{ACM ICPC 2004 - South Pacific Region
 Problem B - Change
 Solution - Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemB;
Const
  Money: Array [1..9] of LongInt = (2000,1000,500,200,100,50,20,10,5);
Var
  i,X,Y: LongInt;
  A,B: Real;
  Ok: Boolean;

Procedure RoundM(Var A: LongInt);
Begin
  Case (A mod 10) of
    1..2: A:=(A div 10)*10;
    3..4,6..7: A:=(A div 10)*10+5;
    8..9: A:=(A div 10)*10+10;
   end;
end;

Begin
  ReadLn(A,B);
  While (A <> 0.0) or (B <> 0.0) do
    Begin
      X:=Round(A*100);
      Y:=Round(B*100);
      RoundM(X);
      if X > Y then
        WriteLn('Not enough money offered.')
      else
        if X = Y then
          WriteLn('Exact amount.')
        else
          Begin
            Ok:=False;
            X:=Y-X;
            for i:=1 to 9 do
              if X div Money[i] <> 0 then
                Begin
                  if Ok then
                    Write(' ')
                  else
                    Ok:=True;
                  Case i of
                    1..5: Write('$',Money[i] div 100,'*',X div Money[i]);
                    6..9: Write(Money[i],'c*',X div Money[i]);
                   end;
                  X:=X mod Money[i];
                end;
            WriteLn;
          end;
      ReadLn(A,B);
    end;
end.