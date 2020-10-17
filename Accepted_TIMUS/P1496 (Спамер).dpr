{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program P_H;
{$APPTYPE CONSOLE}
var
  St: array [1..100] of String[30];
  a: array [1..100] of Integer;
  i,j,cnt,N: Integer;
  OK: Boolean;
  S: String;

begin
  ReadLn(N);
  for i:=1 to N do
    begin
      ReadLn(S);
      Ok:=True;
      for j:=1 to cnt do
        if St[j] = S then
          begin
            inc(a[j]);
            Ok:=False;
          end;
      if Ok then
        begin
          inc(cnt);
          a[cnt]:=1;
          St[cnt]:=S;
        end;
    end;
  for i:=1 to cnt do
    if a[i] > 1 then
      WriteLn(St[i]);
end.