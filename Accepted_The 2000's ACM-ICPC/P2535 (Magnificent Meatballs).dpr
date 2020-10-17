{Problem: 2535 - Magnificent Meatballs
 ACM ICPC - North America - Mid Central - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2535;
{$APPTYPE CONSOLE}
var
  a: array [1..30] of Integer;
  i,N,S,SS: Integer;

begin
  Read(N);
  while N <> 0 do
    begin
      S:=0;
      for i:=1 to N do
        begin
          Read(a[i]);
          S:=S+a[i];
        end;
      if not Odd(S) then
        begin
          i:=1;
          S:=S div 2;
          SS:=0;
          repeat
            SS:=SS+a[i];
            Inc(i);
          until SS >= S;
          if SS = S then
            WriteLn('Sam stops at position ',i-1,' and Ella stops at position ',i,'.')
          else
            WriteLn('No equal partitioning.');
        end
      else
        WriteLn('No equal partitioning.');
      Read(N);
    end;
end.