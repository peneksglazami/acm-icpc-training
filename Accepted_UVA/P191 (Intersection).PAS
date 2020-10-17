{Problem: 191 - Intersection
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem191 (input,output);
Var
  buf,N,x1,y1,x2,y2,xr1,yr1,xr2,yr2: Integer;
  Ok: Boolean;

Function Vect(p1x1,p1y1,p1x2,p1y2,p2x1,p2y1,p2x2,p2y2: Integer): Integer;
Begin
  Vect:=(p1x2-p1x1)*(p2y2-p2y1)-(p2x2-p2x1)*(p1y2-p1y1);
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

Function Intersect(p1x1,p1y1,p1x2,p1y2,p2x1,p2y1,p2x2,p2y2: Integer): Boolean;
Var
  x1max,x1min,y1max,y1min,x2max,x2min,y2max,y2min,v1,v2,v3,v4: Integer;
Begin
  x1min:=Min(p1x1,p1x2);
  x1max:=Max(p1x1,p1x2);
  y1min:=Min(p1y1,p1y2);
  y1max:=Max(p1y1,p1y2);
  x2min:=Min(p2x1,p2x2);
  x2max:=Max(p2x1,p2x2);
  y2min:=Min(p2y1,p2y2);
  y2max:=Max(p2y1,p2y2);
  v1:=Vect(p1x1,p1y1,p1x2,p1y2,p1x1,p1y1,p2x1,p2y1);
  v2:=Vect(p1x1,p1y1,p1x2,p1y2,p1x1,p1y1,p2x2,p2y2);
  v3:=Vect(p2x1,p2y1,p2x2,p2y2,p2x1,p2y1,p1x1,p1y1);
  v4:=Vect(p2x1,p2y1,p2x2,p2y2,p2x1,p2y1,p1x2,p1y2);
  Intersect:=(x1max >= x2min) and (y1max >= y2min) and
             (x2max >= x1min) and (y2max >= y1min) and
             (v1*v2 <= 0) and (v3*v4 <= 0);
end;

Function InRectangle(x1,y1,x2,y2,xr1,yr1,xr2,yr2: Integer): Boolean;
Begin
  InRectangle:=((x1 >= xr1) and (x1 <= xr2) and (y1 >= yr2) and (y1 <= yr1)) or
               ((x2 >= xr1) and (x2 <= xr2) and (y2 >= yr2) and (y2 <= yr1));
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(x1,y1,x2,y2,xr1,yr1,xr2,yr2);
      if xr1 >= xr2 then
        Begin
          buf:=xr1;
          xr1:=xr2;
          xr2:=buf;
        end;
      if yr1 <= yr2 then
        Begin
          buf:=yr1;
          yr1:=yr2;
          yr2:=buf;
        end;
      Ok:=Intersect(x1,y1,x2,y2,xr1,yr1,xr1,yr2) or
          Intersect(x1,y1,x2,y2,xr1,yr1,xr2,yr1) or
          Intersect(x1,y1,x2,y2,xr1,yr2,xr2,yr2) or
          Intersect(x1,y1,x2,y2,xr2,yr1,xr2,yr2) or
          InRectangle(x1,y1,x2,y2,xr1,yr1,xr2,yr2);
      if Ok then
        WriteLn('T')
      else
        WriteLn('F');
      Dec(N);
    end;
end.