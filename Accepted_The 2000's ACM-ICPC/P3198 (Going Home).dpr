{Problem: 3198 - Going Home
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program Problem3198;
{$APPTYPE CONSOLE}
const
  MaxH = 100;

var
  a,a_copy: array [1..MaxH,1..MaxH] of Integer;
  s: array [1..MaxH,1..MaxH] of ShortInt;
  p,q: array [1..MaxH] of Integer;
  v: array [1..MaxH] of Boolean;
  house,man: array [1..MaxH] of record row,col: Integer; end;
  N,M,H: Integer;

function dist(r1,c1,r2,c2: Integer): Integer;
begin
  dist:=Abs(r2-r1)+Abs(c2-c1);
end;

procedure ReadData;
var
  i,j,h_cnt,m_cnt: Integer;
  St: String;
begin
  h_cnt:=0;
  m_cnt:=0;
  for i:=1 to N do
    begin
      ReadLn(St);
      for j:=1 to M do
        if St[j] = 'H' then
          begin
            Inc(h_cnt);
            house[h_cnt].row:=i;
            house[h_cnt].col:=j;
          end
        else
          if St[j] = 'm' then
            begin
              Inc(m_cnt);
              man[m_cnt].row:=i;
              man[m_cnt].col:=j;
            end;
    end;
  H:=h_cnt;  
end;

procedure Init;
var
  i,j,min: Integer;
begin
  for i:=1 to H do
    for j:=1 to H do
      begin
         a[i,j]:=dist(man[i].row,man[i].col,house[j].row,house[j].col);
         a_copy[i,j]:=a[i,j];
      end;
  for i:=1 to H do
    begin
      min:=a[i,1];
      for j:=2 to H do
        if min > a[i,j] then
          min:=a[i,j];
      for j:=1 to H do
        Dec(a[i,j],min);
    end;
  for j:=1 to H do
    begin
      min:=a[1,j];
      for i:=2 to H do
        if min > a[i,j] then
          min:=a[i,j];
      for i:=1 to H do
        Dec(a[i,j],min);
    end;
end;

procedure MakeS;
var
  i,j: Integer;
begin
  for i:=1 to H do
    for j:=1 to H do
      if a[i,j] = 0 then
        s[i,j]:=1
      else
        s[i,j]:=0;
end;

function TryFind(i: Integer): Boolean;
var
  j: Integer;
begin
  TryFind:=False;
  if v[i] then
    Exit;
  v[i]:=True;
  for j:=1 to H do
    if (s[i,j] = 1) and ((p[j] = 0) or TryFind(p[j])) then
      begin
        TryFind:=True;
        p[j]:=i;
        q[i]:=j;
        Exit;
      end;
end;

function MaxPairs: Integer;
var
  i,p_cnt: Integer;
begin
  FillChar(p,SizeOf(p),0);
  FillChar(q,SizeOf(q),0);
  p_cnt:=0;
  for i:=1 to H do
    begin
      FillChar(v,SizeOf(v),False);
      if TryFind(i) then
        Inc(p_cnt);
    end;
  MaxPairs:=p_cnt;
end;

procedure Correct;
var
  Xm,XX,YY: Set of 1..MaxH;
  i,j,min: Integer;

  procedure DFS(i: Integer; pp: Boolean);
  var
    j: Integer;
  begin
    if pp then
      begin
        XX:=XX+[i];
        for j:=1 to H do
          if not (j in YY) and (s[i,j] = 1) then
            DFS(j,False);
      end
    else
      begin
        YY:=YY+[i];
        for j:=1 to H do
          if not (j in XX) and (s[j,i] = -1) then
            DFS(j,True);
      end;
  end;

begin
  Xm:=[];
  for i:=1 to H do
    if q[i] = 0 then
      Xm:=Xm+[i];
  for i:=1 to H do
    if p[i] <> 0 then
      s[p[i],i]:=-1;
  XX:=[]; YY:=[];
  for i:=1 to H do
    if i in Xm then
      DFS(i,True);
  YY:=[1..H]-YY;
  min:=MaxInt;
  for i:=1 to H do
    if i in XX then
      for j:=1 to H do
        if j in YY then
          if min > a[i,j] then
            min:=a[i,j];
  for i:=1 to H do
    if i in XX then
      for j:=1 to H do
        Dec(a[i,j],min);
  YY:=[1..H]-YY;
  for j:=1 to H do
    if j in YY then
      for i:=1 to H do
        Inc(a[i,j],min);
end;

procedure Solve;
var
  Find: Boolean;
begin
  Find:=False;
  Init;
  while not Find do
    begin
      MakeS;
      if MaxPairs = H then
        begin
          Find:=True;
          Continue;
        end;
      Correct;
    end;
end;

procedure Answer;
var
  i,Sum: Integer;
begin
  Sum:=0;
  for i:=1 to H do
    Inc(Sum,a_copy[i,q[i]]);
  WriteLn(Sum);
end;

begin
  ReadLn(N,M);
  while (N <> 0) and (M <> 0) do
    begin
      ReadData;
      Solve;
      Answer;
      ReadLn(N,M);
    end;
end.