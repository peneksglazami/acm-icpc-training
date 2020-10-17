{Problem: 10891 - Game of Sum
 Problem setter: Syed Monowar Hossain
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program ProblemE (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 100;
Type
  Int = Integer;
Var
  a: Array [1..MaxN] of Int;
  d: Array [1..MaxN,1..MaxN] of Int;
  t: Array [1..2,1..MaxN,1..MaxN,1..2] of Int;
  b: Array [1..2,1..MaxN,1..MaxN] of Boolean;
  i,j,g,n: Integer;
  s1,s2: Int;

Function Max(a,b: Int): Int;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Procedure Rec(n,l,r: Integer; Var s1,s2: Int);
Var
  i,j: Integer;
  ss1,ss2: Int;
Begin
  if l > r then
    Begin
      s1:=0;
      s2:=0;
      Exit;
    end;
  if l = r then
    Begin
      if n = 1 then
        Begin
          s1:=a[l]; s2:=0;
        end
      else
        Begin
          s1:=0; s2:=a[l];
        end;
      Exit;
    end;
  if n = 1 then
    Begin
      if b[1,l,r] then
        Begin
          s1:=t[1,l,r,1];
          s2:=t[1,l,r,2];
        end
      else
        Begin
          b[1,l,r]:=True;
          t[1,l,r,1]:=-MaxInt+1;
          for i:=l to r do
            Begin
              Rec(2,l,i-1,ss1,ss2);
              if t[1,l,r,1] < ss1+d[i,r] then
                Begin
                  t[1,l,r,1]:=ss1+d[i,r];
                  t[1,l,r,2]:=ss2;
                end;
              Rec(2,i+1,r,ss1,ss2);
              if t[1,l,r,1] < ss1+d[l,i] then
                Begin
                  t[1,l,r,1]:=ss1+d[l,i];
                  t[1,l,r,2]:=ss2;
                end;
            end;
          s1:=t[1,l,r,1];
          s2:=t[1,l,r,2];
        end;
    end
  else
    Begin
      if b[2,l,r] then
        Begin
          s1:=t[2,l,r,1];
          s2:=t[2,l,r,2];
        end
      else
        Begin
          b[2,l,r]:=True;
          t[2,l,r,2]:=-MaxInt+1;
          for i:=l to r do
            Begin
              Rec(1,l,i-1,ss1,ss2);
              if t[2,l,r,2] < ss2+d[i,r] then
                Begin
                  t[2,l,r,2]:=ss2+d[i,r];
                  t[2,l,r,1]:=ss1;
                end;
              Rec(1,i+1,r,ss1,ss2);
              if t[2,l,r,2] < ss2+d[l,i] then
                Begin
                  t[2,l,r,2]:=ss2+d[l,i];
                  t[2,l,r,1]:=ss1;
                end;
            end;
          s1:=t[2,l,r,1];
          s2:=t[2,l,r,2];
        end;
    end;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        Read(a[i]);
      ReadLn;
      for i:=1 to N do
        for j:=i to N do
          Begin
            d[i,j]:=0;
            for g:=i to j do
              Inc(d[i,j],a[g]);
          end;
      FillChar(b,SizeOf(b),False);
      Rec(1,1,N,s1,s2);
      WriteLn(s1-s2);
      ReadLn(N);
    end;
end.