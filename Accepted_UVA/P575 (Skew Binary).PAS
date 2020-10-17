Program Problem575 (input, output);
Var
  St: String;
  N: LongInt;
  Digit: Integer;
  i,j: Word;
  Two: Array [0..32] of LongInt;

Procedure MakeTwo;
Var
  i: Word;
  a: LongInt;
Begin
  Two[0]:=1;
  a:=2;
  for i:=1 to 32 do
    Begin
      Two[i]:=a;
      a:=a*2;
    end;
end;

Begin
  MakeTwo;
  ReadLn(St);
  While (St <> '0') do
    Begin
      i:=1;
      N:=0;
      While i <= Length(St) do
        Begin
          Val(St[i],Digit,j);
          if Digit <> 0 then
            N:=N+Digit*(Two[Length(St)-i+1]-1);
          Inc(i);
        end;
      WriteLn(N);
      ReadLn(St);
    end;
end.