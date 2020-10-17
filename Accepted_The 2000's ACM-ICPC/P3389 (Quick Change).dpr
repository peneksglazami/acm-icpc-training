{Problem: 3389 - Quick Change
 ACM ICPC - North America - Greater New York - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3389;
{$APPTYPE CONSOLE}
const
  MaxC = 500;
  cc: array [1..4] of Integer = (25,10,5,1);

var
  a,p: array [0..MaxC] of Integer;
  b: array [1..4] of Integer;
  i,j,g,C,Test: Integer;

procedure Cnt(i: Integer);
begin
  if i = 0 then
    Exit;
  Inc(b[p[i]]);
  Cnt(i-cc[p[i]]);
end;

begin
  ReadLn(Test);
  for i:=1 to Test do
    begin
      ReadLn(C);
      FillChar(p,SizeOf(p),0);
      for j:=1 to C do
        a[j]:=-1;
      a[0]:=0;
      for j:=1 to 4 do
        begin
          for g:=0 to C-cc[j] do
            if a[g] <> -1 then
              if (a[g+cc[j]] = -1) or (a[g]+1 < a[g+cc[j]]) then
                begin
                  a[g+cc[j]]:=a[g]+1;
                  p[g+cc[j]]:=j;
                end;
        end;
      FillChar(b,SizeOf(b),0);
      Cnt(C);
      WriteLn(i,' ',b[1],' QUARTER(S), ',b[2],' DIME(S), ',b[3],' NICKEL(S), ',b[4],' PENNY(S)');
    end;
end.