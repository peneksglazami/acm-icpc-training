Program Problem10116 (input, output); {Robot Motion}
Var
  Map: Array [0..11,0..11] of Byte;
  Inst: Array [1..10,1..10] of Char;
  i,j,X,Y,Step,R,C,S_C: Integer;
  Loop: Boolean;

Begin
  ReadLn(R,C,S_C);
  While (R <> 0) and (C <> 0) and (S_C <> 0) do
    Begin
      FillChar(Map,SizeOf(Map),0);
      for i:=1 to R do
        Begin
          for j:=1 to C do
            Read(Inst[i,j]);
          ReadLn;
        end;
      Y:=1;
      X:=S_C;
      Loop:=False;
      Step:=1;
      Map[1,X]:=Step;
      While (not Loop) and (X > 0) and (X <= C) and (Y > 0) and (Y <= R) do
        Begin
          Case Inst[Y,X] of
            'N': Dec(Y);
            'W': Dec(X);
            'S': Inc(Y);
            'E': Inc(X);
           end;
          Inc(Step);
          if (Map[Y,X] = 0) then
            Map[Y,X]:=Step
          else
            Loop:=True;
        end;
      if Loop then
        WriteLn(Map[Y,X]-1,' step(s) before a loop of ',Step-Map[Y,X],' step(s)')
      else
        WriteLn(Step-1,' step(s) to exit');
      ReadLn(R,C,S_C);
    end;
end.