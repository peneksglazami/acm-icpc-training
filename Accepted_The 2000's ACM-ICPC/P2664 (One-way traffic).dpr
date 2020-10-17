{Problem: 2664 - One-way traffic
 ACM ICPC - Europe - Central - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2664;
{$APPTYPE CONSOLE}
const
  MaxN = 2000;
  
var
  a: array [1..MaxN,1..MaxN] of Boolean;
  v: array [1..MaxN] of Boolean;
  low,num: array [1..MaxN] of Integer;
  i,j,x,y,z,N,M,cnt: Integer;

function Min(a,b: Integer): Integer;
begin
  if a < b then
    Min:=a
  else
    Min:=b;  
end;

procedure DFSBridge(i,p: Integer);
var
  j: Integer;
begin
  if v[i] then
    Exit;
  v[i]:=True;
  inc(cnt);
  num[i]:=cnt; low[i]:=num[i];
  for j:=1 to N do
    if a[i,j] and (j <> p) then
      if v[j] then
        low[i]:=min(low[i],num[j])
      else
        begin
          DFSBridge(j,i);
          low[i]:=Min(low[i],low[j]);
          if low[j] > num[i] then
            begin
              WriteLn(i,' ',j,' 2');
              a[i,j]:=False;
              a[j,i]:=False;
            end;
        end;
end;

function DFSCircle(i,p: Integer): Integer;
var
  j,res: Integer;
begin
  if v[i] then
    begin
      Result:=num[i];
      Exit; 
    end;
  v[i]:=True;
  inc(cnt);
  num[i]:=cnt; low[i]:=num[i];
  for j:=1 to N do
    if a[i,j] and (j <> p) then
      begin
        res:=DFSCircle(j,i);
        low[i]:=Min(low[i],res);
        if a[i,j] and a[j,i] then
          if res > num[i] then
            begin
              WriteLn(j,' ',i,' 1');
              a[i,j]:=False;
            end
          else
            begin
              WriteLn(i,' ',j,' 1');
              a[j,i]:=False;
            end;
      end;
  Result:=low[i];
end;

begin
  ReadLn(N,M);
  for i:=1 to N do
    for j:=1 to N do
      a[i,j]:=False;
  for i:=1 to M do
    begin
      ReadLn(x,y,z);
      a[x,y]:=True;
      if z = 2 then
        a[y,x]:=True;
    end;
  for i:=1 to N do
    v[i]:=False;
  cnt:=0;
  DFSBridge(1,0);
  for i:=1 to N do
    v[i]:=False;
  cnt:=0;
  for i:=1 to N do
    if not v[i] then
      DFSCircle(i,0);
end.