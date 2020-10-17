{Problem: 1277
 ACM ICPC NEERC 2003-2004 Quarterfinal - Central Subregion
 Problem D - Cops and Thieves
 Solution: Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program P1277;
{$APPTYPE CONSOLE}
Var
  C: Array [1..100,1..100] of Integer;
  D: Array [1..100,1..100] of LongInt;
  P: Array [1..100,1..2] of LongInt;
  Pol: Array [1..100] of Integer;
  i,x,y,K,N,M,S,F,Sum: Integer;
  Lg: Boolean;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Procedure Mark;
Var
  Stack: Array [1..100] of Integer;
  M: Set of 1..100;
  i,l,yk1,yk2: Integer;
Begin
  M:=[1..N];
  P[S,1]:=S;
  P[S,2]:=MaxInt;
  l:=S;
  yk1:=0;
  yk2:=0;
  While (P[F,1] = 0) and Lg do
    Begin
      for i:=1 to N do
        if (P[i,1] = 0) and (C[l,i] <> 0) then
          if D[l,i] < C[l,i] then
            Begin
              P[i,1]:=l;
              if P[l,2] < C[l,i]-D[l,i] then
                P[i,2]:=P[l,2]
              else
                P[i,2]:=C[l,i]-D[l,i];
              Inc(yk1);
              Stack[yk1]:=i;
            end
          else
            if (D[i,l] > 0) and (D[l,i] = C[l,i]) then
              Begin
                P[i,1]:=-l;
                if P[l,2] > D[i,l] then
                  P[i,2]:=D[i,l]
                else
                  P[i,2]:=P[l,2];
                Inc(yk1);
                Stack[yk1]:=i;
              end;
      M:=M-[l];
      if yk2 < yk1 then
        Begin
          Inc(yk2);
          l:=Stack[yk2];
        end
      else
        Lg:=False;
    end;
end;

Procedure Stream(q: Integer);
Begin
  if P[q,1] > 0 then
    D[P[q,1],q]:=D[P[q,1],q]+P[F,2]
  else
    D[q,Abs(P[q,1])]:=D[q,Abs(P[q,1])]-P[F,2];
  if Abs(P[q,1]) <> S then
    Stream(Abs(P[q,1]));
end;

Begin
  ReadLn(K);
  ReadLn(N,M,S,F);
  for i:=1 to N do
    Read(Pol[i]);
  ReadLn;
  Pol[S]:=MaxInt;
  Pol[F]:=MaxInt;
  FillChar(C,SizeOf(C),0);
  for i:=1 to M do
    Begin
      ReadLn(x,y);
      C[x,y]:=Min(Pol[x],Pol[y]);
      C[y,x]:=C[x,y];
    end;
  FillChar(D,SizeOf(D),0);
  Lg:=True;
  While Lg do
    Begin
      FillChar(P,SizeOf(P),0);
      Mark;
      if Lg then
        Stream(F);
    end;
  Sum:=0;
  for i:=1 to N do
    if C[i,F] <> 0 then
      if D[i,F] <> MaxInt then
        Inc(Sum,D[i,F])
      else
        Begin
          Sum:=MaxInt;
          Break;
        end;
  if Sum > K then
    WriteLn('NO')
  else
    WriteLn('YES');
end.