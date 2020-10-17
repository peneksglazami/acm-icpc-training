{Problem: 2515 - Networking
 ACM ICPC - Europe - Southeastern - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2515;
Const
  MaxN = 50;
  MaxL = 100;

Var
  a: Array [1..50,1..50] of Integer;
  b: Array [1..50] of Integer;
  m: Array [1..MaxN*(MaxN-1) div 2,1..3] of Integer;
  i,j,N,K,x,y,L,m_cnt,Sum: Integer;

Procedure Sort(l,r: Integer);
Var
  i,j,x,buf: Integer;
Begin
  i:=l; j:=r;
  x:=m[(l+r) div 2,3];
  Repeat
    While m[i,3] < x do Inc(i);
    While x < m[j,3] do Dec(j);
    if i <= j then
      Begin
        buf:=m[i,1]; m[i,1]:=m[j,1]; m[j,1]:=buf;
        buf:=m[i,2]; m[i,2]:=m[j,2]; m[j,2]:=buf;
        buf:=m[i,3]; m[i,3]:=m[j,3]; m[j,3]:=buf;
        Inc(i); Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Procedure Mark(aa,bb: Integer);
Var
  i,buf: Integer;
Begin
  if aa > bb then
    Begin
      buf:=aa; aa:=bb; bb:=buf;
    end;
  for i:=1 to N do
    if b[i] = bb then
      b[i]:=aa;  
end;

Begin
  Read(N);
  While N <> 0 do
    Begin
      ReadLn(K);
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=MaxL+1;
      for i:=1 to K do
        Begin
          ReadLn(x,y,l);
          if a[x,y] > l then
            a[x,y]:=l;
        end;
      m_cnt:=0;
      for i:=1 to N do
        for j:=1 to N do
          if a[i,j] <= MaxL then
            Begin
              Inc(m_cnt);
              m[m_cnt,1]:=i;
              m[m_cnt,2]:=j;
              m[m_cnt,3]:=a[i,j];
            end;
      if m_cnt > 0 then
        Sort(1,m_cnt);
      for i:=1 to N do
        b[i]:=i;
      K:=0;
      i:=0;
      Sum:=0;
      While K < N-1 do
        Begin
          Inc(i);
          if b[m[i,1]] <> b[m[i,2]] then
            Begin
              Inc(K);
              Inc(Sum,m[i,3]);
              Mark(b[m[i,1]],b[m[i,2]]);
            end;
        end;
      WriteLn(Sum);
      Read(N);
    end;
end.