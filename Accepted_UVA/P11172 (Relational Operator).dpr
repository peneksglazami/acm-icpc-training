{Problem: 11172 - Relational Operator
 Problem-setter: Shahriar Manzoor
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_H;
{$APPTYPE CONSOLE}
var
  t,a,b: Integer;

begin
  ReadLn(t);
  while t > 0 do
    begin
      ReadLn(a,b);
      if a > b then
        WriteLn('>')
      else
        if a < b then
          WriteLn('<')
        else
          WriteLn('=');
      dec(t);
    end;
end.
