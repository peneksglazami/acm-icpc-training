{Problem: 273 - Jack Straws
 East Central Regionals - 1994 - Problem D
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem273 (input,output);
Var
  D: Array [1..13,1..13] of Boolean;
  P: Array [1..13] of Record x1,y1,x2,y2: Integer; end;
  i,j,m,N,a,b,Test: Integer;

Function Vect(a1,b1,a2,b2: Integer): Integer;
Begin
  Vect:=a1*b2-a2*b1;
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

Function Intersect(i,j: Integer): Boolean;
Var
  x1min,x1max,y1min,y1max,x2min,x2max,y2min,y2max,v1,v2,v3,v4: Integer;
Begin
  x1min:=Min(p[i].x1,p[i].x2);
  y1min:=Min(p[i].y1,p[i].y2);
  x1max:=Max(p[i].x1,p[i].x2);
  y1max:=Max(p[i].y1,p[i].y2);
  x2min:=Min(p[j].x1,p[j].x2);
  y2min:=Min(p[j].y1,p[j].y2);
  x2max:=Max(p[j].x1,p[j].x2);
  y2max:=Max(p[j].y1,p[j].y2);
  v1:=Vect(p[i].x2-p[i].x1,p[i].y2-p[i].y1,p[j].x1-p[i].x1,p[j].y1-p[i].y1);
  v2:=Vect(p[i].x2-p[i].x1,p[i].y2-p[i].y1,p[j].x2-p[i].x1,p[j].y2-p[i].y1);
  v3:=Vect(p[j].x2-p[j].x1,p[j].y2-p[j].y1,p[i].x1-p[j].x1,p[i].y1-p[j].y1);
  v4:=Vect(p[j].x2-p[j].x1,p[j].y2-p[j].y1,p[i].x2-p[j].x1,p[i].y2-p[j].y1);
  Intersect:=(v1*v2 <= 0) and (v3*v4 <= 0) and
             (x1max >= x2min) and (x2max >= x1min) and
             (y1max >= y2min) and (y2max >= y1min);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn;
      ReadLn(N);
      for i:=1 to N do
        With P[i] do
          ReadLn(x1,y1,x2,y2);
      for i:=1 to N do
        for j:=i to N do
          Begin
            D[i,j]:=Intersect(i,j);
            D[j,i]:=D[i,j];
          end;
      for m:=1 to N do
        for i:=1 to N do
          for j:=1 to N do
            D[i,j]:=D[i,j] or (D[i,m] and D[m,j]);
      ReadLn(a,b);
      While (a <> 0) or (b <> 0) do
        Begin
          if D[a,b] then
            WriteLn('CONNECTED')
          else
            WRiteLn('NOT CONNECTED');
          ReadLn(a,b);
        end;
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.