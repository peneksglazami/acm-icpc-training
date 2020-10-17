{Problem: 2290 - Transmitters
 ACM ICPC - North America - Mid Central - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2290;
{$APPTYPE CONSOLE}
const
  Approx = 1e-10;
  MaxN = 150;

type
  point = record
    x,y: Double;
  end;

var
  p: array [1..MaxN] of Point;
  b: array [1..MaxN] of Boolean;
  i,j,N,max,cnt: Integer;
  x,y,r: Double;

function IsLeft(x1,y1,x2,y2,x3,y3: Double): Boolean;
begin
  Result:=(x2-x1)*(y3-y1)-(x3-x1)*(y2-y1) > -Approx;
end;

begin
  ReadLn(x,y,r);
  while r >= 0.0 do
    begin
      ReadLn(N);
      for i:=1 to N do
        begin
          ReadLn(p[i].x,p[i].y);
          b[i]:=Sqr(r)-Sqr(p[i].x-x)-Sqr(p[i].y-y) > -Approx;
        end;
      max:=0;
      for i:=1 to N do
        begin
          cnt:=0;
          for j:=1 to N do
            if b[j] and IsLeft(x,y,p[i].x,p[i].y,p[j].x,p[j].y) then
              Inc(cnt);
          if cnt > max then
            max:=cnt;
        end;
      WriteLn(max);
      ReadLn(x,y,r);
    end;
end.