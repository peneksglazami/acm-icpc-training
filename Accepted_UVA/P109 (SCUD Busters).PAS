{Problem: 109 - SCUD Busters
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem109 (input,output);
Type
  Point = Record
    x,y: LongInt;
   end;

Var
  k: Array [1..20,1..100] of Point;
  pp: Array [1..20] of Integer;
  a,b: Array [1..100] of Point;
  mm: Array [1..20] of Boolean;
  i,j,g,m,kkk,kk,N,x,y: LongInt;
  S: Double;

Function Vect(p1,p2,p3,p4: Point): LongInt;
Begin
  Vect:=(p2.x-p1.x)*(p4.y-p3.y)-(p2.y-p1.y)*(p4.x-p3.x);
end;

Function Dist2(p1,p2: Point): LongInt;
Begin
  Dist2:=Sqr(p2.x-p1.x)+Sqr(p2.y-p1.y);
end;

Function Next(i,ii: Integer): Integer;
Begin
  if i = pp[ii] then
    Next:=1
  else
    Next:=i+1;
end;

Function InKingdom(ii: Integer; x,y: LongInt): Boolean;
Var
  i: Integer;
  Ok: Boolean;
  p: Point;
Begin
  Ok:=True; p.x:=x; p.y:=y;
  for i:=1 to pp[ii] do
    Ok:=Ok and (Vect(k[ii][i],p,k[ii][i],k[ii][next(i,ii)]) <= 0);
  InKingdom:=Ok;
end;

Function Square(ii: Integer): Double;
Var
  i: Integer;
  S: Double;
  p: Point;
Begin
  S:=0; p.x:=0; p.y:=0;
  for i:=1 to pp[ii] do
    S:=S+Vect(p,k[ii][i],p,k[ii][next(i,ii)]);
  Square:=Abs(S)/2;
end;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      Inc(kk);
      m:=1;
      for i:=1 to N do
        Begin
          ReadLn(a[i].x,a[i].y);
          if (a[m].x < a[i].x) or ((a[m].x = a[i].x) and (a[m].y > a[i].y)) then
            m:=i;
        end;
      b[1]:=a[m];
      a[m]:=a[1];
      a[1]:=b[1];
      kkk:=1;
      m:=2;
      Repeat
        for i:=2 to N do
          if (Vect(b[kkk],a[m],b[kkk],a[i]) < 0) or
             ((Vect(b[kkk],a[m],b[kkk],a[i]) = 0) and
              (Dist2(b[kkk],a[m]) < Dist2(b[kkk],a[i]))) then
                m:=i;
        Inc(kkk);
        b[kkk]:=a[m];
        m:=1;
      Until (b[1].x = b[kkk].x) and (b[1].y = b[kkk].y);
      pp[kk]:=kkk-1;
      for i:=1 to pp[kk] do
        k[kk][i]:=b[i];
      ReadLn(N);
    end;
  FillChar(mm,SizeOf(mm),True);
  While not EOF do
    Begin
      ReadLn(x,y);
      for i:=1 to kk do
        if mm[i] then
          mm[i]:=not InKingdom(i,x,y);
    end;
  S:=0;
  for i:=1 to kk do
    if not mm[i] then
      S:=S+Square(i);
  WriteLn(S:0:2);
end.