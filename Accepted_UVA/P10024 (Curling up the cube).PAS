{Problem: 10024 - Curling up the cube
 Author: Alex Gevak
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10024 (input, output);
Type
  TCube = Array [1..6] of Integer;

Var
  Table: Array [0..7,0..7] of Integer;
  NNew: Array [1..6] of Boolean;
  Cube: TCube;
  i,j,g,Test,s_x,s_y: Integer;
  Ok: Boolean;

Procedure Init;
Var
  i: Integer;
Begin
  FillChar(Table,SizeOf(Table),0);
  FillChar(NNew,SizeOf(NNew),True);
  for i:=1 to 6 do
    Cube[i]:=i;
end;

Procedure ChangeD(D: Integer); {1 - North, 2 - East, 3 - South, 4 - West}
Var
  Change: TCube;
Begin
  Change:=Cube;
  Case D of
    1: Begin
         Cube[1]:=Change[5];
         Cube[3]:=Change[6];
         Cube[5]:=Change[3];
         Cube[6]:=Change[1];
       end;
    2: Begin
         Cube[1]:=Change[4];
         Cube[2]:=Change[1];
         Cube[3]:=Change[2];
         Cube[4]:=Change[3];
       end;
    3: Begin
         Cube[1]:=Change[6];
         Cube[3]:=Change[5];
         Cube[5]:=Change[1];
         Cube[6]:=Change[3];
       end;
    4: Begin
         Cube[1]:=Change[2];
         Cube[2]:=Change[3];
         Cube[3]:=Change[4];
         Cube[4]:=Change[1];
       end;
     end;
end;

Procedure Solve(x,y: Integer);
Begin
  NNew[Cube[3]]:=False;
  if (Table[x,y-1] = 1) then
    Begin
      ChangeD(4);
      if NNew[Cube[3]] then
        Solve(x,y-1);
      ChangeD(2);
    end;
  if (Table[x+1,y] = 1) then
    Begin
      ChangeD(3);
      if NNew[Cube[3]] then
        Solve(x+1,y);
      ChangeD(1);
    end;
  if (Table[x,y+1] = 1) then
    Begin
      ChangeD(2);
      if NNew[Cube[3]] then
        Solve(x,y+1);
      ChangeD(4);
    end;
  if (Table[x-1,y] = 1) then
    Begin
      ChangeD(1);
      if NNew[Cube[3]] then
        Solve(x-1,y);
      ChangeD(3);
    end;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      Init;
      ReadLn;
      Ok:=False;
      for j:=1 to 6 do
        Begin
          for g:=1 to 6 do
            Begin
              Read(Table[j,g]);
              if not Ok and (Table[j,g] = 1) then
                Begin
                  s_x:=j;
                  s_y:=g;
                  Ok:=True;
                end;
            end;
          ReadLn;
        end;
      Solve(s_x,s_y);
      Ok:=True;
      for j:=1 to 6 do
        if NNew[j] then
          Begin
            Ok:=False;
            Break;
          end;
      if Ok then
        WriteLn('correct')
      else
        WriteLn('incorrect');
      WriteLn;
    end;
end.