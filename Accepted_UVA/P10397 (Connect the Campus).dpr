{Problem: 10397 - Connect the Campus
 Problem E - World Final Warmup (Oriental) Contest
 Problem-setters: G. Kemkes & G. V. Cormack, CS Dept, University of Waterloo
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10397 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 750;

Type
  Building = Record
    X,Y: Integer;
   end;

  Edge = Record
    N1,N2: Integer;
    L: Double;
   end;

Var
  A: Array [1..MaxN] of Building;
  Mark: Array [1..MaxN] of Integer;
  Edges: Array [1..MaxN*(MaxN - 1) div 2] of Edge;
  i,j,N,M,B1,B2,Amount,Count: Integer;
  TotalLength: Double;

Procedure ChangeMark(a,b: Integer);
Var
  i,Change: Integer;
Begin
  if a > b then
    begin
      Change:=a;
      a:=b;
      b:=Change;
    end;
  for i:=1 to N do
    if Mark[i] = b then
      Mark[i]:=a;
end;

Procedure Sort(l,r: Integer);
Var
  i,j: Integer;
  x: Double;
  Change: Edge;
Begin
  i:=l;
  j:=r;
  x:=Edges[(l+r) div 2].L;
  Repeat
    While Edges[i].L < x do Inc(i);
    While Edges[j].L > X do Dec(j);
    if i <= j then
      Begin
        Change:=Edges[i];
        Edges[i]:=Edges[j];
        Edges[j]:=Change;
        Inc(i);
        Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if l < j then Sort(l,j);
end;

Begin
  While not EOF do
    Begin
      ReadLn(N);
      for i:=1 to N do
        ReadLn(A[i].X,A[i].Y);
      ReadLn(M);
      for i:=1 to N do
        Mark[i]:=i;
      Amount:=0;
      for i:=1 to M do
        Begin
          ReadLn(B1,B2);
          if Mark[B1] <> Mark[B2] then
            Begin
              Inc(Amount);
              ChangeMark(Mark[B1],Mark[B2]);
            end;
        end;
      Count:=0;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          Begin
            Inc(Count);
            With Edges[Count] do
              Begin
                N1:=i;
                N2:=j;
                L:=Sqrt(Sqr(A[N1].X-A[N2].X)+Sqr(A[N1].Y-A[N2].Y));
              end;
          end;
      if Count > 0 then
        Sort(1,Count);
      TotalLength:=0;
      i:=1;
      While Amount < N-1 do
        Begin
          if Mark[Edges[i].N1] <> Mark[Edges[i].N2] then
            Begin
              Inc(Amount);
              ChangeMark(Mark[Edges[i].N1],Mark[Edges[i].N2]);
              TotalLength:=TotalLength+Edges[i].L;
            end;
          Inc(i);
        end;
      WriteLn(TotalLength:0:2);
    end;
end.