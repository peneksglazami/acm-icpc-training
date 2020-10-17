{Problem: 10131 - Is Bigger Smarter?
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10131 (input,output);
Var
  w,s,num,len,pre: Array [1..1000] of Integer;
  i,j,n,max: Integer;

Procedure Print(i: Integer);
Begin
  if pre[i] <> 0 then
    Print(pre[i]);
  WriteLn(num[i]);
end;

Procedure Sort(l,r: Integer);
Var
  i,j,x,buf: Integer;
Begin
  i:=l;
  j:=r;
  x:=w[(l+r)div 2];
  Repeat
    While w[i] < x do Inc(i);
    While w[j] > x do Dec(j);
    if i <= j then
      Begin
        buf:=w[i]; w[i]:=w[j]; w[j]:=buf;
        buf:=s[i]; s[i]:=s[j]; s[j]:=buf;
        buf:=num[i]; num[i]:=num[j]; num[j]:=buf;
        Inc(i); Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Begin
  n:=0;
  While not EOF do
    Begin
      Inc(n);
      ReadLn(w[n],s[n]);
      num[n]:=n;
      len[n]:=1;
    end;
  Sort(1,n);
  FillChar(pre,SizeOf(pre),0);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if s[i] > s[j] then
        if len[i]+1 > len[j] then
          Begin
            len[j]:=len[i]+1;
            pre[j]:=i;
          end;
  max:=1;
  for i:=2 to n do
    if len[i] > len[max] then
      max:=i;
  WriteLn(len[max]);
  Print(max);
end.