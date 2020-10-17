{Problem: 3197 - Stacking Cylinders
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3197;
{$APPTYPE CONSOLE}
const
  maxn = 10;

var
  x,y: array [1..maxn] of Double;
  nx,ny,d,cos_a,sin_a,buf: Double;
  i,j,N: Integer;

begin
  Read(N);
  while N > 0 do
    begin
      for i:=1 to N do
        begin
          Read(x[i]);
          y[i]:=1.0;
        end;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if x[i] > x[j] then
            begin
              buf:=x[i];
              x[i]:=x[j];
              x[j]:=buf;
            end;
      while N > 1 do
        begin
          for i:=1 to N-1 do
            begin
              d:=Sqrt(Sqr(x[i+1]-x[i])+Sqr(y[i+1]-y[i]));
              nx:=d/2;
              ny:=Sqrt(4-Sqr(nx));
              cos_a:=(x[i+1]-x[i])/d;
              sin_a:=(y[i+1]-y[i])/d;
              x[i]:=x[i]+nx*cos_a-ny*sin_a;
              y[i]:=y[i]+nx*sin_a+ny*cos_a;
            end;
          Dec(N);
        end;
      WriteLn(x[1]:0:4,' ',y[1]:0:4);
      Read(N);
    end;
end.
