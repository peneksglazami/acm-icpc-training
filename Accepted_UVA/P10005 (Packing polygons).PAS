{Problem: 10005 - Packing polygons
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10005 (input,output);
Const
  Approx = 10e-7;
  MaxN = 100;

Type
  Point = Record
    x,y: Double;
   end;

Var
  p: Array [1..MaxN] of Point;
  R,RR: Double;
  p0: Point;
  i,j,g,N: Integer;
  Ok,InCircle: Boolean;

Function Vect(p1,p2,p3,p4: Point): Double;
Begin
  Vect:=(p2.x-p1.x)*(p4.y-p3.y)-(p2.y-p1.y)*(p4.x-p3.x);
end;

Function Dist(p1,p2: Point): Double;
Begin
  Dist:=Sqrt(Sqr(p2.x-p1.x)+Sqr(p2.y-p1.y));
end;

Function FindCircle(p1,p2: Point; Var p0: Point): Double;
Begin
  p0.x:=(p2.x+p1.x)/2; p0.y:=(p2.y-p1.y)/2;
  FindCircle:=Dist(p0,p1);
end;

Function FindCircle2(p1,p2,p3: Point; Var p0: Point): Double;
Var
  m1,m2: Point;
  a1,a2,b1,b2,c1,c2,d,d1,d2: Double;

Begin
  m1.x:=(p1.x+p2.x)/2; m1.y:=(p1.y+p2.y)/2;
  m2.x:=(p1.x+p3.x)/2; m2.y:=(p1.y+p3.y)/2;
  a1:=p2.x-p1.x;
  b1:=p2.y-p1.y;
  c1:=-a1*m1.x-b1*m1.y;
  a2:=p3.x-p1.x;
  b2:=p3.y-p1.y;
  c2:=-a2*m2.x-b2*m2.y;
  d:=a1*b2-a2*b1;
  d1:=-c1*b2+c2*b1;
  d2:=-a1*c2+a2*c1;
  p0.x:=d1/d; p0.y:=d2/d;
  FindCircle2:=Dist(p0,p1);
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        ReadLn(p[i].x,p[i].y);
      ReadLn(R);
      Ok:=False;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          Begin
            RR:=FindCircle(p[i],p[j],p0);
            if RR <= R+Approx then
              Begin
                InCircle:=True;
                for g:=1 to N do
                  InCircle:=InCircle and (Dist(p0,p[g]) <= RR+Approx);
                Ok:=Ok or InCircle;
              end;
          end;
      if not OK then
        for i:=1 to N-2 do
          for j:=i+1 to N-1 do
            for g:=j+1 to N do
              if Abs(Vect(p[i],p[j],p[i],p[g])) > Approx then
                Begin
                  RR:=FindCircle2(p[i],p[j],p[g],p0);
                  if RR <= R+Approx then
                    Begin
                      InCircle:=True;
                      for g:=1 to N do
                        InCircle:=InCircle and (Dist(p0,p[g]) <= RR+Approx);
                      Ok:=Ok or InCircle;
                    end;
                end;
      if Ok then
        WriteLn('The polygon can be packed in the circle.')
      else
        WriteLn('There is no way of packing that polygon.');
      ReadLn(N);
    end;
end.