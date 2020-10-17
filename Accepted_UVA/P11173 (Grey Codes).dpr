{Problem: 11173 - Grey Codes
 Problem setter: Igor Naverniouk
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program P_I;
{$APPTYPE CONSOLE}
var
  i,T,k,n,Res: Integer;
  a: array [0..31] of Integer;
  b: array [0..31] of Integer;

procedure Rec(i: Integer; By: Boolean);
begin
  if i = 0 then
    Exit;
  if a[i] = 1 then
    if by then
      begin
        inc(Res,b[i]);
        Rec(i-1,False);
      end
    else
      Rec(i-1,False)
  else
    if by then
      Rec(i-1,True)
    else
      begin
        inc(Res,b[i]);
        Rec(i-1,True);
      end;
end;

begin
  ReadLn(T);
  b[1]:=1;
  for i:=2 to 30 do
    b[i]:=b[i-1]*2;
  while T > 0 do
    begin
      ReadLn(n,k);
      FillChar(a,SizeOf(a),0);
      i:=0;
      while k > 0 do
        begin
          inc(i);
          a[i]:=k mod 2;
          k:=k div 2;
        end;
      Res:=0;
      Rec(n,True);
      WriteLn(Res);
      dec(T);
    end;
end.