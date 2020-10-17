{Problem: 2827 - Phone Home
 Problem D - ACM ICPC 2003-2004 Northen America - East Central Region
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2827;
Const
  Approx = 10e-10;
  MaxN = 12;

Type
  SSet = Set of 1..MaxN*2+1;

Var
  a: Array [1..MaxN,1..MaxN] of Boolean;
  b,g,gg: Array [1..MaxN] of Integer;
  m: Array [1..MaxN] of SSet;
  col: Array [1..MaxN] of Integer;
  x,y: Array [1..MaxN] of Double;
  i,j,f,max,N,color,n_case,group: Integer;
  find: Boolean;

Function Dist(x1,y1,x2,y2: Double): Double;
Begin
  Dist:=Sqrt(Sqr(x2-x1)+Sqr(y2-y1));
end;

Procedure Mark(i,c: Integer);
Var
  j: Integer;
Begin
  g[i]:=c;
  Inc(gg[c]);
  for j:=1 to N do
    if (g[j] = 0) and a[i,j] then
      Mark(j,c);
end;

Procedure Fill(nm,v,c: Integer);
Var
  i: Integer;
Begin
  if nm > max then
    max:=nm;
  b[v]:=col[c];
  for i:=1 to N do
    if a[v,i] and (b[i] = 0) then
      m[i]:=m[i]-[c];
  for i:=1 to N do
    if a[v,i] and (b[i] = 0) then
      for j:=1 to color do
        if col[j] in m[i] then
          Fill(nm+1,i,col[j]);
  for i:=1 to N do
    if a[v,i] and (b[i] = 0) then
      m[i]:=m[i]+[c];
  b[v]:=0;
end;

Begin
  col[1]:=1;
  for i:=2 to MaxN do
   col[i]:=col[i-1]+2;
  ReadLn(N);
  n_case:=0;
  While N <> 0 do
    Begin
      for i:=1 to N do
        Read(x[i],y[i]);
      ReadLn;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          Begin
            a[i,j]:=Dist(x[i],y[i],x[j],y[j]) <= 20+Approx;
            a[j,i]:=a[i,j];
          end;
      FillChar(g,SizeOf(g),0);
      FillChar(gg,SizeOf(gg),0);
      group:=0;
      for i:=1 to N do
        if g[i] = 0 then
          Begin
            Inc(group);
            Mark(i,group);
          end;
      color:=0;
      Repeat
        Inc(color);
        max:=0;
        for i:=1 to N do
          Begin
            m[i]:=[];
            for j:=1 to color do
              m[i]:=m[i]+[col[j]];
          end;
        find:=True;
        for i:=1 to group do
          Begin
            max:=0;
            for j:=1 to N do
              if g[j] = i then
                Begin
                  Fill(1,j,col[1]);
                  Break;
                end;
            find:=(gg[i] = max);
            if not find then
              Break;
          end;
      Until find;
      Inc(n_case);
      WriteLn('The towers in case ',n_case,' can be covered in ',color,' frequencies.');
      ReadLn(N);
    end;
end.