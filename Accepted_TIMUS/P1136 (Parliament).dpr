{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem D - Parliament
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemD;
{$APPTYPE CONSOLE}
const
  MaxN = 3000;

type
  SS = ^Node;

  Node = record
    n: Integer;
    left,right: SS;
  end;

var
  a: array [1..MaxN] of Integer;
  i,N: Integer;
  T: SS;

procedure CreateTree(i,j: Integer; var T: SS);
var
  k: Integer;
begin
  New(T);
  T^.n:=a[j];
  T^.left:=nil;
  T^.right:=nil;
  k:=i-1;
  while a[k+1] < a[j] do
    inc(k);
  if k >= i then
    CreateTree(i,k,T^.left);
  if k+1 < j then
    CreateTree(k+1,j-1,T^.right);
end;

procedure DeleteTree(var T: SS);
begin
  if T = nil then
    Exit;
  DeleteTree(T^.left);
  DeleteTree(T^.right);
  Dispose(T);
  T:=nil;
end;

procedure PrintTree(T: SS);
begin
  if T = nil then
    Exit;
  PrintTree(T^.right);
  PrintTree(T^.left);
  Write(T^.n,' ');
end;

begin
  ReadLn(N);
  for i:=1 to N do
    Read(a[i]);
  T:=nil;
  CreateTree(1,N,T);
  PrintTree(T);
  DeleteTree(T);
end.
