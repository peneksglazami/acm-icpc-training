{Problem: 10053 - Envelopes
 Author: Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10053 (input, output);
Const
  Approx = 1e-7;

Type
  Card = Record
    L,W: LongInt;
   end;

  Envelope = Record
    L,W,C: LongInt;
   end;

  Point = Record
    X,Y: Double;
   end;

Var
  C: Array [1..5] of Card;
  E: Array [1..10] of Envelope;
  A: Array [1..5,1..10] of Boolean;
  F: Array [1..10] of Boolean;
  Way,BestWay: Array [1..5] of Integer;
  i,j,M,N,n_case: Integer;
  MinSum: LongInt;

Procedure Swap(Var a,b: LongInt);
Var
  Change: LongInt;
Begin
  Change:=a;
  a:=b;
  b:=Change;
end;

Function InEnvelope(Const P: Point; Const E: Envelope): Boolean;
Begin
  InEnvelope:=(p.x >= 0) and (p.x < E.L + Approx) and
              (p.y >= 0) and (p.y <= E.W + Approx);
end;

Function Put(C: Card; E: Envelope): Boolean;
Var
  pc,p1,p2: Point;
  Angle: Double;
  Ok: Boolean;
Begin
  Angle:=0;
  Ok:=False;
  pc.x:=E.L/2;
  pc.y:=E.W/2;
  While (Angle <= 90) and not Ok do
    Begin
      p1.x:=pc.x+(C.L*Cos(Angle)+C.W*Sin(Angle))/2;
      p1.y:=pc.y+(C.L*Sin(Angle)-C.W*Cos(Angle))/2;
      p2.x:=pc.x+(C.L*Cos(Angle)-C.W*Sin(Angle))/2;
      p2.y:=pc.y+(C.L*Sin(Angle)+C.W*Cos(Angle))/2;
      Ok:=InEnvelope(p1,E) and InEnvelope(p2,E);
      Angle:=Angle+0.01;
    end;
  Put:=Ok;
end;

Procedure Solve(i: Integer; S: LongInt);
Var
  j: Integer;
Begin
  Inc(i);
  if i > M then
    Begin
      MinSum:=S;
      BestWay:=Way;
    end
  else
    for j:=1 to N do
      if A[i,j] and F[j] then
        if MinSum > S+E[j].C then
          Begin
            F[j]:=False;
            Way[i]:=j;
            Solve(i,S+E[j].C);
            F[j]:=True;
          end;
end;

Begin
  n_case:=0;
  ReadLn(M,N);
  While (M <> 0) or (N <> 0) do
    Begin
      for i:=1 to M do
        Begin
           ReadLn(C[i].L,C[i].W);
           if C[i].L < C[i].W then
             Swap(C[i].L,C[i].W);
        end;
      for i:=1 to N do
        Begin
          ReadLn(E[i].L,E[i].W,E[i].C);
          if E[i].L < E[i].W then
            Swap(E[i].L,E[i].W);
        end;
      FillChar(A,SizeOf(A),False);
      for i:=1 to M do
        for j:=1 to N do
          A[i,j]:=Put(C[i],E[j]);
      MinSum:=MaxLongInt;
      FillChar(F,SizeOf(F),True);
      Solve(0,0);
      Inc(n_case);
      WriteLn('Case #',n_case);
      if MinSum < MaxLongInt then
        for i:=1 to M do
          WriteLn(BestWay[i])
      else
        WriteLn('cannot buy');
      ReadLn(M,N);
      if (M <> 0) or (N <> 0) then
        WriteLn;
    end;
end.