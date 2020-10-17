{Problem: 532 - Dungeon Master
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem532 (input,output);
Const
  D: Array [1..6,1..3] of ShortInt = ((1,0,0),(-1,0,0),(0,1,0),
                                      (0,-1,0),(0,0,1),(0,0,-1));

Type
  TCell = Record
    L,R,C: Integer;
   end;

  TTurn = Record
    N: Integer;
    A: Array [1..27000] of TCell;
   end;

Var
  M: Array [0..31,0..31,0..31] of Char;
  T: Array [1..30,1..30,1..30] of Integer;
  i,j,g,L,R,C,Step: Integer;
  S,E: TCell;
  Turn,NewTurn: TTurn;

Begin
  ReadLn(L,R,C);
  While (L <> 0) or (R <> 0) or (C <> 0) do
    Begin
      FillChar(M,SizeOf(M),'#');
      FillChar(T,SizeOf(T),0);
      for i:=1 to L do
        Begin
          for j:=1 to R do
            Begin
              for g:=1 to C do
                Begin
                  Read(M[i,j,g]);
                  Case M[i,j,g] of
                    'S': Begin
                           S.L:=i;
                           S.R:=j;
                           S.C:=g;
                         end;
                    'E': Begin
                           E.L:=i;
                           E.R:=j;
                           E.C:=g;
                         end;
                   end;
                end;
              ReadLn;
            end;
          ReadLn;
        end;
      Turn.N:=1;
      Turn.A[1]:=S;
      Step:=0;
      While (Turn.N > 0) and (T[E.L,E.R,E.C] = 0) do
        Begin
          Inc(Step);
          NewTurn.N:=0;
          for i:=1 to Turn.N do
            for j:=1 to 6 do
              if (M[Turn.A[i].L+D[j,1],Turn.A[i].R+D[j,2],Turn.A[i].C+D[j,3]] <> '#') then
                if (T[Turn.A[i].L+D[j,1],Turn.A[i].R+D[j,2],Turn.A[i].C+D[j,3]] = 0) then
                  Begin
                    Inc(NewTurn.N);
                    NewTurn.A[NewTurn.N].L:=Turn.A[i].L+D[j,1];
                    NewTurn.A[NewTurn.N].R:=Turn.A[i].R+D[j,2];
                    NewTurn.A[NewTurn.N].C:=Turn.A[i].C+D[j,3];
                    T[Turn.A[i].L+D[j,1],Turn.A[i].R+D[j,2],Turn.A[i].C+D[j,3]]:=Step;
                  end;
          Turn:=NewTurn;
        end;
      if T[E.L,E.R,E.C] <> 0 then
        WriteLn('Escaped in ',T[E.L,E.R,E.C],' minute(s).')
      else
        WriteLn('Trapped!');
      ReadLn(L,R,C);
    end;
end.