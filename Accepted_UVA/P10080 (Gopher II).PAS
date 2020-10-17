{Problem: 10080 - Gopher II
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10080 (input,output);
Const
  Approx = 10e-10;

Type
  Point = Record
    x,y: Double;
   end;

Var
  a: Array [1..100,1..100] of Boolean;
  p: Array [1..100] of Integer;
  b: Array [1..100] of Boolean;
  g,h: Array [1..100] of Point;
  i,j,n,m,s,v,max: Integer;

Function Dist(p1,p2: Point): Double;
Begin
  Dist:=Sqrt(Sqr(p2.x-p1.x)+Sqr(p2.y-p1.y));
end;

Function TryFind(i: Integer): Boolean;
Var
  j: Integer;
Begin
  TryFind:=False;
  if (i = 0) or b[i] then
    Exit;
  b[i]:=True;
  for j:=1 to m do
    if a[i,j] and ((p[j] = 0) or TryFind(p[j])) then
      Begin
        TryFind:=True;
        p[j]:=i;
        Exit;
      end;
end;

Begin
  While not EOF do
    Begin
      ReadLn(n,m,s,v);
      for i:=1 to n do
        ReadLn(g[i].x,g[i].y);
      for i:=1 to m do
        ReadLn(h[i].x,h[i].y);
      FillChar(a,SizeOf(a),False);
      for i:=1 to n do
        for j:=1 to m do
          a[i,j]:=Dist(g[i],h[j])/v <= s+Approx;
      FillChar(p,SizeOf(p),0);
      max:=0;
      for i:=1 to n do
        Begin
          FillChar(b,SizeOf(b),False);
          if TryFind(i) then
            Inc(max);
        end;
      WriteLn(N-max);
    end;
end.