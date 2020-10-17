{Problem: 2689 - Cricket Field
 ACM ICPC - Europe - Northeastern - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2689;
{$APPTYPE CONSOLE}
const
  MaxN = 100;

var
  x,y: array [0..MaxN] of Integer;
  i,j,k,n,h,w,bh,bw,bl,l,Test: Integer;

function min(a,b: Integer): Integer;
begin
  if a < b then
    min:=a
  else
    min:=b;
end;

function max(a,b: Integer): Integer;
begin
  if a > b then
    max:=a
  else
    max:=b;
end;

begin
  ReadLn(Test);
  x[0]:=0; y[0]:=0;
  while Test > 0 do
    begin
      ReadLn(n,w,h);
      for i:=1 to n do
        ReadLn(x[i],y[i]);
      bl:=0;
      for i:=0 to n do
        for j:=0 to n do
          begin
            l:=min(w-x[i],h-y[j]);
            for k:=1 to n do
              if (x[k] > x[i]) and (y[k] > y[j]) then
                if l > max(x[k]-x[i],y[k]-y[j]) then
                  l:=max(x[k]-x[i],y[k]-y[j]);
            if l > bl then
              begin
                bl:=l;
                bw:=x[i];
                bh:=y[j];
              end;
          end;
      WriteLn(bw,' ',bh,' ',bl);
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.