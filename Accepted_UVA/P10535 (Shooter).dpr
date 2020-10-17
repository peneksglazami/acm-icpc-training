{Problem: 10535 - Shooter
 Problemsetter: Md. Kamruzzaman, Member of Elite Problemsetters' Panel
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10535 (input,output);
{$APPTYPE CONSOLE}
Type
  Point = Record
    X,Y: Integer;
   end;

  DPoint = Record
    X,Y: Double;
   end;

  Line = Record
    A,B,C: Integer;
   end;

  Segment = Record
    p1,p2: Point;
   end;

  Vector = Record
    X,Y: Double;
   end;

Function ToLine(X1,Y1,X2,Y2: Integer): Line;
Begin
  With Result do
    Begin
      A:=Y2-Y1;
      B:=X1-X2;
      C:=-A*X1-B*Y1;
    end;
end;

Function Intersect(L: Line; W: Segment): Boolean;
Var
  val1,val2: Integer;
Begin
  val1:=L.A*W.p1.X+L.B*W.p1.Y+L.C;
  val2:=L.A*W.p2.X+L.B*W.p2.Y+L.C;
  Intersect:=((val1 >= 0) and (val2 <= 0))
              or ((val1 <= 0) and (val2 >= 0));
end;

Function Vect(A1,A2,B1,B2: Point): Integer;
Begin
  Result:=(A2.X-A1.X)*(B2.Y-B1.Y)-(A2.Y-A1.Y)*(B2.X-B1.X);
end;

Function VectN(A: Vector; N: Double): Vector;
Begin
  Result.X:=N*A.X;
  Result.Y:=N*A.Y;
end;

Function FindM(S1,S2: Segment): DPoint;
Var
  v1,v2: Integer;
  p1p2,p1m: Vector;
Begin
  v1:=Vect(S2.p1,S2.p2,S2.p1,S1.p1);
  v2:=Vect(S1.p1,S1.p2,S2.p1,S2.p2);
  if v2 = 0 then
    Begin
      Result.X:=(S2.p1.x+S2.p2.x)/2;
      Result.Y:=(S2.p1.y+S2.p2.y)/2;
    end
  else
    Begin
      p1p2.x:=S1.p2.X-S1.p1.X;
      p1p2.y:=S1.p2.Y-S1.p1.Y;
      p1m:=VectN(p1p2,v1/v2);
      Result.X:=S1.p1.x+p1m.X;
      Result.Y:=S1.p1.y+p1m.Y;
    end;
end;

Var
  Walls: Array [1..500] of Segment;
  Vertexes: Array [1..1000] of Point;
  S: Segment;
  L: Line;
  M: DPoint;
  i,j,N,X,Y,Max,Amount,K: Integer;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      for i:=1 to N do
        With Walls[i] do
          Begin
            ReadLn(p1.X,p1.Y,p2.X,p2.Y);
            Vertexes[2*i-1].X:=p1.X;
            Vertexes[2*i-1].Y:=p1.Y;
            Vertexes[2*i].X:=p2.X;
            Vertexes[2*i].Y:=p2.Y;
          end;
      ReadLn(S.p1.X,S.p1.Y);
      Max:=0;
      for i:=1 to 2*N do
        Begin
          S.p2.X:=Vertexes[i].X;
          S.p2.Y:=Vertexes[i].Y;
          L:=ToLine(S.p1.X,S.p1.Y,S.p2.X,S.p2.Y);
          Amount:=0;
          for j:=1 to N do
            if Intersect(L,Walls[j]) then
              Begin
                M:=FindM(S,Walls[j]);
                if (S.p2.X-S.p1.X)*(M.X-S.p1.x)+(S.p2.Y-S.p1.Y)*(M.Y-S.p1.y) >= 0 then
                  Inc(Amount);
              end;
          if Amount > Max then
            Max:=Amount;
        end;
      WriteLn(Max);
      ReadLn(N);
    end;
end.