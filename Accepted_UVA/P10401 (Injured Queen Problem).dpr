{$A+,B-,D-,E+,F+,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T+,V+,X+,Y+}
Program Problem10401 (input, output); {Injured Queen Problem}
{$APPTYPE CONSOLE}
Var
  Board: Array [0..16,0..16] of Boolean; {True - ход разрешён, false - ход невозможен}
  Table: Array [1..15,1..15] of Int64; {Таблица, хранящая промежуточные результаты}
  Alphabet: Set of Char;
  St: String;
  i,j,g,N: Integer;
  Amount: Int64;
  Ok: Boolean;

Function ChToRow(Ch: Char): Integer;
Begin
  Case Ch of
    '1': ChToRow:=1;
    '2': ChToRow:=2;
    '3': ChToRow:=3;
    '4': ChToRow:=4;
    '5': ChToRow:=5;
    '6': ChToRow:=6;
    '7': ChToRow:=7;
    '8': ChToRow:=8;
    '9': ChToRow:=9;
    'A': ChToRow:=10;
    'B': ChToRow:=11;
    'C': ChToRow:=12;
    'D': ChToRow:=13;
    'E': ChToRow:=14;
    'F': ChToRow:=15;
   end;
end;

Procedure FillBoard(Row,Column: Integer);
Var
  i: Integer;
Begin
  for i:=1 to N do
    Board[i,Column]:=False;
  Board[Row-1,Column-1]:=False;
  Board[Row,Column-1]:=False;
  Board[Row+1,Column-1]:=False;
  Board[Row-1,Column+1]:=False;
  Board[Row,Column+1]:=False;
  Board[Row+1,Column+1]:=False;
  Board[Row,Column]:=True;
end;

Begin
  Alphabet:=['0'..'9']+['A'..'F']+['?'];
  Ok:=False;
  While not EOF do
    Begin
      if Ok then
        WriteLn
      else
        Ok:=True;
      FillChar(Board,SizeOf(Board),True);
      FillChar(Table,SizeOf(Table),0);
      ReadLn(St);
      N:=1;
      While (N <= Length(St)) and (UpCase(St[N]) in Alphabet) do
        Inc(N);
      Dec(N);
      for i:=1 to N do
        if (St[i] <> '?') then
          FillBoard(ChToRow(UpCase(St[i])),i);
      for i:=1 to N do
        if Board[i,1] then
          Table[i,1]:=1;
      for i:=1 to N-1 do
        for j:=1 to N do
          if Board[j,i] then
            for g:=1 to N do
              if Board[g,i+1] and (Abs(j-g) > 1) then
                Inc(Table[g,i+1],Table[j,i]);
      Amount:=0;
      for i:=1 to N do
        Inc(Amount,Table[i,N]);
      Write(Amount);
    end;
end.
