{Problem: 2935 - Subway tree systems
 ACM ICPC - Europe - Northwestern - 2003/2004
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2935;
{$APPTYPE CONSOLE}
const
  MaxL = 3000;

type
  TStr = array [1..MaxL div 2] of String;
    
var
  St1,St2: String;
  Test: Integer;

procedure QuickSort(var a: TStr; N: Integer);

  procedure QSort(l,r: Integer);
  var
    i,j: Integer;
    buf,x: String;
  begin
    i:=l;
    j:=r;
    x:=a[(l+r) div 2];
    repeat
      while a[i] < x do inc(i);
      while x < a[j] do dec(j);
      if i <= j then
        begin
          buf:=a[i]; a[i]:=a[j]; a[j]:=buf;
          inc(i); dec(j);
        end;
    until i > j;
    if i < r then QSort(i,r);
    if j > l then QSort(l,j);
  end;

begin
  QSort(1,N);
end;

function Sort(St: String): String;
var
  a: TStr;
  i,N,cnt: Integer;
begin
  Result:='';
  if St = '' then
    Exit;
  N:=0;
  repeat
    i:=0;
    cnt:=0;
    repeat
      inc(i);
      if St[i] = '1' then
        dec(cnt)
      else
        inc(cnt);
    until cnt = 0;
    inc(N);
    a[N]:='0'+Sort(Copy(St,2,i-2))+'1';
    Delete(St,1,i);
  until St = '';
  QuickSort(a,N);
  for i:=1 to N do
    Result:=Result+a[i];
end;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(St1);
      ReadLn(St2);
      if Sort(St1) = Sort(St2) then
        WriteLn('same')
      else
        WriteLn('different');
      Dec(Test);
    end;
end.