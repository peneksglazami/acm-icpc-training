{Problem: 3581 - Doors and Penguins
 ACM ICPC - North America - Rocky Mountain - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3581;
{$APPTYPE CONSOLE}
const
  MaxP = 500;

type
  Point = Record
    x,y: Integer;
  end;

  ConvexHull = array [1..4*MaxP] of Point;

var
  pp,dd: array [1..4*MaxP] of Point;
  a,b: ConvexHull;
  i,j,D,P,DA,PA,x1,x2,y1,y2,n_case: Integer;
  Ok: Boolean;

procedure ReadData;
var
  i,x1,x2,y1,y2: Integer;
begin
  for i:=1 to D do
    begin
      ReadLn(x1,y1,x2,y2);
      dd[4*i-3].x:=x1;
      dd[4*i-3].y:=y1;
      dd[4*i-2].x:=x2;
      dd[4*i-2].y:=y1;
      dd[4*i-1].x:=x1;
      dd[4*i-1].y:=y2;
      dd[4*i].x:=x2;
      dd[4*i].y:=y2;
    end;
  for i:=1 to P do
    begin
      ReadLn(x1,y1,x2,y2);
      pp[4*i-3].x:=x1;
      pp[4*i-3].y:=y1;
      pp[4*i-2].x:=x2;
      pp[4*i-2].y:=y1;
      pp[4*i-1].x:=x1;
      pp[4*i-1].y:=y2;
      pp[4*i].x:=x2;
      pp[4*i].y:=y2;
    end;
end;

function Vect(p1,p2,p3,p4: Point): Integer;
begin
  Vect:=(p2.x-p1.x)*(p4.y-p3.y)-(p2.y-p1.y)*(p4.x-p3.x);
end;

function Dist2(p1,p2: Point): Integer;
begin
  Dist2:=Sqr(p2.x-p1.x)+Sqr(p2.y-p1.y);
end;

procedure JarvesD;
var
  i,m,k: Integer;
begin
  m:=1;
  for i:=2 to 4*D do
    if (dd[i].x > dd[m].x) or
       ((dd[i].x = dd[m].x) and (dd[i].y > dd[m].y)) then
         m:=i;
  a[1]:=dd[m];
  dd[m]:=dd[1];
  dd[1]:=a[1];
  m:=2;
  k:=1;
  repeat
    for i:=2 to 4*D do
      if (Vect(a[k],dd[m],a[k],dd[i]) < 0) or
         ((Vect(a[k],dd[m],a[k],dd[i]) = 0) and
          (Dist2(a[k],dd[m]) < Dist2(a[k],dd[i]))) then
            m:=i;
    inc(k);
    a[k]:=dd[m];
    m:=1;
  until (a[1].x = a[k].x) and (a[1].y = a[k].y);
  DA:=k;
end;

procedure JarvesP;
var
  i,m,k: Integer;
begin
  m:=1;
  for i:=2 to 4*P do
    if (pp[i].x > pp[m].x) or
       ((pp[i].x = pp[m].x) and (pp[i].y > pp[m].y)) then
         m:=i;
  b[1]:=pp[m];
  pp[m]:=pp[1];
  pp[1]:=b[1];
  m:=2;
  k:=1;
  repeat
    for i:=2 to 4*P do
      if (Vect(b[k],pp[m],b[k],pp[i]) < 0) or
         ((Vect(b[k],pp[m],b[k],pp[i]) = 0) and
          (Dist2(b[k],pp[m]) < Dist2(b[k],pp[i]))) then
            m:=i;
    inc(k);
    b[k]:=pp[m];
    m:=1;
  until (b[1].x = b[k].x) and (b[1].y = b[k].y);
  PA:=k;
end;

function Inside(const a: ConvexHull; size: Integer; p: Point): Boolean;
var
  i: Integer;
begin
  Result:=False;
  for i:=1 to size-1 do
    if Vect(a[i],a[i+1],a[i],p) < 0 then
      Exit;
  Result:=True;
end;

function max(a,b: Integer): Integer;
begin
  if a > b then
    max:=a
  else
    max:=b;
end;

function min(a,b: Integer): Integer;
begin
  if a < b then
    min:=a
  else
    min:=b;
end;

function IntersectSegment(p1,p2,p3,p4: Point): Boolean;
var
  v1,v2,v3,v4: Integer;
  xmin1,ymin1,xmax1,ymax1,xmin2,ymin2,xmax2,ymax2: Integer;
begin
  xmin1:=min(p1.x,p2.x);
  xmax1:=max(p1.x,p2.x);
  ymin1:=min(p1.y,p2.y);
  ymax1:=max(p1.y,p2.y);
  xmin2:=min(p3.x,p4.x);
  xmax2:=max(p3.x,p4.x);
  ymin2:=min(p3.y,p4.y);
  ymax2:=max(p3.y,p4.y);
  v1:=Vect(p1,p2,p1,p3);
  v2:=Vect(p1,p2,p1,p4);
  v3:=Vect(p3,p4,p3,p1);
  v4:=Vect(p3,p4,p3,p2);
  if v1 <> 0 then
    v1:=v1 div abs(v1);
  if v2 <> 0 then
    v2:=v2 div abs(v2);
  if v3 <> 0 then
    v3:=v3 div abs(v3);
  if v4 <> 0 then
    v4:=v4 div abs(v4);
  Result:=(xmax1 >= xmin2) and (ymax1 >= ymin2) and
          (xmax2 >= xmin1) and (ymax2 >= ymin1) and
          (v1*v2 <= 0) and (v3*v4 <=0);
end;

function Intersect: Boolean;
var
  i,j: Integer;
begin
  Result:=True;
  for i:=1 to DA-1 do
    if Inside(b,PA,a[i]) then
      Exit;
  for i:=1 to PA-1 do
    if Inside(a,DA,b[i]) then
      Exit;
  for i:=1 to DA-1 do
    for j:=1 to PA-1 do
      if IntersectSegment(a[i],a[i+1],b[j],b[j+1]) then
        Exit;
  Result:=False;
end;

begin
  n_case:=0;
  ReadLn(D,P);
  while (D <> 0) or (P <> 0) do
    begin
      ReadData;
      JarvesP;
      JarvesD;
      inc(n_case);
      if not Intersect then
        WriteLn('Case ',n_case,': It is possible to separate the two groups of vendors.')
      else
        WriteLn('Case ',n_case,': It is not possible to separate the two groups of vendors.');
      ReadLn(D,P);
      if (D <> 0) or (P <> 0) then
        WriteLn;
    end;
end.