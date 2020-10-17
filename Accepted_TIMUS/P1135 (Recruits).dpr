{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem C - Recruits
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemC;
{$APPTYPE CONSOLE}
const
  MaxN = 30000;

var
  a: array [1..MaxN] of Char;
  i,j,cnt,N: Integer;
  St: String;

begin
  ReadLn(N);
  i:=0;
  while i < N do
    begin
      ReadLn(St);
      for j:=1 to Length(St) do
        if St[j] in ['>','<'] then
          begin
            inc(i);
            a[i]:=St[j];
          end;
    end;
  j:=0;
  cnt:=0;
  for i:=1 to N do
    if a[i] = '<' then
      begin
        inc(j);
        inc(cnt,i-j);
      end;
  WriteLn(cnt);
end.
