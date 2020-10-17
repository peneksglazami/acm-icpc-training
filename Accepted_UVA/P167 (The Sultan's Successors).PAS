Program Problem167 (input, output);
Var
  Board: Array [1..8,1..8] of Integer;
  Up: Array [2..16] of Boolean;
  Down: Array [-7..7] of Boolean;
  Vr: Array [1..8] of Boolean; {Признак занятости вертикали; False - занято}
  X: Array [1..8] of Byte; {Номер вертикали, на которой стоит
                            ферзь на данной горизонтали}
  i,j,g,k,BestSum: Integer;

Procedure Hod(i,j: Integer);
Begin
  X[i]:=j; Vr[j]:=False; Up[i+j]:=False; Down[i-j]:=False;
end;

Procedure O_Hod(i,j: Integer);
Begin
  Vr[j]:=True; Up[i+j]:=True; Down[i-j]:=True;
end;

Function D_Hod(i,j: Integer): Boolean;
Begin
  D_Hod:=(Vr[j] and Up[i+j] and Down[i-j]);
end;

Procedure Solve(i: Integer);
Var
  j,Sum: Integer;
Begin
  if (i <= 8) then
    Begin
      for j:=1 to 8 do
        if D_Hod(i,j) then
          Begin
            Hod(i,j);
            Solve(i+1);
            O_Hod(i,j);
          end;
    end
  else
    Begin
      Sum:=0;
      for j:=1 to 8 do
        Inc(Sum,Board[j,X[j]]);
      if Sum > BestSum then
        BestSum:=Sum;
    end;
end;

Begin
  ReadLn(k);
  for i:=1 to k do
    Begin
      for j:=1 to 8 do
        Begin
          for g:=1 to 8 do
            Read(Board[j,g]);
          ReadLn;
          end;
      FillChar(Up,SizeOf(Up),True);
      FillChar(Down,SizeOf(Down),True);
      FillChar(Vr,SizeOf(Vr),True);
      BestSum:=0;
      Solve(1);
      WriteLn(BestSum:5);
    end;
end.