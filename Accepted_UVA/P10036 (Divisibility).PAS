{Problem: 10036 - Divisibility
 Problem C - SWERC 2000 Warm-Up
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10036 (input, output);
Var
  Table: Array [1..2,0..99] of Boolean;
  i,j,M,N,K,A: Integer;

Begin
  ReadLn(M);
  While M >= 1 do
    Begin
      FillChar(Table,SizeOf(Table),False);
      ReadLn(N,K);
      Table[1,0]:=True;
      for i:=1 to N do
        Begin
          for j:=0 to K-1 do
            Table[2,j]:=False;
          Read(A);
          for j:=0 to K-1 do
            if Table[1,j] then
              Begin
                Table[2,(Abs(A)+j) mod K]:=True;
                Table[2,Abs(j-Abs(A)) mod K]:=True;
              end;
          for j:=0 to K-1 do
            Table[1,j]:=Table[2,j];
        end;
      ReadLn;
      if Table[2,0] then
        WriteLn('Divisible')
      else
        WriteLn('Not divisible');
      Dec(M);
    end;
end.