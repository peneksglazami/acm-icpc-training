{ACM ICPC 2003-2004 South America
 Problem A - Dice
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Type
  Player = Record
    Ok: Boolean;
    Step: Integer;
   end;

Var
  Players: Array [1..10] of Player;
  i,j,P,S,D1,D2,T1,T2,T3,N,WinP,PN: Integer;
  Win: Boolean;

Begin
  ReadLn(P,S);
  While (P <> 0) or (S <> 0) do
    Begin
      ReadLn(T1,T2,T3);
      ReadLn(N);
      for i:=1 to P do
        With Players[i] do
          Begin
            Ok:=True;
            Step:=0;
          end;
      Win:=False;
      PN:=1;
      for i:=1 to N do
        Begin
          ReadLn(D1,D2);
          if not Win then
            Begin
              While not Players[PN].Ok do
                Begin
                  Players[PN].Ok:=True;
                  if PN < P then
                    Inc(PN)
                  else
                    PN:=1;
                end;
              Inc(Players[PN].Step,D1+D2);
              if (Players[PN].Step = T1) or (Players[PN].Step = T2)
                or(Players[PN].Step = T3) then
                  Players[PN].Ok:=False;
              if Players[PN].Step > S then
                Begin
                  Win:=True;
                  WinP:=PN;
                end;
              if PN < P then
                Inc(PN)
              else
                PN:=1;
            end;
        end;
      WriteLn(WinP);
      ReadLn(P,S);
    end;
end.