{Problem: 10112 - Myacm Triangles
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10112 (input,output);
Type
  Point = Record
    x,y: Integer;
   end;

Var
  a: Array ['A'..'O'] of Point;
  i,j,N,Max: Integer;
  Ch,Ch1,Ch2,Ch3,Ch4: Char;
  St: String;
  Ok: Boolean;

Function Vect(p1,p2,p3,p4: Point): Integer;
Begin
  Vect:=(p2.x-p1.x)*(p4.y-p3.y)-(p2.y-p1.y)*(p4.x-p3.x);
end;

Function S(p1,p2,p3: Point): Integer;
Begin
  S:=Abs(Vect(p1,p2,p1,p3));
end;

Function InTriangle(p,p1,p2,p3: Point): Boolean;
Var
  v1,v2: Boolean;
Begin
  v1:=False;
  v2:=False;
  if Vect(p1,p,p1,p2) > 0 then
    v1:=True
  else
    if Vect(p1,p,p1,p2) < 0 then
      v2:=True;
  if Vect(p2,p,p2,p3) > 0 then
    v1:=True
  else
    if Vect(p2,p,p2,p3) < 0 then
      v2:=True;
  if Vect(p3,p,p3,p1) > 0 then
    v1:=True
  else
    if Vect(p3,p,p3,p1) < 0 then
      v2:=True;
  InTriangle:=not (v1 and v2);
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      for i:=1 to N do
        Begin
          Read(Ch);
          ReadLn(a[Ch].x,a[Ch].y);
        end;
      Max:=0;
      for Ch1:='A' to Chr(Ord('A')+N-3) do
        for Ch2:=Chr(Ord(Ch1)+1) to Chr(Ord('A')+N-2) do
          for Ch3:=Chr(Ord(Ch2)+1) to Chr(Ord('A')+N-1) do
            Begin
              Ok:=True;
              for Ch4:='A' to Chr(Ord('A')+N-1) do
                if (Ch4 <> Ch1) and (Ch4 <> Ch2) and (Ch4 <> Ch3) then
                  Ok:=Ok and (not InTriangle(a[Ch4],a[Ch1],a[Ch2],a[Ch3]));
              if Ok then
                if S(a[Ch1],a[Ch2],a[Ch3]) > Max then
                  Begin
                    Max:=S(a[Ch1],a[Ch2],a[Ch3]);
                    St:=Ch1+Ch2+Ch3;
                  end;
            end;
      WriteLn(St);
      ReadLn(N);
    end;
end.