{Problem: 1234 - Bricks
 Author: Elena Andreeva
 Problem B - 2002-2003 ACM Northeastern European Regional Programming Contest
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J+,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program P1234;
Const
  Approx = 10e-5;

Type
  Point = Record
    X,Y: Double;
   end;

Var
  A: Array [1..3] of Double;
  V: Array [1..2] of Point;
  L1,L2,D,E,Change,X_C,Y_C,Ang,Angle: Double;
  i,j: Integer;
  Ok: Boolean;

Function Overlop(V: Point): Boolean;
Begin
  Result:=(V.X >= 0) and (V.Y >= 0) and
          (V.X <= D+Approx) and (V.Y <= E+Approx);
end;

Begin
  ReadLn(A[1],A[2],A[3],D,E);
  for i:=1 to 2 do
    for j:=i+1 to 3 do
      if A[i] > A[j] then
        Begin
          Change:=A[i];
          A[i]:=A[j];
          A[j]:=Change;
        end;
  L1:=A[2]/2;
  L2:=A[1]/2;
  Ok:=False;
  if D < E then
    Begin
      Change:=D;
      D:=E;
      E:=Change;
    end;
  Angle:=0;
  X_C:=D/2;
  Y_C:=E/2;
  While (Angle <= 90) and not Ok do
    Begin
      Ang:=pi*Angle/360;
      V[1].X:=X_C+L1*Cos(Ang)+L2*Sin(Ang);
      V[1].Y:=Y_C+L1*Sin(Ang)-L2*Cos(Ang);
      V[2].X:=X_C+L1*Cos(Ang)-L2*Sin(Ang);
      V[2].Y:=Y_C+L1*Sin(Ang)+L2*Cos(Ang);
      Ok:=Overlop(V[1]) and Overlop(V[2]);
        Angle:=Angle+0.1;
    end;
  if Ok then
    WriteLn('YES')
  else
    WriteLn('NO');
end.