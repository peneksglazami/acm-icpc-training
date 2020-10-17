{Problem: 3379 - Two Ends
 ACM ICPC - North America - East Central - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3379;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;

var
  t: array [1..2,1..MaxN,1..MaxN,1..2] of Integer;
  a: array [1..MaxN] of Integer;
  i,j,N,n_case,s1,s2: Integer;

procedure Solve(l,r,player: Integer; var s1,s2: Integer);
var
  x,y: Integer;
begin
  if t[player,l,r,1] = -1 then
    if player = 1 then
      begin
        Solve(l+1,r,2,x,y);
        t[1,l,r,1]:=a[l]+x;
        t[1,l,r,2]:=y;
        Solve(l,r-1,2,x,y);
        x:=x+a[r];
        if x-y > t[1,l,r,1]-t[1,l,r,2] then
          begin
            t[1,l,r,1]:=x;
            t[1,l,r,2]:=y;
          end;
      end
    else
      if a[l] >= a[r] then
        begin
          Solve(l+1,r,1,t[2,l,r,1],t[2,l,r,2]);
          Inc(t[2,l,r,2],a[l]);
        end
      else
        begin
          Solve(l,r-1,1,t[2,l,r,1],t[2,l,r,2]);
          Inc(t[2,l,r,2],a[r]);
        end;
  s1:=t[player,l,r,1];
  s2:=t[player,l,r,2];
end;

begin
  n_case:=0;
  Read(N);
  while N <> 0 do
    begin
      for i:=1 to N do
        for j:=1 to N do
          begin
            t[1,i,j,1]:=-1;
            t[1,i,j,2]:=-1;
            t[2,i,j,1]:=-1;
            t[2,i,j,2]:=-1;
          end;
      for i:=1 to N do
        begin
          Read(a[i]);
          t[1,i,i,1]:=a[i];
          t[1,i,i,2]:=0;
          t[2,i,i,1]:=0;
          t[2,i,i,2]:=a[i];
        end;
      Solve(1,N,1,s1,s2);
      Inc(n_case);
      WriteLn('In game ',n_case,', the greedy strategy might lose by as many as ',s1-s2,' points.');
      Read(N);
    end;
end.