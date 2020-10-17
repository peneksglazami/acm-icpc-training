{Problem: 10301 - Rings and Glue
 Problem B - QWCF Contest 2 - Joint Effort Contest
 Problem Source: Swedish National Programming Contest,
                 arranged by departament of
                 Computer Science at Lund Institute of Technology
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10301 (input,output);
Const
  MaxN = 100;

Type
  Circle = Record
    x,y,r: Double;
   end;

Var
  a: Array [1..MaxN] of Circle;
  m,mm: Array [1..MaxN] of Integer;
  i,j,imax,N: Integer;

Function Dist(x1,y1,x2,y2: Double): Double;
Begin
  Dist:=Sqrt(Sqr(x2-x1)+Sqr(y2-y1));
end;

Function Intersect(i,j: Integer): Boolean;
Var
  d: Double;
Begin
  d:=Dist(a[i].x,a[i].y,a[j].x,a[j].y);
  Intersect:=((d < a[i].r+a[j].r) and (d > Abs(a[i].r-a[j].r))) or
             ((a[i].x = a[j].x) and (a[i].y = a[j].y) and (a[i].r = a[j].r));
end;

Procedure ChangeMark(ll,rr: Integer);
Var
  i,buf: Integer;
Begin
  if ll > rr then
    Begin
      buf:=ll; ll:=rr; rr:=buf;
    end;
  for i:=1 to N do
    if m[i] = rr then
      m[i]:=ll;
end;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      for i:=1 to N do
        ReadLn(a[i].x,a[i].y,a[i].r);
      for i:=1 to N do
        m[i]:=i;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if Intersect(i,j) then
            ChangeMark(m[i],m[j]);
      FillChar(mm,SizeOf(mm),0);
      for i:=1 to N do
        Inc(mm[m[i]]);
      imax:=1;
      for i:=1 to N do
        if mm[imax] < mm[i] then
          imax:=i;
      if mm[imax] <> 1 then
        WriteLn('The largest component contains ',mm[imax],' rings.')
      else
        WriteLn('The largest component contains ',mm[imax],' ring.');
      ReadLn(N);
    end;
end.