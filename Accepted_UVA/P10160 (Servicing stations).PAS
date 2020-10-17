{Problem: 10160 - Servicing stations
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
Program Problem10160 (input,output);
Const
  MaxN = 35;

Type
  SSet = Set of 1..MaxN;

  City = Record
    name,number: Integer;
    part: SSet;
   end;

Var
  a: Array [1..MaxN] of City;
  c: Array [1..MaxN] of SSet;
  RWork,RBest,Rt,Rg,Rp: SSet;
  i,j,t,N,M,x,y,mn,min: Integer;

Function num(A: SSet): Integer;
Var
  i,cnt: Integer;
Begin
  cnt:=0;
  for i:=1 to N do
    if i in A then
      Inc(cnt);
  num:=cnt;
end;

Procedure Sort(t: Integer);
Var
  i,j: Integer;
  buf: City;
Begin
  for i:=1 to t-1 do
    for j:=i+1 to t do
      if a[i].number < a[j].number then
        Begin
          buf:=a[i];
          a[i]:=a[j];
          a[j]:=buf;
        end;
end;

Procedure Include(k: Integer);
Begin
  RWork:=RWork+[a[k].name];
  Inc(mn);
end;

Procedure Exclude(k: Integer);
Begin
  RWork:=RWork-[a[k].name];
  Dec(mn);
end;

Procedure One(t: Integer; Q: SSet);
Var
  i: Integer;
Begin
  i:=1;
  While (i <= t) and (a[i].part <> Q) do
    Inc(i);
  if i <= t then
    Begin
      RBest:=RBest+[A[i].Name];
      RWork:=RWork+[A[i].Name];
      Rt:=[];
      min:=num(RBest);
    end;
end;

Function Come(Var t: Integer): Boolean;
Var
  i,j,l: Integer;
Begin
  for i:=1 to t-1 do
    for j:=i+1 to t do
      if a[j].part <= a[i].part then
        Begin
          a[j].part:=[];
          a[j].number:=0;
        end;
  l:=t;
  for i:=1 to t do
    if (a[i].part = []) and (i <= l) then
      Begin
        for j:=i to l-1 do
          a[j]:=a[j+1];
        a[l].part:=[];
        a[l].number:=0;
        Dec(l);
      end;
  Come:=(t <> l);
  t:=l;
end;

Procedure Pygmy(t: Integer; Var r,p: SSet);
Var
  i,j: Integer;
  v: SSet;
Begin
  for i:=1 to t do
    Begin
      v:=[];
      for j:=1 to t do
        if i <> j then
          v:=v+a[j].part;
      if v*a[i].part <> a[i].part then
        r:=r+[a[i].name];
    end;
  for i:=1 to t do
    if a[i].name in r then
      p:=p+a[i].part;
end;

Procedure Solve(k: Integer; Res,Rt: SSet);
Var
  i: Integer;
Begin
  if mn > min then
    Exit;
  if (k = t+1) and (Rt <> []) then
    Exit;
  if (k <= t) then
    if (Res+c[k])*Rt <> Rt then
      Exit;
  if Rt = [] then
    Begin
      min:=mn;
      RBest:=RWork;
    end
  else
    Begin
      i:=k;
      While i <= t do
        Begin
          if a[i].part*Rt = [] then
            Begin
              Inc(i);
              Continue;
            end;
          Include(i);
          Solve(i+1,Res+a[i].part,Rt-a[i].part);
          Exclude(i);
          Inc(i);
        end;
    end;
end;

Begin
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      for i:=1 to MaxN do
        Begin
          a[i].name:=0;
          a[i].number:=0;
          a[i].part:=[];
        end;
      for i:=1 to N do
        Begin
          a[i].name:=i;
          a[i].part:=[i];
        end;
      for i:=1 to M do
        Begin
          ReadLn(x,y);
          a[x].part:=a[x].part+[y];
          a[y].part:=a[y].part+[x];
        end;
      for i:=1 to N do
        a[i].number:=num(a[i].part);
      min:=N+1;
      Sort(N);
      t:=N;
      Rt:=[1..N];
      RWork:=[];
      RBest:=[];
      One(N,Rt);
      While Come(t) and (Rt <> []) do
        Begin
          Rg:=[]; Rp:=[];
          Pygmy(t,Rg,Rp);
          RWork:=RWork+Rg;
          RBest:=RBest+Rg;
          Rt:=Rt-Rp;
          if Rg <> [] then
            Begin
              for i:=1 to t do
                Begin
                  for j:=1 to N do
                    if (j in Rp) and (j in a[i].part) then
                      a[i].part:=a[i].part-[j];
                  a[i].number:=num(a[i].part);
                end;
              Sort(t);
            end;
        end;
      if Rt <> [] then
        One(t,Rt);
      c[t]:=a[t].part;
      for i:=t-1 downto 1 do
        c[i]:=a[i].part+c[i+1];
      mn:=num(RWork);
      Solve(1,RWork,Rt);
      WriteLn(min);
      ReadLn(N,M);
    end;
end.