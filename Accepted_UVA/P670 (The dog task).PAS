{Problem: The dog task
 Author: Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem670 (input,output);
Const
  Approx = 10e-10;

Type
  Point = Record
    x,y: LongInt;
   end;

Var
  a: Array [1..100,1..100] of Boolean;
  v: Array [1..100] of Boolean;
  p,q: Array [1..100] of Integer;
  pp,mm: Array [1..100] of Point;
  i,j,N,M,max,Test: Integer;

Function Dist(p1,p2: Point): Double;
Begin
  Dist:=Sqrt(Sqr(p2.x-p1.x)+Sqr(p2.y-p1.y));
end;

Function TryFind(i: Integer): Boolean;
Var
  j: Integer;
Begin
  TryFind:=False;
  if v[i] then
    Exit;
  v[i]:=True;
  for j:=1 to M do
    if a[i,j] and ((p[j] = 0) or TryFind(p[j])) then
      Begin
        TryFind:=True;
        p[j]:=i;
        q[i]:=j;
        Exit;
      end;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      FillChar(a,SizeOf(a),False);
      FillChar(p,SizeOf(p),0);
      FillChar(q,SizeOf(q),0);
      ReadLn;
      ReadLn(N,M);
      for i:=1 to N do
        Read(pp[i].x,pp[i].y);
      ReadLn;
      for i:=1 to M do
        Read(mm[i].x,mm[i].y);
      for i:=1 to N-1 do
        for j:=1 to M do
          a[i,j]:=2*Dist(pp[i],pp[i+1])+Approx >= Dist(pp[i],mm[j])+Dist(pp[i+1],mm[j]);
      max:=0;
      for i:=1 to N do
        Begin
          FillChar(v,SizeOf(v),False);
          if TryFind(i) then
            Inc(max);
        end;
      WriteLn(N+max);
      for i:=1 to N-1 do
        Begin
          Write(pp[i].x,' ',pp[i].y,' ');
          if q[i] <> 0 then
            Write(mm[q[i]].x,' ',mm[q[i]].y,' ');
        end;
      WriteLn(pp[N].x,' ',pp[N].y);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.