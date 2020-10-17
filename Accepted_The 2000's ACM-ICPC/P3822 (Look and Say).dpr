{Problem: 3822 - Look and Say
 ACM ICPC - North America - Rocky Mountain - 2007/2008
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3822;
{$APPTYPE CONSOLE}
var
  st: String;
  i, cnt, Test: Integer;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(St);
      cnt := 1;
      for i := 2 to Length(st) do
        if st[i - 1] = st[i] then
          inc(cnt)
        else
          begin
            Write(cnt, st[i - 1]);
            cnt := 1;
          end;
      WriteLn(cnt, st[Length(st)]);
      dec(Test);
    end;
end.