{ACM ICPC 2004-2004, Northeastern European Regional Contest
 Problem B - Box
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem3214;
{$APPTYPE CONSOLE}
Type
  Rect = Record
    h,w: Integer;
    Ok: Boolean;
   end;

Var
  A: Array [1..6] of Rect;
  B: Array [1..6] of Rect;
  i,j,Change,RAmount: Integer;
  Yes: Boolean;

Begin
  While not EOF do
    Begin
      for i:=1 to 6 do
        Begin
          ReadLn(A[i].w,A[i].h);
          if A[i].h < A[i].w then
            Begin
              Change:=A[i].h;
              A[i].h:=A[i].w;
              A[i].w:=Change;
            end;
          A[i].Ok:=True;
        end;
      RAmount:=0;
      for i:=1 to 5 do
        for j:=i+1 to 6 do
          if A[i].Ok and A[j].Ok then
            if (A[i].h = A[j].h) and (A[i].w = A[j].w) then
              Begin
                A[i].Ok:=False;
                A[j].Ok:=False;
                Inc(RAmount);
                B[RAmount]:=A[i];
              end;
      Yes:=True;
      for i:=1 to 6 do
        if A[i].Ok then
          Yes:=False;
      if (RAmount = 3) and Yes then
        Yes:=((B[1].h = B[2].h) and (B[1].w = B[3].h) and (B[2].w = B[3].w))
          or ((B[1].h = B[2].w) and (B[1].w = B[3].h) and (B[2].h = B[3].w))
          or ((B[1].w = B[2].h) and (B[1].h = B[3].h) and (B[2].w = B[3].w))
          or ((B[1].w = B[2].w) and (B[1].h = B[3].h) and (B[2].h = B[3].w))
          or ((B[1].h = B[2].h) and (B[1].w = B[3].w) and (B[2].w = B[3].h))
          or ((B[1].h = B[2].w) and (B[1].w = B[3].w) and (B[2].h = B[3].h))
          or ((B[1].w = B[2].h) and (B[1].h = B[3].w) and (B[2].w = B[3].h))
          or ((B[1].w = B[2].w) and (B[1].h = B[3].w) and (B[2].h = B[3].h));
      if Yes then
        WriteLn('POSSIBLE')
      else
        WriteLn('IMPOSSIBLE');
    end;
end.