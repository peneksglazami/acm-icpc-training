{Problem: 10577 - Bounding box
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10577 (input, output);
Type
  Point = Record
    x,y: Double;
   end;

Var
  p: Array [1..3] of Point;
  pp: Array [1..150] of Point;
  i,j,k,n_case,N: Integer;
  a1,b1,c1,a2,b2,c2,cx,cy,R,d,d1,d2,s_angle,minx,miny,maxx,maxy: Double;
  m1,m2: Point;

Function Scalar(a1,b1,a2,b2: Double): Double;
Begin
  Scalar:=a1*a2+b1*b2;
end;

Function Vect(a1,b1,a2,b2: Double): Double;
Begin
  Vect:=a1*b2-a2*b1;
end;

Function Angle(a1,b1,a2,b2: Double): Double;
Begin
  if Scalar(a1,b1,a2,b2) = 0 then
    if Vect(a1,b1,a2,b2) > 0 then
      Angle:=pi/2
    else
      Angle:=-pi/2
  else
    if Scalar(a1,b1,a2,b2) > 0 then
      Angle:=ArcTan(Vect(a1,b1,a2,b2)/Scalar(a1,b1,a2,b2))
    else
      if Vect(a1,b1,a2,b2) >= 0 then
        Angle:=ArcTan(Vect(a1,b1,a2,b2)/Scalar(a1,b1,a2,b2))+pi
      else
        Angle:=ArcTan(Vect(a1,b1,a2,b2)/Scalar(a1,b1,a2,b2))-pi;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      for i:=1 to 3 do
        ReadLn(p[i].x,p[i].y);
      m1.x:=(p[1].x+p[2].x)/2;
      m1.y:=(p[1].y+p[2].y)/2;
      m2.x:=(p[1].x+p[3].x)/2;
      m2.y:=(p[1].y+p[3].y)/2;
      a1:=p[2].x-p[1].x;
      b1:=p[2].y-p[1].y;
      c1:=-a1*m1.x-b1*m1.y;
      a2:=p[3].x-p[1].x;
      b2:=p[3].y-p[1].y;
      c2:=-a2*m2.x-b2*m2.y;
      d:=a1*b2-a2*b1;
      d1:=-c1*b2+c2*b1;
      d2:=-a1*c2+a2*c1;
      cx:=d1/d;
      cy:=d2/d;
      R:=Sqrt(Sqr(cx-p[1].x)+Sqr(cy-p[1].y));
      s_angle:=Angle(p[1].x-cx,p[1].y-cy,1,0);
      for i:=1 to N do
        Begin
          pp[i].x:=cx+R*Cos(s_angle);
          pp[i].y:=cy+R*Sin(s_angle);
          s_angle:=s_angle+2*pi/N;
        end;
      minx:=pp[1].x;
      miny:=pp[1].y;
      maxx:=pp[1].x;
      maxy:=pp[1].y;
      for i:=2 to N do
        Begin
          if pp[i].x > maxx then
            maxx:=pp[i].x
          else
            if pp[i].x < minx then
              minx:=pp[i].x;
          if pp[i].y > maxy then
            maxy:=pp[i].y
          else
            if pp[i].y < miny then
              miny:=pp[i].y;
        end;
      Inc(n_case);
      WriteLn('Polygon ',n_case,': ',Abs(maxx-minx)*Abs(maxy-miny):0:3);
      ReadLn(N);
    end;
end.