{Problem: 10709 - Intersection is not that Easy
 Problem setter: Shahriar Manzoor,EPS
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10709 (input,output);
Var
  x1,x2,x3,x4,y1,y2,y3,y4: Integer;
  S1,S2: String;

Procedure Swap;
Var
  buf: Integer;
  bufS: String;
Begin
  buf:=x1; x1:=x3; x3:=buf;
  buf:=x2; x2:=x4; x4:=buf;
  buf:=y1; y1:=y3; y3:=buf;
  buf:=y2; y2:=y4; y4:=buf;
  bufS:=S1; S1:=S2; S2:=bufS;
end;

Function Trim(S: String): String;
Begin
  While S[1] = ' ' do
    Delete(S,1,1);
  While S[Length(S)] = ' ' do
    Delete(S,Length(S),1);
  Trim:=S;
end;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Function MinDouble(a,b: Double): Double;
Begin
  if a < b then
    MinDouble:=a
  else
    MinDouble:=b;
end;

Function Dist(x1,y1,x2,y2: Integer): Double;
Begin
  Dist:=Sqrt(Sqr(x2-x1)+Sqr(y2-y1));
end;

Function Vect(x1,y1,x2,y2,x3,y3,x4,y4: Integer): Integer;
Begin
  Vect:=(x2-x1)*(y4-y3)-(x4-x3)*(y2-y1);
end;

Function Scalar(x1,y1,x2,y2,x3,y3,x4,y4: Integer): Integer;
Begin
  Scalar:=(x2-x1)*(x4-x3)+(y2-y1)*(y4-y3);
end;

Function DistToLine(x1,y1,a,b,c: Integer): Double;
Begin
  DistToLine:=Abs((a*x1+b*y1+c))/Sqrt(Sqr(a)+Sqr(b));
end;

Function DistLSLS(x1,y1,x2,y2,x3,y3,x4,y4: Integer): Double;

  Function Intersect: Boolean;
  Var
    v1,v2,v3,v4,maxx1,maxy1,minx1,miny1,maxx2,maxy2,minx2,miny2: Integer;
  Begin
    maxx1:=Max(x1,x2);
    maxy1:=Max(y1,y2);
    minx1:=Min(x1,x2);
    miny1:=Min(y1,y2);
    maxx2:=Max(x3,x4);
    maxy2:=Max(y3,y4);
    minx2:=Min(x3,x4);
    miny2:=Min(y3,y4);
    v1:=Vect(x1,y1,x2,y2,x1,y1,x3,y3);
    v2:=Vect(x1,y1,x2,y2,x1,y1,x4,y4);
    v3:=Vect(x3,y3,x4,y4,x3,y3,x1,y1);
    v4:=Vect(x3,y3,x4,y4,x3,y3,x2,y2);
    Intersect:=(maxx1 > minx2) and (maxx2 > minx1) and
               (maxy1 > miny2) and (maxy2 > miny1) and
               (v1*v2 <= 0) and (v3*v4 <= 0);
  end;

  Function DistPLS(x,y,x1,y1,x2,y2: Integer): Double;
  Var
    a,b,c,v1,v2: Integer;
  Begin
    v1:=Scalar(x1,y1,x2,y2,x1,y1,x,y);
    v2:=Scalar(x2,y2,x1,y1,x2,y2,x,y);
    if (v1 >= 0) and (v2 >= 0) then
      Begin
        a:=y2-y1;
        b:=x1-x2;
        c:=-a*x1-b*y1;
        DistPLS:=DistToLine(x,y,a,b,c);
      end
    else
      DistPLS:=MinDouble(Dist(x,y,x1,y1),Dist(x,y,x2,y2));
  end;

Begin
  if Intersect then
    DistLSLS:=0
  else
    DistLSLS:=MinDouble(DistPLS(x1,y1,x3,y3,x4,y4),MinDouble(DistPLS(x2,y2,x3,y3,x4,y4),
              MinDouble(DistPLS(x3,y3,x1,y1,x2,y2),DistPLS(x4,y4,x1,y1,x2,y2))));
end;


Function DistLLS(x1,y1,x2,y2,x3,y3,x4,y4: Integer): Double;
Var
  a,b,c,v1,v2: Integer;
Begin
  a:=y2-y1;
  b:=x1-x2;
  c:=-a*x1-b*y1;
  v1:=a*x3+b*y3+c;
  v2:=a*x4+b*y4+c;
  if v1*v2 <= 0 then
    DistLLS:=0
  else
    DistLLS:=MinDouble(DistToLine(x3,y3,a,b,c),DistToLine(x4,y4,a,b,c));
end;

Function DistLL(x1,y1,x2,y2,x3,y3,x4,y4: Integer): Double;
Var
  a,b,c: Integer;
Begin
  if Vect(x1,y1,x2,y2,x3,y3,x4,y4) <> 0 then
    DistLL:=0
  else
    Begin
      a:=y2-y1;
      b:=x1-x2;
      c:=-a*x1-b*y1;
      DistLL:=DistToLine(x3,y3,a,b,c);
    end;
end;

Begin
  ReadLn(x1,y1,x2,y2,S1);
  ReadLn(x3,y3,x4,y4,S2);
  S1:=Trim(S1);
  S2:=Trim(S2);
  While (S1 <> 'END') or (S2 <> 'END') do
    Begin
      if S1 = 'LS' then
        Swap;
      if S1 = 'L' then
        if S2 = 'L' then
          WriteLn(DistLL(x1,y1,x2,y2,x3,y3,x4,y4):0:5)
        else
          WriteLn(DistLLS(x1,y1,x2,y2,x3,y3,x4,y4):0:5)
      else
        WriteLn(DistLSLS(x1,y1,x2,y2,x3,y3,x4,y4):0:5);
      ReadLn(x1,y1,x2,y2,S1);
      ReadLn(x3,y3,x4,y4,S2);
      S1:=Trim(S1);
      S2:=Trim(S2);
    end;
end.