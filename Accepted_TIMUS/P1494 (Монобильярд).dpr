{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_F;
{$APPTYPE CONSOLE}
const
  MaxN = 100000;
  MaxL = 17;

var
  a,p: array [1..MaxN] of Integer;
  tmax,tmin: array [1..MaxL,1..MaxN] of Integer;
  s: array [1..MaxN,1..2] of Integer;
  i,j,k,N,yk1,yk2,max_l,min_r,l,r,pp: Integer;
  Ok: Boolean;

function max(a,b: Integer): Integer;
begin
  if a > b then
    max:=a
  else
    max:=b;
end;

function min(a,b: Integer): Integer;
begin
  if a < b then
    min:=a
  else
    min:=b;
end;

function getmin(i,l,r: Integer): Integer;
var
  left,right: Integer;
begin
  if l = r then
    Result:=tmin[i,l]
  else
    begin
      if odd(l) then
        begin
          left:=min(tmin[i,l],tmin[i,l+1]);
          l:=l div 2 + 2;
        end
      else
        begin
          left:=tmin[i,l];
          l:=l div 2 + 1;
        end;
      if odd(r) then
        begin
          right:=tmin[i,r];
          r:=r div 2;
        end
      else
        begin
          right:=min(tmin[i,r-1],tmin[i,r]);
          r:=r div 2 - 1;
        end;
      if l <= r then
        Result:=min(min(left,right),getmin(i+1,l,r))
      else
        Result:=min(left,right);
    end;
end;

function getmax(i,l,r: Integer): Integer;
var
  left,right: Integer;
begin
  if l = r then
    Result:=tmax[i,l]
  else
    begin
      if odd(l) then
        begin
          left:=max(tmax[i,l],tmax[i,l+1]);
          l:=l div 2 + 2;
        end
      else
        begin
          left:=tmax[i,l];
          l:=l div 2 + 1;
        end;
      if odd(r) then
        begin
          right:=tmax[i,r];
          r:=r div 2;
        end
      else
        begin
          right:=max(tmax[i,r-1],tmax[i,r]);
          r:=r div 2 - 1;
        end;
      if l <= r then
        Result:=max(max(left,right),getmax(i+1,l,r))
      else
        Result:=max(left,right);
    end;
end;

begin
  ReadLn(N);
  for i:=1 to N do
    begin
      ReadLn(a[i]);
      p[a[i]]:=i;
      tmin[1,i]:=a[i];
      tmax[1,i]:=a[i];
    end;
  i:=1; j:=N;
  while j > 1 do
    begin
      inc(i);
      if Odd(j) then
        begin
          tmin[i-1,j+1]:=tmin[i-1,j];
          tmax[i-1,j+1]:=tmax[i-1,j];
          inc(j);
        end;
      for k:=1 to j div 2 do
        begin
          tmin[i,k]:=min(tmin[i-1,2*k-1],tmin[i-1,2*k]);
          tmax[i,k]:=max(tmax[i-1,2*k-1],tmax[i-1,2*k]);
        end;
      j:=j div 2;
    end;
  Ok:=True;
  yk1:=1; yk2:=1;
  s[1,1]:=1; s[1,2]:=N;
  while Ok and (yk2 <= yk1) do
    begin
      l:=s[yk2,1];
      r:=s[yk2,2];
      inc(yk2);
      if l = r then
        continue;
      pp:=p[getmin(1,l,r)];
      max_l:=-1;
      if pp > l then
        begin
          inc(yk1);
          s[yk1,1]:=l;
          s[yk1,2]:=pp-1;
          max_l:=getmax(1,l,pp-1);
        end;
      min_r:=MaxN+1;
      if pp < r then
        begin
          inc(yk1);
          s[yk1,1]:=pp+1;
          s[yk1,2]:=r;
          min_r:=getmin(1,pp+1,r);
        end;
      Ok:=max_l < min_r;
    end;
  if Ok then
    WriteLn('Not a proof')
  else
    WriteLn('Cheater');
end.