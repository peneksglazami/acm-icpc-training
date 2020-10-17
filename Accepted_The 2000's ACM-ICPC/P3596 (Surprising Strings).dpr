{Problem: 3596 - Surprising Strings
 ACM ICPC - North America - Mid Central - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3596;
{$APPTYPE CONSOLE}
var
  a: array ['A'..'Z','A'..'Z'] of Boolean;
  St: String;
  i,d: Integer;
  ok: Boolean;

procedure Trim(var St: String);
begin
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

begin
  ReadLn(St);
  Trim(St);
  while St <> '*' do
    begin
      ok:=True;
      for d:=1 to Length(St)-1 do
        begin
          FillChar(a,SizeOf(a),False);
          for i:=1 to Length(St)-d do
            if a[St[i],St[i+d]] then
              begin
                ok:=False;
                Break;
              end
            else
              a[St[i],St[i+d]]:=True;
          if not ok then
            Break;
        end;
      if ok then
        WriteLn(St+' is surprising.')
      else
        WriteLn(St+' is NOT surprising.');
      ReadLn(St);
      Trim(St);
    end;
end.