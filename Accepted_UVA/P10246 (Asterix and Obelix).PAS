{Problem: 10246 - Asterix and Obelix
 World Finals Warmup Occidental Contest
 Problem Setter: Rezaul Alam Chowdhury
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10246 (input,output);
Const
  MaxC = 80;

Type
  Path = Record
    Cost,Feast: Integer;
   end;

Var
  B: Array [1..MaxC,1..MaxC] of Boolean;
  D: Array [1..MaxC,1..MaxC] of Path;
  F: Array [1..MaxC] of Integer;
  i,j,m,C,R,Q,S,E,n_case,c1,c2,d_cost: Integer;
  Nadoelo: Boolean;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Begin
  n_case:=0;
  ReadLn(C,R,Q);
  While (C <> 0) or (R <> 0) or (Q <> 0) do
    Begin
      for i:=1 to C do
        for j:=1 to C do
          D[i,j].Cost:=MaxInt div 3;
      FillChar(B,SizeOf(B),False);
      for i:=1 to C do
        Read(F[i]);
      ReadLn;
      for i:=1 to R do
        Begin
          ReadLn(c1,c2,d_cost);
          D[c1,c2].Cost:=d_cost;
          D[c1,c2].Feast:=Max(F[c1],F[c2]);
          D[c2,c1]:=D[c1,c2];
          B[c1,c2]:=True;
          B[c2,c1]:=True;
        end;
      Repeat
        Nadoelo:=True;
        for m:=1 to C do
          for i:=1 to C do
            for j:=1 to C do
              if B[i,m] and B[m,j] then
                if D[i,j].Cost+D[i,j].Feast >  D[i,m].Cost+D[m,j].Cost+Max(D[i,m].Feast,D[m,j].Feast) then
                  Begin
                    D[i,j].Cost:=D[i,m].Cost+D[m,j].Cost;
                    D[i,j].Feast:=Max(D[i,m].Feast,D[m,j].Feast);
                    B[i,j]:=True;
                    Nadoelo:=False;
                  end;
      Until Nadoelo;
      Inc(n_case);
      WriteLn('Case #',n_case);
      for i:=1 to Q do
        Begin
          ReadLn(S,E);
          if B[S,E] then
            WriteLn(D[S,E].Cost+D[S,E].Feast)
          else
            WriteLn('-1');
        end;
      ReadLn(C,R,Q);
    end;
end.