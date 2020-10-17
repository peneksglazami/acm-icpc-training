{Problem: 3047 - Squares
 ACM ICPC - North America - Rocky Mountain - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3047;
{$APPTYPE CONSOLE}
Const
  MaxN = 1000;
  MaxV = 20000;

Type
  Point = Record
    x,y: Integer;
   end;

  SS = ^Node;

  Node = Record
    y: Integer;
    next: SS;
   end;

Var
  p: Array [1..MaxN] of Point;
  px: Array [-MaxV..MaxV] of SS;
  i,j,N,cnt,a,b: Integer;
  p3,p4: Point;

Procedure DeleteList(Var p: SS);
Var
  pp: SS;
Begin
  While p <> nil do
    Begin
      pp:=p;
      p:=p^.next;
      Dispose(pp);
    end;
end;

Procedure AddToList(Var p: SS; y: Integer);
Var
  pp: SS;
Begin
  New(pp);
  pp^.y:=y;
  pp^.next:=p;
  p:=pp;
end;

Function Find(p: SS; y: Integer): Boolean;
Var
  pp: SS;
Begin
  Result:=True;
  pp:=p;
  While pp <> nil do
    Begin
      if pp^.y = y then
        Exit;
      pp:=pp^.next;
    end;
  Result:=False;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=-MaxV to MaxV do
        px[i]:=nil;
      for i:=1 to N do
        Begin
          ReadLn(p[i].x,p[i].y);
          AddToList(px[p[i].x],p[i].y);
        end;
      cnt:=0;
      for i:=1 to N do
        for j:=1 to N do
          if i <> j then
            Begin
              a:=p[j].x-p[i].x;
              b:=p[j].y-p[i].y;
              p3.x:=p[i].x+b;
              p3.y:=p[i].y-a;
              p4.x:=p[j].x+b;
              p4.y:=p[j].y-a;
              if Find(px[p3.x],p3.y) and Find(px[p4.x],p4.y) then
                Inc(cnt);
            end;
      WriteLn(cnt div 4);
      for i:=-MaxV to MaxV do
        if px[i] <> nil then
          DeleteList(px[i]);
      ReadLn(N);
    end;
end.