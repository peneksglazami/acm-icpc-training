{Problem: 3203 - A Card Trick
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3203;
{$APPTYPE CONSOLE}
var
  card: array [1..5] of String;
  num: array [1..5] of Integer;
  a: array [1..5] of Integer;
  v: array [1..5] of Boolean;
  i,j,buf,n_case,N: Integer;
  St,buf_st: String;
  Find: Boolean;

function NextToken(var St: String): String;
begin
  Result:=Copy(St,1,Pos(' ',St)-1);
  Delete(St,1,Pos(' ',St));
end;

function get_num(St: String): Integer;
const
  suit = 'CDHS';
  value = 'A234567891JQK';
begin
  Result:=4*(Pos(St[1],value)-1)+Pos(St[Length(St)],suit);
end;

function value(num: Integer): Integer;
begin
  Result:=num div 4;
  if num mod 4 <> 0 then
    Inc(Result);
end;

function suit(num: Integer): Integer;
begin
  if num mod 4 = 0 then
    Result:=4
  else
    Result:=num mod 4;
end;

function IsCorrect: Boolean;
var
  order: array [1..2] of integer;
  i,j,min,imin,val: Integer;
begin
  imin:=3;
  for i:=4 to 5 do
    if num[a[imin]] > num[a[i]] then
      imin:=i;
  val:=imin+value(num[a[2]])-2;
  j:=0;
  for i:=3 to 5 do
    if i <> imin then
      begin
        inc(j);
        order[j]:=num[a[i]];
      end;
  if order[1] > order[2] then
    Inc(val,3);
  if val mod 13 = 0 then
    val:=13
  else
    val:=val mod 13;
  Result:=num[a[1]] = (val-1)*4+suit(num[a[2]]);
end;

procedure Solve(i: Integer);
var
  j: Integer;
begin
  if i = 6 then
    Find:=IsCorrect
  else
    for j:=1 to 5 do
      if not v[j] then
        begin
          v[j]:=True;
          a[i]:=j;
          Solve(i+1);
          if Find then
            Exit;
          v[j]:=False;
        end;
end;

begin
  ReadLn(N);
  for n_case:=1 to N do
    begin
      ReadLn(St);
      St:=St+' ';
      for i:=1 to 5 do
        begin
          card[i]:=NextToken(St);
          num[i]:=get_num(card[i]);
        end;
      for i:=1 to 4 do
        for j:=i+1 to 5 do
          if num[i] > num[j] then
            begin
              buf:=num[i]; num[i]:=num[j]; num[j]:=buf;
              buf_st:=card[i]; card[i]:=card[j]; card[j]:=buf_st;
            end;
      FillChar(v,SizeOf(v),False);
      Find:=False;
      Solve(1);
      Write('Problem ',n_case,':');
      for i:=1 to 5 do
        Write(' ',card[a[i]]);
      WriteLn;
    end;
end.