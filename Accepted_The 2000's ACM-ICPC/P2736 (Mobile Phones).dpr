{Problem: 2736 - Mobile Phones
 ACM ICPC - Oceania - South Pacific - 2003/2004
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2736;
{$APPTYPE CONSOLE}
const
  abc: array ['a'..'z'] of Char = ('2','2','2',
                                   '3','3','3',
                                   '4','4','4',
                                   '5','5','5',
                                   '6','6','6',
                                   '7','7','7','7',
                                   '8','8','8',
                                   '9','9','9','9');
var
  d,codes: array [1..1000] of String[30];
  St: String;
  i,w_cnt,n_case: Integer;

procedure Trim(var St: String);
begin
  while St[1] = '0' do
    Delete(St,1,1);
  while St[Length(St)] = '0' do
    Delete(St,Length(St),1);
end;

function NextToken(var St: String): String;
begin
  St:=St+'0';
  Result:=Copy(St,1,Pos('0',St)-1);
  Delete(St,1,Pos('0',St));
end;

function Decode(St: String): String;
var
  r: array [1..10] of String;
  w,S: String;
  i,cnt: Integer;
begin
  Result:='';
  repeat
    Trim(St);
    w:=NextToken(St);
    cnt:=0;
    for i:=1 to w_cnt do
      if w = codes[i] then
        begin
          Inc(cnt);
          r[cnt]:=d[i];
        end;
    if cnt = 0 then
      begin
        S:='';
        for i:=1 to Length(w) do
          S:=S+'*'
      end
    else
      if cnt = 1 then
        S:=r[1]
      else
        begin
          S:='('+r[1];
          for i:=2 to cnt do
            S:=S+'|'+r[i];
          S:=S+')'
        end;
    Result:=Result+S+' ';
  until St = '';
end;

begin
  n_case:=0;
  ReadLn(St);
  while St <> '#' do
    begin
      w_cnt:=0;
      while St <> '#' do
        begin
          Inc(w_cnt);
          d[w_cnt]:=St;
          codes[w_cnt]:='';
          for i:=1 to Length(d[w_cnt]) do
            codes[w_cnt]:=codes[w_cnt]+abc[d[w_cnt,i]];
          ReadLn(St);
        end;
      Inc(n_case);
      WriteLn('SET ',n_case);
      ReadLn(St);
      Trim(St);
      while St <> '#' do
        begin
          St:=Decode(St);
          Trim(St);
          WriteLn(St);
          ReadLn(St);
        end;
      ReadLn(St);
      Trim(St);
    end;
end.