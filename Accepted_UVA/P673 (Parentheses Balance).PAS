{Problem: 673 - Parentheses Balance
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem673 (input, output);
Var
  i,N: Integer;
  St: String;

Function Correct(St: String): Boolean;
Var
  i,BracketAmount: Integer;
Begin
  if St = '' then
    Begin
      Correct:=True;
      Exit;
    end;
  While (St <> '') do
    Begin
      if St[1] = '[' then
        Begin
          BracketAmount:=1;
          i:=2;
          While (BracketAmount > 0) and (i <= Length(St)) do
            Begin
              if St[i] = '[' then
                Inc(BracketAmount);
              if St[i] = ']' then
                Dec(BracketAmount);
              Inc(i);
            end;
          if BracketAmount = 0 then
            Begin
              if Correct(Copy(St,2,i-3)) then
                Delete(St,1,i-1)
              else
                Begin
                  Correct:=False;
                  Exit;
                end;
            end
          else
            Begin
              Correct:=False;
              Exit;
            end;
        end
      else
        Begin
          BracketAmount:=1;
          i:=2;
          While (BracketAmount > 0) and (i <= Length(St)) do
            Begin
              if St[i] = '(' then
                Inc(BracketAmount);
              if St[i] = ')' then
                Dec(BracketAmount);
              Inc(i);
            end;
          if BracketAmount = 0 then
            Begin
              if Correct(Copy(St,2,i-3)) then
                Delete(St,1,i-1)
              else
                Begin
                  Correct:=False;
                  Exit;
                end;
            end
          else
            Begin
              Correct:=False;
              Exit;
            end;
        end;
    end;
  Correct:=True;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(St);
      if St <> '' then
        Begin
          i:=1;
          While i <= Length(St) do
            Begin
              if not (St[i] in ['[',']','(',')']) then
                Delete(St,i,1)
              else
                Inc(i);
            end;
        end;
      if Correct(St) then
        WriteLn('Yes')
      else
        WriteLn('No');
      Dec(N);
    end;
end.