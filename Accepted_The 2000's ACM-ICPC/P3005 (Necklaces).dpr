{ACM ICPC 2004 - South Pacific Region
 Problem C - Necklaces
 Solution - Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program ProblemC;
{$APPTYPE CONSOLE}
Var
  St: String[30];
  TwoDegrees: Array [0..30] of Int64;
  A,B,C,D,Max,Min: Int64;
  i,j: Integer;

Function FMax(a,b: Int64): Int64;
Begin
  if a > b then
    FMax:=a
  else
    FMax:=b;
end;

Function FMin(a,b: Int64): Int64;
Begin
  if a < b then
    FMin:=a
  else
    FMin:=b;
end;

Begin
  TwoDegrees[0]:=1;
  for i:=1 to 30 do
    TwoDegrees[i]:=TwoDegrees[i-1]*2;
  ReadLn(St);
  While St <> 'END' do
    Begin
      Max:=0;
      Min:=High(Int64);
      for i:=1 to Length(St) do
        Begin
          A:=0;
          B:=0;
          C:=0;
          D:=0;
          for j:=i to i+Length(St)-1 do
            Begin
              if St[j mod Length(St) + 1] = 'B' then
                Begin
                  A:=A+TwoDegrees[j-i];
                  B:=B+TwoDegrees[Length(St)-j+i-1];
                end
              else
                Begin
                  C:=C+TwoDegrees[j-i];
                  D:=D+TwoDegrees[Length(St)-j+i-1];
                end;
            end;
          Max:=FMax(Max,FMax(A,(FMax(B,FMax(C,D)))));
          Min:=FMin(Min,FMin(A,(FMin(B,FMin(C,D)))));
        end;
      WriteLn(Min,' ',Max);
      ReadLn(St);
    end;
end.