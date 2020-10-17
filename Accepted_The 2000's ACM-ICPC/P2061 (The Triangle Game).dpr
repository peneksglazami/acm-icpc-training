{Problem: 2061 - The Triangle Game
 ACM ICPC - North America - Mid Central - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2061;
{$APPTYPE CONSOLE}
var
  a: array [1..7] of Integer;
  b: array [1..6] of Integer;
  v: array [1..6] of Boolean;
  t,tt: array [1..6,1..3] of Integer;
  i,s,max: Integer;
  St: String;

procedure add;
var
  i: Integer;
begin
  i:=1;
  while a[i] = 3 do
    begin
      a[i]:=1;
      Inc(i);
    end;
  Inc(a[i]);
end;

function next(i: Integer): Integer;
begin
  if i = 3 then
    next:=1
  else
    next:=i+1;
end;

function pre(i: Integer): Integer;
begin
  if i = 1 then
    pre:=3
  else
    pre:=i-1;
end;

function correct: Boolean;
var
  i: Integer;
begin
  Result:=False;
  for i:=1 to 5 do
    if tt[i,next(a[i])] <> tt[i+1,pre(a[i+1])] then
      Exit;
  Result:=tt[6,next(a[6])] = tt[1,pre(a[1])];
end;

procedure solve(i: Integer);
var
  j: Integer;
begin
  if i = 7 then
    begin
      for j:=1 to 6 do
        tt[j]:=t[b[j]];
      for i:=1 to 6 do
        a[i]:=1;
      a[7]:=0;
      repeat
        if correct then
          begin
            s:=0;
            for i:=1 to 6 do
              Inc(s,tt[i,a[i]]);
            if s > max then
              max:=s;
          end;
        add;
      until a[7] = 1;
    end
  else
    for j:=1 to 6 do
      if not v[j] then
        begin
          v[j]:=True;
          b[i]:=j;
          Solve(i+1);
          v[j]:=False;
        end;
end;

begin
  FillChar(v,SizeOf(v),False);
  repeat
    for i:=1 to 6 do
      ReadLn(t[i,1],t[i,2],t[i,3]);
    ReadLn(St);
    for i:=1 to 6 do
      a[i]:=1;
    a[7]:=0;
    max:=-1;
    Solve(1);
    if max = -1 then
      WriteLn('none')
    else
      WriteLn(max);
  until St = '$';
end.