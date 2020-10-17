{Problem: 10600 - ACM Contest and Blackout
 Problem source: Ukrainian National Olympiad in Informatics 2001
 Problem author: Shamil Yagiyayev
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10600 (input, output);
Const
  MaxN = 100;

Type
  Edge = Record
    X,Y,C: Integer;
   end;

Var
  P: Array [1..MaxN*(MaxN-1) div 2] of Edge;
  Marks: Array [1..MaxN] of Integer;
  Ostov: Array [1..MaxN-1] of Integer;
  i,j,N,M,Test,S1,S2,K,MinS2: Integer;

Procedure Sort(l,r: Integer);
Var
  i,j,X: Integer;
  Change: Edge;
Begin
  i:=l;
  j:=r;
  X:=P[(l+r) div 2].C;
  Repeat
    While P[i].C < X do Inc(i);
    While P[j].C > X do Dec(j);
    if i <= j then
      Begin
        Change:=P[i];
        P[i]:=P[j];
        P[j]:=Change;
        Inc(i);
        Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Procedure Mark(l,m: Integer);
Var
  i,Change: Integer;
Begin
  if l > m then
    Begin
      Change:=l;
      l:=m;
      m:=Change;
    end;
  for i:=1 to N do
    if Marks[i] = m then
      Marks[i]:=l;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(N,M);
      for i:=1 to M do
        ReadLn(P[i].X,P[i].Y,P[i].C);
      Sort(1,M);
      for i:=1 to N do
        Marks[i]:=i;
      S1:=0;
      i:=1;
      K:=0;
      While (K < N-1) do
        Begin
          if Marks[P[i].X] <> Marks[P[i].Y] then
            Begin
              Mark(Marks[P[i].X],Marks[P[i].Y]);
              Inc(S1,P[i].C);
              Inc(K);
              Ostov[K]:=i;
            end;
          Inc(i);
        end;
      MinS2:=MaxInt;
      for j:=1 to N-1 do
        Begin
          for i:=1 to N do
            Marks[i]:=i;
          S2:=0;
          i:=1;
          K:=0;
          While (K < N-1) and (i <= M) do
            Begin
              if (Marks[P[i].X] <> Marks[P[i].Y]) and (Ostov[j] <> i) then
                Begin
                  Mark(Marks[P[i].X],Marks[P[i].Y]);
                  Inc(S2,P[i].C);
                  Inc(K);
                end;
              Inc(i);
            end;
          if (K = N-1) and (S2 < MinS2) then
            MinS2:=S2;
        end;
      WriteLn(S1,' ',MinS2);
      Dec(Test);
    end;
end.