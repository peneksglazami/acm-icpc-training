{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_E;
{$APPTYPE CONSOLE}
var
  N,N1,N2: Integer;

function Lucky(n: Integer): Boolean;
var
  i,a,b: Integer;
begin
  a:=0; b:=0;
  for i:=1 to 3 do
    begin
      a:=a+n mod 10;
      n:=n div 10;
    end;
  for i:=1 to 3 do
    begin
      b:=b+n mod 10;
      n:=n div 10;
    end;
  Result:=a = b;
end;

begin
  ReadLn(N);
  N1:=N-1;
  N2:=N+1;
  if Lucky(N1) or Lucky(N2) then
    WriteLn('Yes')
  else
    WriteLn('No');
end.