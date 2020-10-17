{Problem: 190 - Circle Through Three Points
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem190 (input,output);
Type
  Point = Record
    x,y: Double;
   end;

Var
  p1,p2,p3: Point;
  a1,a2,b1,b2,c1,c2,d,d1,d2,x,y,r,cc,dd,ee: Double;

Begin
  While not EOF do
    Begin
      ReadLn(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y);
      a1:=p2.x-p1.x;
      b1:=p2.y-p1.y;
      c1:=-a1*(p2.x+p1.x)/2-b1*(p2.y+p1.y)/2;
      a2:=p3.x-p1.x;
      b2:=p3.y-p1.y;
      c2:=-a2*(p3.x+p1.x)/2-b2*(p3.y+p1.y)/2;
      d:=a1*b2-a2*b1;
      d1:=-c1*b2+c2*b1;
      d2:=-a1*c2+a2*c1;
      x:=d1/d;
      y:=d2/d;
      cc:=-2*x;
      dd:=-2*y;
      r:=Sqrt(Sqr(x-p1.x)+Sqr(y-p1.y));
      ee:=Sqr(x)+Sqr(y)-Sqr(r);
      Write('(x');
      if x >= 0 then
        Write(' - ',x:0:3)
      else
        Write(' + ',Abs(x):0:3);
      Write(')^2 + (y');
      if y >= 0 then
        Write(' - ',y:0:3)
      else
        Write(' + ',Abs(y):0:3);
      Write(')^2 = ');
      if r < 0 then
        Write('- ');
      WriteLn(Abs(r):0:3,'^2');
      Write('x^2 + y^2 ');
      if cc >= 0 then
        Write('+ ',cc:0:3)
      else
        Write('- ',Abs(cc):0:3);
      Write('x ');
      if dd >= 0 then
        Write('+ ',dd:0:3)
      else
        Write('- ',Abs(dd):0:3);
      Write('y ');
      if ee >= 0 then
        Write('+ ',ee:0:3)
      else
        Write('- ',Abs(ee):0:3);
      WriteLn(' = 0');
    end;
end.