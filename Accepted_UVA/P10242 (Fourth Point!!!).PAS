{Problem: 10242 - Fourth Point!!!
 Problem G - World Finals Warmup (Oriental) Contest
 Problem Source: University of Alberta Local Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10242 (input,output);
Var
  s1,s2: Record x1,y1,x2,y2: Double; end;
  i,j: Integer;
  x,y: Double;

Procedure FindTheSamePoints(Var i,j: Integer);
Begin
  if (s1.x1 = s2.x1) and (s1.y1 = s2.y1) then
    Begin
      i:=1;
      j:=1;
    end;
  if (s1.x1 = s2.x2) and (s1.y1 = s2.y2) then
    Begin
      i:=1;
      j:=2;
    end;
  if (s1.x2 = s2.x1) and (s1.y2 = s2.y1) then
    Begin
      i:=2;
      j:=1;
    end;
  if (s1.x2 = s2.x2) and (s1.y2 = s2.y2) then
    Begin
      i:=2;
      j:=2;
    end;
end;

Procedure Swap(i,j: Integer);
Var
  buf: Double;
Begin
  if i = 2 then
    Begin
      buf:=s1.x1; s1.x1:=s1.x2; s1.x2:=buf;
      buf:=s1.y1; s1.y1:=s1.y2; s1.y2:=buf;
    end;
  if j = 2 then
    Begin
      buf:=s2.x1; s2.x1:=s2.x2; s2.x2:=buf;
      buf:=s2.y1; s2.y1:=s2.y2; s2.y2:=buf;
    end;
end;

Begin
  While not EOF do
    Begin
      ReadLn(s1.x1,s1.y1,s1.x2,s1.y2,s2.x1,s2.y1,s2.x2,s2.y2);
      FindTheSamePoints(i,j);
      Swap(i,j);
      x:=s2.x2+s1.x2-s1.x1;
      y:=s2.y2+s1.y2-s1.y1;
      WriteLn(x:0:3,' ',y:0:3);
    end;
end.