{Problem: 10602 - Fill
 Problem source: Bulgarian National Olympiad in Informatics 2003
 Problem submitter: Ivaylo Riskov
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10603 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 200;

Var
  t: Array [0..MaxN,0..MaxN,0..MaxN] of Word;
  tt: Array [0..MaxN,0..MaxN,0..MaxN] of Boolean;
  s1,s2: Array [1..1000000] of Record x,y,z: Byte; end;
  dd: Word;
  i,j,g,a,b,c,aa,bb,cc,d,Test,ss1,ss2,dmax,am_max: Integer;

Function Min(a,b: Word): Word;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(a,b,c,d);
      FillChar(t,SizeOf(t),0);
      FillChar(tt,SizeOf(tt),False);
      tt[0,0,c]:=True;
      With s1[1] do
        Begin
          x:=0;
          y:=0;
          z:=c;
        end;
      ss1:=1;
      Repeat
        s2:=s1;
        ss2:=ss1;
        ss1:=0;
        for i:=1 to ss2 do
          Begin
            {a --> b}
            dd:=Min(s2[i].x,b-s2[i].y);
            if not tt[s2[i].x-dd,s2[i].y+dd,s2[i].z] or
              (t[s2[i].x-dd,s2[i].y+dd,s2[i].z] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x-dd,s2[i].y+dd,s2[i].z]:=True;
                  t[s2[i].x-dd,s2[i].y+dd,s2[i].z]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x-dd;
                  s1[ss1].y:=s2[i].y+dd;
                  s1[ss1].z:=s2[i].z;
                end;
            {a -- > c}
            dd:=Min(s2[i].x,c-s2[i].z);
            if not tt[s2[i].x-dd,s2[i].y,s2[i].z+dd] or
              (t[s2[i].x-dd,s2[i].y,s2[i].z+dd] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x-dd,s2[i].y,s2[i].z+dd]:=True;
                  t[s2[i].x-dd,s2[i].y,s2[i].z+dd]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x-dd;
                  s1[ss1].y:=s2[i].y;
                  s1[ss1].z:=s2[i].z+dd;
                end;

            {b -- > a}
            dd:=Min(s2[i].y,a-s2[i].x);
            if not tt[s2[i].x+dd,s2[i].y-dd,s2[i].z] or
              (t[s2[i].x+dd,s2[i].y-dd,s2[i].z] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x+dd,s2[i].y-dd,s2[i].z]:=True;
                  t[s2[i].x+dd,s2[i].y-dd,s2[i].z]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x+dd;
                  s1[ss1].y:=s2[i].y-dd;
                  s1[ss1].z:=s2[i].z;
                end;

            {b -- > c}
            dd:=Min(s2[i].y,c-s2[i].z);
            if not tt[s2[i].x,s2[i].y-dd,s2[i].z+dd] or
              (t[s2[i].x,s2[i].y-dd,s2[i].z+dd] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x,s2[i].y-dd,s2[i].z+dd]:=True;
                  t[s2[i].x,s2[i].y-dd,s2[i].z+dd]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x;
                  s1[ss1].y:=s2[i].y-dd;
                  s1[ss1].z:=s2[i].z+dd;
                end;

            {c -- > a}
            dd:=Min(s2[i].z,a-s2[i].x);
            if not tt[s2[i].x+dd,s2[i].y,s2[i].z-dd] or
              (t[s2[i].x+dd,s2[i].y,s2[i].z-dd] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x+dd,s2[i].y,s2[i].z-dd]:=True;
                  t[s2[i].x+dd,s2[i].y,s2[i].z-dd]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x+dd;
                  s1[ss1].y:=s2[i].y;
                  s1[ss1].z:=s2[i].z-dd;
                end;

            {c -- > b}
            dd:=Min(s2[i].z,b-s2[i].y);
            if not tt[s2[i].x,s2[i].y+dd,s2[i].z-dd] or
              (t[s2[i].x,s2[i].y+dd,s2[i].z-dd] > t[s2[i].x,s2[i].y,s2[i].z]+dd) then
                Begin
                  tt[s2[i].x,s2[i].y+dd,s2[i].z-dd]:=True;
                  t[s2[i].x,s2[i].y+dd,s2[i].z-dd]:=t[s2[i].x,s2[i].y,s2[i].z]+dd;
                  Inc(ss1);
                  s1[ss1].x:=s2[i].x;
                  s1[ss1].y:=s2[i].y+dd;
                  s1[ss1].z:=s2[i].z-dd;
                end;
          end;
      Until ss1 = 0;
      dmax:=0;
      am_max:=0;
      for i:=0 to Min(a,d) do
        for j:=0 to b do
          for g:=0 to c do
            if tt[i,j,g] then
              if (i > dmax) or ((i = dmax) and (am_max > t[i,j,g])) then
                Begin
                  dmax:=i;
                  am_max:=t[i,j,g];
                end;
      for i:=0 to a do
        for j:=0 to Min(b,d) do
          for g:=0 to c do
            if tt[i,j,g] then
              if (j > dmax) or ((j = dmax) and (am_max > t[i,j,g])) then
                Begin
                  dmax:=j;
                  am_max:=t[i,j,g];
                end;
      for i:=0 to a do
        for j:=0 to b do
          for g:=0 to Min(c,d) do
            if tt[i,j,g] then
              if (g > dmax) or ((g = dmax) and (am_max > t[i,j,g])) then
                Begin
                  dmax:=g;
                  am_max:=t[i,j,g];
                end;
      WriteLn(am_max,' ',dmax);
      Dec(Test);
    end;
end.