{Problem: 10066 - The Twin Towers
 Problem B - BUET/UVA Occidental Contest 1 
 Author: Rezaul Alam Chowdhury
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10066 (input, output);
Var
  Table: Array [1..100,1..100] of Byte;
  Tower1,Tower2: Array [1..100] of Integer;
  i,j,N1,N2,n_case: Integer;
  Ok: Boolean;

Function Max(a,b: Integer): Byte;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Begin
  n_case:=1;
  ReadLn(N1,N2);
  While (N1 <> 0) and (N2 <> 0) do
    Begin
      FillChar(Table,SizeOf(Table),0);
      for i:=1 to N1 do
        Read(Tower1[i]);
      ReadLn;
      for i:=1 to N2 do
        Read(Tower2[i]);
      ReadLn;
      i:=1;
      While (Tower1[i] <> Tower2[1]) and (i <= N1) do
        Inc(i);
      for j:=i to N1 do
        Table[j,1]:=1;
      i:=1;
      While (Tower1[1] <> Tower2[i]) and (i <= N2) do
        Inc(i);
      for j:=i to N2 do
        Table[1,j]:=1;
      for i:=2 to N1 do
        for j:=2 to N2 do
          if Tower1[i] = Tower2[j] then
            Table[i,j]:=Max(Table[i-1,j-1]+1,Max(Table[i,j-1],Table[i-1,j]))
          else
            Table[i,j]:=Max(Table[i,j-1],Table[i-1,j]);
      WriteLn('Twin Towers #',n_case);
      WriteLn('Number of Tiles : ',Table[N1,N2]);
      WriteLn;
      Inc(n_case);
      ReadLn(N1,N2);
    end;
end.