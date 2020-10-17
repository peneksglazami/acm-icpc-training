{Problem: 10285 - Longest Run on a Snowboard
 Problem C - GWCF Contest 1 - Math Lovers' Contest
 Author: Stefan Pochmann
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10285 (input, output);
Type
  Dot = Record
    X,Y: Byte;
   end;

Var
  Map: Array [0..101,0..101] of Byte;
  Table: Array [1..100,1..100] of Word;
  Stack,Old: Array [1..8000] of Dot;
  Name: String;
  i,j,g,k,N,R,C,T,V,L,Max: Integer;
  Ch: Char;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      FillChar(Map,SizeOf(Map),101);
      FillChar(Table,SizeOf(Table),0);
      Ch:=#0;
      Name:='';
      While Ch <> ' ' do
        Begin
          Read(Ch);
          if Ch <> ' ' then
            Name:=Name+Ch;
        end;
      ReadLn(R,C);
      for j:=1 to R do
        Begin
          for g:=1 to C do
            Read(Map[j,g]);
          ReadLn;
        end;
      Max:=0;
      for j:=1 to R do
        for g:=1 to C do
          if Table[j,g] = 0 then
            Begin
              T:=1;
              Old[T].X:=j;
              Old[T].Y:=g;
              Table[j,g]:=1;
              L:=1;
              V:=1;
              While V <> 0 do
                Begin
                  Inc(L);
                  T:=V;
                  V:=0;
                  for k:=1 to T do
                    With Old[k] do
                      Begin
                        if (Map[X-1,Y] < Map[X,Y]) and (L > Table[X-1,Y]) then
                          Begin
                            Inc(V);
                            Stack[V].X:=X-1;
                            Stack[V].Y:=Y;
                            Table[X-1,Y]:=L;
                          end;
                        if (Map[X+1,Y] < Map[X,Y]) and (L > Table[X+1,Y]) then
                          Begin
                            Inc(V);
                            Stack[V].X:=X+1;
                            Stack[V].Y:=Y;
                            Table[X+1,Y]:=L;
                          end;
                        if (Map[X,Y-1] < Map[X,Y]) and (L > Table[X,Y-1]) then
                          Begin
                            Inc(V);
                            Stack[V].X:=X;
                            Stack[V].Y:=Y-1;
                            Table[X,Y-1]:=L;
                          end;
                        if (Map[X,Y+1] < Map[X,Y]) and (L > Table[X,Y+1]) then
                          Begin
                            Inc(V);
                            Stack[V].X:=X;
                            Stack[V].Y:=Y+1;
                            Table[X,Y+1]:=L;
                          end;
                      end;
                  Old:=Stack;
                end;
              if L-1 > Max then
                Max:=L-1;
            end;
      WriteLn(Name,': ',Max);
    end;
end.