{Problem: 303 - Pipe
 Central European Regionals - 1995 - Problem D
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem303 (input,output);
Const
  Approx = 10e-10;
  MaxN = 20;

Var
  p: Array [1..2*MaxN] of Record x,y: Double end;
  x1,y1,x2,y2: Array [1..MaxN+1] of Double;
  i,j,g,N: Integer;
  a,b,c,a2,b2,c2,d,d1,maxX,maxXX: Double;

Function Vect(a1,b1,a2,b2: Double): Double;
Begin
  Vect:=a1*b2-a2*b1;
end;

Function Intersect(a,b,c,x1,y1,x2,y2: Double): Boolean;
Begin
  Intersect:=(a*x1+b*y1+c)*(a*x2+b*y2+c) <= Approx;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        Begin
          ReadLn(x1[i],y1[i]);
          x2[i]:=x1[i];
          y2[i]:=y1[i]-1;
          p[2*i-1].x:=x1[i];
          p[2*i-1].y:=y1[i];
          p[2*i].x:=x2[i];
          p[2*i].y:=y2[i];
        end;
      maxXX:=x1[1];
      for i:=1 to 2*N-1 do
        for j:=i+1 to 2*N do
          Begin
            a:=p[j].y-p[i].y;
            b:=p[i].x-p[j].x;
            c:=-a*p[i].x-b*p[i].y;
            g:=1;
            While (g <= N) and Intersect(a,b,c,x1[g],y1[g],x2[g],y2[g]) do
              Inc(g);
            if g > N then
              maxX:=x1[N]
            else
              if g > 1 then
                Begin
                  maxX:=x1[g-1];
                  if Intersect(a,b,c,x1[g-1],y1[g-1],x1[g],y1[g]) then
                    Begin
                      a2:=y1[g]-y1[g-1];
                      b2:=x1[g-1]-x1[g];
                      c2:=-a2*x1[g]-b2*y1[g];
                      d:=a*b2-b*a2;
                      d1:=-c*b2+c2*b;
                      if d1/d > maxX then
                        maxX:=d1/d;
                    end;
                  if Intersect(a,b,c,x2[g-1],y2[g-1],x2[g],y2[g]) then
                    Begin
                      a2:=y2[g]-y2[g-1];
                      b2:=x2[g-1]-x2[g];
                      c2:=-a2*x2[g]-b2*y2[g];
                      d:=a*b2-b*a2;
                      d1:=-c*b2+c2*b;
                      if d1/d > maxX then
                        maxX:=d1/d;
                    end;
                end
              else
                maxX:=x1[1];
            if maxXX < maxX then
              maxXX:=maxX;
          end;
      if maxXX = x1[N] then
        WriteLn('Through all the pipe.')
      else
        WriteLn(maxXX:0:2);
      ReadLn(N);
    end;
end.