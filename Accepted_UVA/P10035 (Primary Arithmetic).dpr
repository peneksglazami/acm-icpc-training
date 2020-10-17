{$D-,I-,L-,Q-,R-,S-}
Program Problem10035 (input, output); {Primary Arithmetic}
{$APPTYPE CONSOLE}
Var
  M1,M2: Array [1..11] of Byte;
  A,B: Int64;
  i,Carry,D: Byte;

Begin
  ReadLn(A,B);
  While not ((A = 0) and (B = 0)) do
    Begin
      FillChar(M1,SizeOf(M1),0);
      FillChar(M2,SizeOf(M2),0);
      i:=1;
      While (A <> 0) do
        Begin
          M1[i]:=A mod 10;
          A:=A div 10;
          Inc(i);
        end;
      i:=1;
      While (B <> 0) do
        Begin
          M2[i]:=B mod 10;
          B:=B div 10;
          Inc(i);
        end;
      D:=0;
      Carry:=0;
      for i:=1 to 11 do
        Begin
          if M1[i]+M2[i]+D >= 10 then
            Begin
              D:=1;
              Inc(Carry);
            end
          else
            D:=0;
        end;
      Case Carry of
        0: WriteLn('No carry operation.');
        1: WriteLn(Carry,' carry operation.')
       else
         WriteLn(Carry,' carry operations.');
       end;
      ReadLn(A,B);
    end;
end.
