{Problem: 3380 - Single Digit Adder
 ACM ICPC - North America - Pacific Northwest - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3380;
{$APPTYPE CONSOLE}
var
  St: String;

procedure Trim(var St: String);
begin
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

function calc(st: String): Integer;
var
  i,j,b_cnt,res,Er: Integer;
  S: String;
  op: Char;
begin
  while Pos('(',St) <> 0 do
    begin
      i:=Pos('(',St);
      b_cnt:=1;
      j:=i+1;
      while b_cnt > 0 do
        begin
          if St[j] = '(' then
            Inc(b_cnt)
          else
            if St[j] = ')' then
              Dec(b_cnt);
          Inc(j);
        end;
      Dec(j);
      res:=calc(Copy(St,i+1,j-i-1));
      Delete(St,i,j-i+1);
      if (res < 0) and (i >= 2) then
        begin
          case St[i-1] of
            '-': St[i-1]:='+';
            '+': St[i-1]:='-';
          end;
          res:=Abs(res);
        end;
      Str(res,S);
      Insert(S,St,i);
    end;
  if St[1] in ['0'..'9'] then
    St:='+'+St;
  Result:=0;
  while st <> '' do
    begin
      op:=St[1];
      i:=2;
      S:='';
      while (i <= Length(St)) and (St[i] in ['0'..'9']) do
        begin
          S:=S+St[i];
          Inc(i);
        end;
      Delete(St,1,i-1);
      Val(S,res,Er);
      case op of
        '+': Inc(Result,res);
        '-': Dec(Result,res);
      end;
    end;
end;

begin
  while not EOF do
    begin
      ReadLn(St);
      Trim(St);
      WriteLn(calc(St));
    end;
end.