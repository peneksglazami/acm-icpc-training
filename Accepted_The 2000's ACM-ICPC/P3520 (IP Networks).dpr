{Problem: 3520 - IP Networks
 ACM ICPC - Europe - Northeastern Europe & Russian Republic - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
program Problem3520;
{$APPTYPE CONSOLE}
var
  a: array [1..1000] of String[32];
  i,j,m: Integer;
  St,IPNetwork,IPMask: String;
  ok: Boolean;

function ToStr(N: Integer): String;
var
  i: Integer;
begin
  Result:='';
  for i:=1 to 8 do
    begin
      if Odd(N) then
        Result:='1'+Result
      else
        Result:='0'+Result;
      N:=N div 2;
    end;
end;

function ToDec(St: String): Integer;
var
  i,n: Integer;
begin
  Result:=0;
  n:=1;
  for i:=8 downto 1 do
    begin
      if St[i] = '1' then
        Inc(Result,n);
      n:=2*n;
    end;
end;

procedure ToBin(St: String; num: Integer);
var
  i,n,Er: Integer;
begin
  St:=St+'.';
  a[num]:='';
  for i:=1 to 4 do
    begin
      Val(Copy(St,1,Pos('.',St)-1),n,Er);
      a[num]:=a[num]+ToStr(n);
      Delete(St,1,Pos('.',St));
    end;
end;

procedure PrintIP(St: String);
begin
  for i:=1 to 4 do
    begin
      Write(ToDec(Copy(St,(i-1)*8+1,8)));
      if i < 4 then
        Write('.')
      else
        WriteLn;
    end;
end;

begin
  while not EOF do
    begin
      ReadLn(m);
      for i:=1 to m do
        begin
          ReadLn(St);
          ToBin(St,i);
        end;
      i:=0;
      IPNetwork:='';
      IPMask:='';
      ok:=True;
      j:=1;
      repeat
        for i:=2 to m do
          ok:=ok and (a[i][j] = a[i-1][j]);
        if ok then
          begin
            IPNetwork:=IPNetwork+a[1][j];
            IPMask:=IPMask+'1';
            Inc(j);
          end;
      until not ok or (j > 32);
      for i:=j to 32 do
        begin
          IPNetwork:=IPNetwork+'0';
          IPMask:=IPMask+'0';
        end;
      PrintIP(IPNetwork);
      PrintIP(IPMask);
    end;
end.