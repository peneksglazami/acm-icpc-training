{Problem: 10034 - Freckles
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10034 (input, output);
Const
  NMax = 100;

Type
  Freckle = Record
    X,Y: Real;
   end;

  Edge = Record
    s,f: Byte;
    d: Real;
   end;

  Edges = Array [1..(NMax*(NMax-1)) div 2] of Edge;

Var
  Freckles: Array [1..NMax] of Freckle;
  Mark: Array [1..NMax] of Byte;
  A: Edges;
  i,j,g,p,Test,N: Integer;
  AllDistance: Real;

Procedure QuickSort(Var A: Edges; Lo,Hi: Word);
  Procedure Sort(l,r: Word);
  Var
    i,j: Integer;
    X,Change: Edge;
  Begin
    i:=l;
    j:=r;
    X:=A[(i+j) div 2];
    Repeat
      While A[i].d < X.d do Inc(i);
      While A[j].d > X.d do Dec(j);
      if i <= j then
        Begin
          Change:=A[i];
          A[i]:=A[j];
          A[j]:=Change;
          Inc(i);
          Dec(j);
        end;
    Until i > j;
    if l < j then Sort(l,j);
    if i < r then Sort(i,r);
  end;

Begin
  Sort(Lo,Hi);
end;

Procedure ChangeMark(a,b: Integer);
Var
  i,change: Integer;
Begin
  if a > b then
    Begin
      change:=a;
      a:=b;
      b:=change;
    end;
  for i:=1 to N do
    if Mark[i] = b then
      Mark[i]:=a;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn;
      ReadLn(N);
      for j:=1 to N do
        With Freckles[j] do
          ReadLn(X,Y);
      p:=0;
      for j:=1 to N-1 do
        for g:=j+1 to N do
          Begin
            Inc(p);
            With A[p] do
              Begin
                s:=j;
                f:=g;
                d:=Sqrt(Sqr(Freckles[j].X-Freckles[g].X)+Sqr(Freckles[j].Y-Freckles[g].Y));
              end;
          end;
      QuickSort(A,1,p);
      for j:=1 to N do
        Mark[j]:=j;
      j:=0;
      g:=1;
      AllDistance:=0;
      While j < N-1 do
        Begin
          While (Mark[A[g].s] = Mark[A[g].f]) do
            Inc(g);
          ChangeMark(Mark[A[g].s],Mark[A[g].f]);
          AllDistance:=AllDistance+A[g].d;
          Inc(j);
        end;
      WriteLn(AllDistance:0:2);
      if i <> Test then
        WriteLn;
    end;
end.