{ACM ICPC 2003-2004 Northeastern European Regional Contest
 Problem F - Farmer Bill's Problem
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program ProblemF;
{$APPTYPE CONSOLE}
Type
  Rectangle = Record
    x1,x2,y1,y2: Integer;
   end;

Var
  A: Array [1..100] of Rectangle;
  used: Array [1..100] of Boolean;
  i,j,N,maxX,maxY,x,y,r,S: Integer;
  Ok: Boolean;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function Overlap(A,B: Rectangle): Boolean;
Begin
  if (A.x1 >= B.x1) and (A.x1 <= B.x2) and
     (A.y1 >= B.y1) and (A.y1 <= B.y2) then
       Begin
         Result:=True;
         Exit;
       end;
  if (A.x1 >= B.x1) and (A.x1 <= B.x2) and
     (A.y2 >= B.y1) and (A.y2 <= B.y2) then
       Begin
         Result:=True;
         Exit;
       end;
  if (A.x2 >= B.x1) and (A.x2 <= B.x2) and
     (A.y1 >= B.y1) and (A.y1 <= B.y2) then
       Begin
         Result:=True;
         Exit;
       end;
  if (A.x2 >= B.x1) and (A.x2 <= B.x2) and
     (A.y2 >= B.y1) and (A.y2 <= B.y2) then
       Begin
         Result:=True;
         Exit;
       end;
  Result:=False;
end;

Begin
  While not EOF do
    Begin
      Read(maxX,maxY);
      Read(N);
      for i:=1 to N do
        Begin
          Read(x,y,r);
          With A[i] do
            Begin
              x1:=x-r;
              x2:=x+r;
              y1:=y-r;
              y2:=y+r;
              used[i]:=False;
            end;
        end;
      Ok:=True;
      While Ok do
        Begin
          Ok:=False;
          for i:=1 to N-1 do
            if not used[i] then
              for j:=i+1 to N do
                if not used[j] then
                  if Overlap(A[i],A[j]) or Overlap(A[j],A[i]) then
                    Begin
                      A[i].x1:=Min(A[i].x1,A[j].x1);
                      A[i].x2:=Max(A[i].x2,A[j].x2);
                      A[i].y1:=Min(A[i].y1,A[j].y1);
                      A[i].y2:=Max(A[i].y2,A[j].y2);
                      used[j]:=True;
                      Ok:=True;
                    end;
        end;
      S:=0;
      for i:=1 to N do
        if not used[i] then
          S:=S+(A[i].x2-A[i].x1)*(A[i].y2-A[i].y1);
      WriteLn(maxX*maxY-S);
    end;
end.