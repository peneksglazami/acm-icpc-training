{Problem: 2831 - This Takes the Cake
 Problem H - ACM ICPC 2003-2004 North America - East Central Region
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2831 (input,output);
Type
  Point = Record
    x,y: Double;
   end;

Var
  p: Array [1..8] of Point;
  Cake: Array [1..8] of Point;
  s1,s2,S: Double;
  i,j,g,nc,n_case: Integer;

Function Max(a,b: Double): Double;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Function Min(a,b: Double): Double;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function next(i,n: Integer): Integer;
Begin
  if i < n then
    next:=i+1
  else
    next:=1;
end;

Function Square(n: Integer): Double;
Var
  i: Integer;
  S: Double;
Begin
  S:=0;
  for i:=1 to n do
    S:=S+(Cake[i].x*Cake[next(i,n)].y-Cake[next(i,n)].x*Cake[i].y);
  Square:=Abs(S/2);
end;

Begin
  n_case:=0;
  ReadLn(p[1].x,p[1].y,p[3].x,p[3].y,p[5].x,p[5].y,p[7].x,p[7].y);
  While (p[1].x <> 0) or (p[1].y <> 0) or (p[3].x <> 0) or (p[3].y <> 0) or
        (p[5].x <> 0) or (p[5].y <> 0) or (p[7].x <> 0) or (p[7].y <> 0) do
          Begin
            p[2].x:=(p[1].x+p[3].x)/2;
            p[2].y:=(p[1].y+p[3].y)/2;
            p[4].x:=(p[3].x+p[5].x)/2;
            p[4].y:=(p[3].y+p[5].y)/2;
            p[6].x:=(p[5].x+p[7].x)/2;
            p[6].y:=(p[5].y+p[7].y)/2;
            p[8].x:=(p[1].x+p[7].x)/2;
            p[8].y:=(p[1].y+p[7].y)/2;
            Cake[1]:=p[1];
            Cake[2]:=p[3];
            Cake[3]:=p[5];
            Cake[4]:=p[7];
            nc:=4;
            S:=Square(nc);
            s1:=S;
            s2:=0;
            for i:=1 to 6 do
              for j:=i+2 to 8 do
                if (next(j,8) <> i) then
                  Begin
                    nc:=0;
                    for g:=i to j do
                      Begin
                        Inc(nc);
                        Cake[nc]:=p[g];
                      end;
                    if Abs(S-2*Square(nc)) < Abs(S1-S2) then
                      Begin
                        S1:=Square(nc);
                        S2:=S-S1;
                      end;
                  end;
            Inc(n_case);
            WriteLn('Cake ',n_case,': ',Min(S1,S2):0:3,' ',Max(S1,S2):0:3);
            ReadLn(p[1].x,p[1].y,p[3].x,p[3].y,p[5].x,p[5].y,p[7].x,p[7].y);
          end;
end.