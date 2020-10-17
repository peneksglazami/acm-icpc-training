Program Problem10473 (input, output);
Var
  N: LongInt;
  St: String;
  Er: Integer;
  Ch: Char;

Begin
  ReadLn(St);
  While (St <> '-1') do
    Begin
      if (St[2] = 'x') then
        Begin
          Delete(St,1,2);
          St:='$'+St;
          Val(St,N,Er);
          WriteLn(N);
        end
      else
        Begin
          Val(St,N,Er);
          if (N < 0) then
            Break;
          if (N <> 0) then
            Begin
              St:='';
              While (N <> 0) do
                Begin
                  Case N mod 16 of
                    0: Ch:='0';
                    1: Ch:='1';
                    2: Ch:='2';
                    3: Ch:='3';
                    4: Ch:='4';
                    5: Ch:='5';
                    6: Ch:='6';
                    7: Ch:='7';
                    8: Ch:='8';
                    9: Ch:='9';
                    10: Ch:='A';
                    11: Ch:='B';
                    12: Ch:='C';
                    13: Ch:='D';
                    14: Ch:='E';
                    15: Ch:='F';
                   end;
                  N:=N div 16;
                  St:=Ch+St;
                end;
              WriteLn('0x'+St);
            end
          else
            WriteLn('0x0');
        end;
      ReadLn(St);
    end;
end.