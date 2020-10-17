{Problem: 2936 - Prison rearrangement
 Problem F - The 2003 ACM ICPC Northwestern Europe Regional Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2936 (input,output);
Const
  MaxM = 200;

Var
  t: Array [0..MaxM div 2,0..MaxM div 2] of Boolean;
  s: Array [1..(MaxM*MaxM) div 2] of Record x,y: Byte; end;
  ss: Array [1..MaxM] of Set of 1..MaxM;
  mm,aa,a,b: Array [1..MaxM] of Byte;
  i,j,k,m,r,N,x,y,sss,max,mmm: Integer;
  tt: Set of 1..MaxM;
  Nadoelo: Boolean;

Procedure ChangeMark(l,r: Byte);
Var
  i,buf: Byte;
Begin
  if l > r then
    Begin
      buf:=l; l:=r; r:=buf;
    end;
  for i:=1 to m do
    if mm[i] = r then
      mm[i]:=l;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(m,r);
      for i:=1 to m do
        ss[i]:=[];
      for i:=1 to r do
        Begin
          ReadLn(x,y);
          ss[x]:=ss[x]+[y];
        end;
      Repeat
        Nadoelo:=True;
        for i:=1 to m-1 do
          for j:=i+1 to m do
            if (ss[i] <> ss[j]) and (ss[i]*ss[j] <> []) then
              Begin
                ss[i]:=ss[i]+ss[j];
                ss[j]:=ss[i];
                Nadoelo:=False;
              end;
      Until Nadoelo;
      for i:=1 to m do
        mm[i]:=i;
      for i:=1 to m-1 do
        for j:=i+1 to m do
          if (ss[i] = ss[j]) and (mm[i] <> mm[j]) then
            ChangeMark(mm[i],mm[j]);
      tt:=[];
      k:=0;
      for i:=1 to m do
        if (ss[i] <> []) and not (mm[i] in tt) then
          Begin
            Inc(k);
            aa[k]:=mm[i];
            b[k]:=0;
            for j:=1 to m do
              if j in ss[i] then
                Inc(b[k]);
            tt:=tt+[mm[i]];
          end;
       for i:=1 to k do
         Begin
           a[i]:=0;
           for j:=1 to m do
             if aa[i] = mm[j] then
               Inc(a[i]);
         end;
      a[k+1]:=m; b[k+1]:=m;
      for i:=1 to k do
        Begin
          Dec(a[k+1],a[i]);
          Dec(b[k+1],b[i]);
        end;
      FillChar(t,SizeOf(t),False);
      s[1].x:=0; s[1].y:=0; sss:=1; t[0,0]:=True;
      for i:=1 to k do
        Begin
          mmm:=sss;
          for j:=1 to sss do
            if (s[j].x+a[i] <= m div 2) and (s[j].y+b[i] <= m div 2) then
              if not (t[s[j].x+a[i],s[j].y+b[i]]) then
                Begin
                  Inc(mmm);
                  s[mmm].x:=s[j].x+a[i];
                  s[mmm].y:=s[j].y+b[i];
                  t[s[mmm].x,s[mmm].y]:=True;
                end;
          sss:=mmm;
        end;
      max:=0;
      for i:=1 to sss do
        Begin
          mmm:=max;
          for j:=mmm+1 to m div 2 do
            if (s[i].x <= j) and (s[i].y <= j) then
              if (s[i].x+a[k+1] >= j) and (s[i].y+b[k+1] >= j) then
                max:=j;
        end;
      WriteLn(max);
      Dec(N);
    end;
end.