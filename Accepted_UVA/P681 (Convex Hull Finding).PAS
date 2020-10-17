{Problem 681 - Convex Hull Finding
 Author - Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem681 (input,output);
Type
  Vertex = Record
    X,Y: LongInt;
   end;

Var
  A,B: Array [1..513] of Vertex;
  i,j,m,min,K,N,V: Integer;

Function Vect(A1,B1,A2,B2: Vertex): LongInt;
Begin
  Vect:=(B1.X-A1.X)*(B2.Y-A2.Y)-(B1.Y-A1.Y)*(B2.X-A2.X);
end;

Function Dist(A1,A2: Vertex): LongInt;
Begin
  Dist:=Sqr(A2.X-A1.X)+Sqr(A2.Y-A1.Y);
end;

Begin
  ReadLn(K);
  WriteLn(K);
  While K > 0 do
    Begin
      ReadLn(N);
      for i:=1 to N do
        ReadLn(A[i].X,A[i].Y);
      if K > 1 then
        ReadLn(i);
      m:=1;
      for i:=2 to N-1 do
        if (A[m].Y > A[i].Y) or ((A[m].Y = A[i].y) and (A[m].X > A[i].X)) then
          m:=i;
      B[1]:=A[m];
      A[m]:=A[1];
      A[1]:=B[1];
      min:=2;
      V:=1;
      Repeat
        for i:=2 to N-1 do
          if (Vect(B[V],A[min],B[V],A[i]) < 0) or
             ((Vect(B[V],A[min],B[V],A[i]) = 0) and
             (Dist(B[V],A[min]) < Dist(B[V],A[i]))) then
               min:=i;
        Inc(V);
        B[V]:=A[min];
        min:=1;
      Until (B[1].X = B[V].X) and (B[1].Y = B[V].Y);
      WriteLn(V);
      for i:=1 to V do
        WriteLn(B[i].X,' ',B[i].Y);
      if K > 1 then
        WriteLn('-1');
      Dec(K);
    end;
end.