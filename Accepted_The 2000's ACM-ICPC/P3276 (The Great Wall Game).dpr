{2005 ACM-ICPC World Finals in Shanghai
 Problem H - The Great Wall Game
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
Program P3276;
Const
  MaxN = 15;

Var
  a,a_copy: Array [1..MaxN,1..MaxN] of Integer;
  s: Array [1..MaxN,1..MaxN] of ShortInt;
  stones: Array [1..MaxN,1..2] of Integer;
  p,q: Array [1..MaxN] of Integer;
  v: Array [1..MaxN] of Boolean;
  i,j,g,N,MinRes,n_case: Integer;

Function Dist(x1,y1,x2,y2: Integer): Integer;
Begin
  Dist:=Abs(x2-x1)+Abs(y2-y1);
end;

Procedure Init;
Var
  i,j,min: Integer;
Begin
  a_copy:=a;
  for i:=1 to n do
    Begin
      min:=a[i,1];
      for j:=2 to n do
        if min > a[i,j] then
          min:=a[i,j];
      for j:=1 to n do
        Dec(a[i,j],min);
    end;
  for j:=1 to n do
    Begin
      min:=a[1,j];
      for i:=2 to n do
        if min > a[i,j] then
          min:=a[i,j];
      for i:=1 to n do
        Dec(a[i,j],min);
    end;
end;

Procedure MakeS;
Var
  i,j: Integer;
Begin
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j] = 0 then
        s[i,j]:=1
      else
        s[i,j]:=0;
end;

Function TryFind(i: Integer): Boolean;
Var
  j: Integer;
Begin
  TryFind:=False;
  if v[i] then
    Exit;
  v[i]:=True;
  for j:=1 to n do
    if (s[i,j] = 1) and ((p[j] = 0) or TryFind(p[j])) then
      Begin
        TryFind:=True;
        p[j]:=i;
        q[i]:=j;
        Exit;
      end;
end;

Function MaxPairs: Integer;
Var
  i,cnt: Integer;
Begin
  FillChar(p,SizeOf(p),0);
  FillChar(q,SizeOf(q),0);
  cnt:=0;
  for i:=1 to n do
    Begin
      FillChar(v,SizeOf(v),False);
      if TryFind(i) then
        Inc(cnt);
    end;
  MaxPairs:=cnt;
end;

Procedure Correct;
Var
  i,j,min: Integer;
  Xm,XX,YY: Set of 1..MaxN;

  Procedure DFS(i: Integer; pp: Boolean);
  Var
    j: Integer;
  Begin
    if pp then
      Begin
        XX:=XX+[i];
        for j:=1 to n do
          if not (j in YY) and (s[i,j] = 1) then
            DFS(j,False);
      end
    else
      Begin
        YY:=YY+[i];
        for j:=1 to n do
          if not (j in XX) and (s[j,i] = -1) then
            DFS(j,True);
      end;
  end;

Begin
  Xm:=[];
  for i:=1 to n do
    if q[i] = 0 then
      Xm:=Xm+[i];
  for j:=1 to n do
    if p[j] <> 0 then
      s[p[j],j]:=-1;
  XX:=[]; YY:=[];
  for i:=1 to n do
    if i in Xm then
      DFS(i,True);
  min:=MaxInt;
  YY:=[1..N]-YY;
  for i:=1 to n do
    if i in XX then
      for j:=1 to n do
        if j in YY then
          if min > a[i,j] then
            min:=a[i,j];
  for i:=1 to n do
    if i in XX then
      for j:=1 to n do
        Dec(a[i,j],min);
  YY:=[1..N]-YY;
  for j:=1 to n do
    if j in YY then
      for i:=1 to n do
        Inc(a[i,j],min);
end;

Function Answer: Integer;
Var
  i,Sum: Integer;
Begin
  Sum:=0;
  for i:=1 to N do
    Inc(Sum,a_copy[i,q[i]]);
  Answer:=Sum;
end;

Procedure Solve;
Var
  Find: Boolean;
Begin
  Init;
  Find:=False;
  While not Find do
    Begin
      MakeS;
      if MaxPairs = n then
        Begin
          Find:=True;
          Continue;
        end;
      Correct;
    end;
  if Answer < MinRes then
    MinRes:=Answer;
end;

Begin
  n_case:=0;
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        Read(stones[i,1],stones[i,2]);
      MinRes:=MaxInt;
      for i:=1 to N do
        Begin
          for j:=1 to N do
            for g:=1 to N do
              a[j,g]:=Dist(stones[g,1],stones[g,2],i,j);
          Solve;
        end;
      for i:=1 to N do
        Begin
          for j:=1 to N do
            for g:=1 to N do
              a[j,g]:=Dist(stones[g,1],stones[g,2],j,i);
          Solve;
        end;
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=Dist(stones[j,1],stones[j,2],i,i);
      Solve;
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=Dist(stones[j,1],stones[j,2],i,N-i+1);
      Solve;
      Inc(n_case);
      WriteLn('Board ',n_case,': ',MinRes,' moves required.');
      WriteLn;
      ReadLn(N);
    end;
end.