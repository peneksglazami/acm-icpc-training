{Problem: 3594 - Quicksum
 ACM ICPC - North America - Mid Central - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3594;
{$APPTYPE CONSOLE}
var
  St: String;

procedure Trim(var St: String);
begin
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

function Quicksum(const St: String): Integer;
var
  i: Integer;
begin
  Result:=0;
  for i:=1 to Length(St) do
    if St[i] <> ' ' then
      Result:=Result+i*(Ord(St[i])-Ord('A')+1);
end;

begin
  ReadLn(St);
  Trim(St);
  while St <> '#' do
    begin
      WriteLn(Quicksum(St));
      ReadLn(St);
      Trim(St);
    end;
end.