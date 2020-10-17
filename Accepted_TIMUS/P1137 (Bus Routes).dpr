{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem E - Bus Routes
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemE;
{$APPTYPE CONSOLE}
const
  MaxN = 100;
  MaxM = 1000;
  MaxL = 10000;

type
  SS = ^Node;

  Node = record
    n: Integer;
    next: SS;
  end;

var
  t: array [1..MaxL] of SS;
  m: array [1..MaxN] of Integer;
  mm: array [1..MaxN,1..MaxM+1] of Integer;
  i,j,N,sum,cnt: Integer;

procedure AddEdge(i,j: Integer);
var
  p: SS;
begin
  New(p);
  p^.n:=j;
  p^.next:=t[i];
  t[i]:=p;
end;

procedure DeleteEdge(i: Integer);
var
  p: SS;
begin
  p:=t[i];
  t[i]:=t[i]^.next;
  Dispose(p);
end;

procedure DFSIsOK(i: Integer);
var
  j: Integer;
begin
  while t[i] <> nil do
    begin
      j:=t[i]^.n;
      DeleteEdge(i);
      DFSIsOK(j);
    end;
  inc(cnt);
end;

procedure DFSPrint(i: Integer);
var
  j: Integer;
begin
  while t[i] <> nil do
    begin
      j:=t[i]^.n;
      DeleteEdge(i);
      DFSPrint(j);
    end;
  Write(i,' ');
end;

begin
  ReadLn(N);
  for i:=1 to MaxL do
    t[i]:=nil;
  sum:=0;
  for i:=1 to N do
    begin
      Read(m[i]);
      inc(sum,m[i]);
      Read(mm[i,1]);
      for j:=2 to m[i]+1 do
        begin
          Read(mm[i,j]);
          AddEdge(mm[i,j],mm[i,j-1]);
        end;
    end;
  cnt:=0;
  DFSIsOk(mm[1,1]);
  if cnt = sum+1 then
    begin
      for i:=1 to MaxL do
        t[i]:=nil;
      for i:=1 to N do
        for j:=2 to m[i]+1 do
          AddEdge(mm[i,j],mm[i,j-1]);
      Write(sum,' ');
      DFSPrint(mm[1,1]);
    end
  else
    WriteLn(0);
end.
