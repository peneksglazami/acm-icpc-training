{Problem: 218 - Moth Eradication
 ACM ICPC World Finals - 1992 - Problem D
 Solved by Andrey Grigorov}

{$A+,B-,D+,E+,F-,G-,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem218 (input, output);
Const
  MaxN = 5000;

Type
  Point = Record
    X,Y: Double;
   end;

Var
  a,b,c: Array [1..MaxN] of Point;
  p: Array [1..MaxN] of Boolean;
  i,j,N,min,m,k,g,n_case: Integer;
  Per: Double;
  buf: Point;

Function Vect(a1,a2,b1,b2: Point): Double;
Begin
  Vect:=(a2.x-a1.x)*(b2.y-b1.y)-(a2.y-a1.y)*(b2.x-b1.x);
end;

Function Dist2(a1,a2: Point): Double;
Begin
  Dist2:=Sqr(a2.x-a1.x)+Sqr(a2.y-a1.y);
end;

Function Scalar(a1,a2,b1,b2: Point): Double;
Begin
  Scalar:=(a2.x-a1.x)*(b2.x-b1.x)+(a2.y-a1.y)*(b2.y-b1.y);
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(p,SizeOf(p),True);
      for i:=1 to N do
        ReadLn(a[i].x,a[i].y);
      m:=1;
      for i:=2 to N do
        if (a[i].x < a[m].x) or ((a[i].x = a[m].x) and (a[i].y < a[m].y)) then
          m:=i;
      b[1]:=a[m];
      a[m]:=a[1];
      a[1]:=b[1];
      k:=1;
      min:=2;
      Repeat
        for i:=2 to N do
          Begin
            if (vect(b[k],a[min],b[k],a[i]) > 0) or
              ((vect(b[k],a[min],b[k],a[i]) = 0) and
               (dist2(b[k],a[min]) < dist2(b[k],a[i]))) then
                 min:=i;
          end;
        g:=0;
        for i:=1 to N do
          if p[i] and (vect(b[k],a[min],b[k],a[i]) = 0) and (i <> min) and
             (Scalar(b[k],a[min],b[k],a[i]) > 0) then
            Begin
              Inc(g);
              c[g]:=a[i];
              p[i]:=False;
            end;
        for i:=1 to g-1 do
          for j:=i+1 to g do
            if dist2(b[k],c[i]) > dist2(b[k],c[j]) then
              Begin
                buf:=c[i];
                c[i]:=c[j];
                c[j]:=buf;
              end;
        for i:=1 to g do
          Begin
            Inc(k);
            b[k]:=c[i];
          end;
        Inc(k);
        b[k]:=a[min];
        p[min]:=False;
        min:=1;
      Until (b[1].x = b[k].x) and (b[1].y = b[k].y);
      Inc(n_case);
      WriteLn('Region #',n_case,':');
      Write('(',b[1].x:0:1,',',b[1].y:0:1,')');
      Per:=0;
      for i:=2 to K do
        Begin
          Write('-(',b[i].x:0:1,',',b[i].y:0:1,')');
          Per:=Per+Sqrt(Dist2(b[i],b[i-1]));
        end;
      WriteLn;
      WriteLn('Perimeter length = ',Per:0:2);
      ReadLn(N);
      if N <> 0 then
        WriteLn;
    end;
end.