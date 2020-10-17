{Problem: 534 - Frogger
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem534 (input, output);
Type
  Stone = Record
    X,Y: Integer;
   end;

Var
  D: Array [2..200] of LongInt;
  Stones: Array [1..200] of Stone;
  T: Set of 2..200;
  i,j,n_case,N,NMin: Integer;
  Min: LongInt;

Function FMin(a,b: LongInt): LongInt;
Begin
  if a < b then
    FMin:=a
  else
    FMin:=b;
end;

Function FMax(a,b: LongInt): LongInt;
Begin
  if a > b then
    FMax:=a
  else
    FMax:=b;
end;

Begin
  ReadLn(N);
  n_case:=1;
  While N <> 0 do
    Begin
      ReadLn(Stones[1].X,Stones[1].Y);
      ReadLn(Stones[2].X,Stones[2].Y);
      for i:=3 to N do
        With Stones[i] do
          ReadLn(X,Y);
      for i:=2 to N do
        D[i]:=Sqr(Stones[1].X-Stones[i].X)+Sqr(Stones[1].Y-Stones[i].Y);
      T:=[2..N];
      While T <> [] do
        Begin
          Min:=MaxLongInt;
          NMin:=0;
          for i:=2 to N do
            if (i in T) and (D[i] < Min) then
              Begin
                Min:=D[i];
                NMin:=i;
              end;
          T:=T-[NMin];
          for i:=2 to N do
            D[i]:=FMin(D[i],FMax(D[NMin],Sqr(Stones[i].X-Stones[NMin].X)+Sqr(Stones[i].Y-Stones[NMin].Y)));
        end;
      WriteLn('Scenario #',n_case);
      WriteLn('Frog Distance = ',Sqrt(D[2]):0:3);
      ReadLn(N);
      if N <> 0 then
        WriteLn;
      Inc(n_case);
    end;
end.