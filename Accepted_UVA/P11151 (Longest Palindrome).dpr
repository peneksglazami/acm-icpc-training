{Problem: 11151 - Longest Palindrome
 Problemsetter: Raymond Chun
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem11151;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;

var
  t: array [1..MaxN,1..MaxN] of Integer;
  St: String;
  i,j,test,Len: Integer;

function Max(a,b: Integer): Integer;
begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

begin
  ReadLn(test);
  while test > 0 do
    begin
      ReadLn(St);
      FillChar(t,SizeOf(t),0);
      Len:=Length(St);
      for i:=1 to Len do
        t[i,i]:=1;
      for i:=1 to Len-1 do
        for j:=1 to Len-i do
          if St[j] = St[j+i] then
            t[j,j+i]:=Max(t[j+1,j+i-1]+2,Max(t[j+1,j+i],t[j,j+i-1]))
          else
            t[j,j+i]:=Max(t[j+1,j+i-1],Max(t[j+1,j+i],t[j,j+i-1]));
      WriteLn(t[1,Len]);
      dec(test);
    end;
end.