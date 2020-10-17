{ACM ICPC 2001-2002 Northeastern
 Problem D - Wall
 Solved by Andrey Grigorov}
 
{$A8,B-,C+,D-,E-,F-,G+,H+,I+,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem2453 (input, output);
{$APPTYPE CONSOLE}
Type
  Vertex = Record
    X,Y: Integer
   end;

Var
  A,B: Array [0..1000] of Vertex;
  i,j,m,k,min,Test,N,L: Integer;
  WL,X: Double;

Function Scalar(A1,A2,B1,B2: Vertex): Integer;
Begin
  Scalar:=(A2.X-A1.X)*(B2.X-B1.X)+(A2.Y-A1.Y)*(B2.Y-B1.Y);
end;

Function Vect(A1,A2,B1,B2: Vertex): Integer;
Begin
  Vect:=(A2.X-A1.X)*(B2.Y-B1.Y)-(B2.X-B1.X)*(A2.Y-A1.Y);
end;

Function Dist(A1,A2: Vertex): Integer;
Begin
  Dist:=Sqr(A2.X-A1.X)+Sqr(A2.Y-A1.Y);
end;

Function Angle(A1,A2,B1,B2: Vertex): Double;
Begin
  if Scalar(A1,A2,B1,B2) = 0 then
    Angle:=pi/2
  else
    if Scalar(A1,A2,B1,B2) > 0 then
      Angle:=ArcTan(Vect(A1,A2,B1,B2)/Scalar(A1,A2,B1,B2))
    else
      Angle:=ArcTan(Vect(A1,A2,B1,B2)/Scalar(A1,A2,B1,B2))+pi;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn;
      ReadLn(N,L);
      for i:=1 to N do
        ReadLn(A[i].X,A[i].Y);
      m:=1;
      for i:=2 to N do
        if (A[m].Y < A[i].Y) or
         ((A[m].Y = A[i].Y) and (A[m].X < A[i].X)) then
           m:=i;
      B[0]:=A[m];
      A[m]:=A[1];
      A[1]:=B[0];
      k:=0;
      min:=2;
      Repeat
        for i:=2 to N do
          if (Vect(B[k],A[min],B[k],A[i]) < 0) or
            ((Vect(B[k],A[min],B[k],A[i]) = 0) and
            (Dist(B[k],A[min]) < Dist(B[k],A[i]))) then
              min:=i;
        Inc(k);
        B[k]:=A[min];
        min:=1;
      Until (B[k].X = B[0].X) and (B[k].Y = B[0].Y);
      WL:=0;
      for i:=0 to k-1 do
        Begin
          WL:=WL+Sqrt(Dist(B[i mod k],B[(i+1) mod k]));
          WL:=WL+L*Angle(B[i mod k],B[(i+1) mod k],B[(i+1) mod k],B[(i+2) mod k]);
        end;
      WriteLn(Round(WL));
      Dec(Test);
      if Test <> 0 then
        WriteLn;
    end;
end.
