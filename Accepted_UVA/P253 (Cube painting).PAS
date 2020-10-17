{Problem: 253 - Cube painting
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem253 (input,output);
Type
  Cube = Array [1..6] of Char;

Var
  a,b: Cube;
  i,j,g: Integer;
  Ok: Boolean;

Procedure Rotate1(Var a: Cube);
Var
  b: Cube;
Begin
  b:=a;
  a[1]:=b[5];
  a[2]:=b[1];
  a[3]:=b[3];
  a[4]:=b[4];
  a[5]:=b[6];
  a[6]:=b[2];
end;

Procedure Rotate2(Var a: Cube);
Var
  b: Cube;
Begin
  b:=a;
  a[1]:=b[4];
  a[2]:=b[2];
  a[3]:=b[1];
  a[4]:=b[6];
  a[5]:=b[5];
  a[6]:=b[3];
end;

Procedure Rotate3(Var a: Cube);
Var
  b: Cube;
Begin
  b:=a;
  a[1]:=b[1];
  a[2]:=b[4];
  a[3]:=b[2];
  a[4]:=b[5];
  a[5]:=b[3];
  a[6]:=b[6];
end;

Function Equal(a,b: Cube): Boolean;
Var
  i: Integer;
  Ok: Boolean;
Begin
  Ok:=True;
  for i:=1 to 6 do
    Ok:=Ok and (a[i] = b[i]);
  Equal:=Ok;
end;

Begin
  While not EOF do
    Begin
      for i:=1 to 6 do
        Read(a[i]);
      for i:=1 to 6 do
        Read(b[i]);
      ReadLn;
      Ok:=False;
      for i:=1 to 4 do
        Begin
          Rotate1(b);
          for j:=1 to 4 do
            Begin
              Rotate2(b);
              for g:=1 to 4 do
                Begin
                  Rotate3(b);
                  Ok:=Ok or Equal(a,b);
                end;
            end;
        end;
      if Ok then
        WriteLn('TRUE')
      else
        WriteLn('FALSE');
    end;
end.