{Problem: 2539 - Jungle Roads
 ACM ICPC - North America - Mid Central - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2539;
Const
  MaxM = 75;
  MaxN = 26;

Var
  b: Array [1..MaxN] of Integer;
  m: Array [1..MaxM,1..3] of Integer;
  i,j,buf,N,K,m_cnt,Sum: Integer;
  Ch: Char;

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
  ReadLn(N);
  While N <> 0 do
    Begin
      m_cnt:=0;
      for i:=1 to N-1 do
        Begin
          Read(Ch,K);
          While K > 0 do
            Begin
              Read(Ch,Ch);
              Inc(m_cnt);
              m[m_cnt,1]:=i;
              m[m_cnt,2]:=Ord(Ch)-Ord('A')+1;
              Read(m[m_cnt,3]);
              Dec(K);
            end;
          ReadLn;
        end;
      for i:=1 to m_cnt-1 do
        for j:=i+1 to m_cnt do
          if m[i,3] > m[j,3] then
            Begin
              buf:=m[i,1]; m[i,1]:=m[j,1]; m[j,1]:=buf;
              buf:=m[i,2]; m[i,2]:=m[j,2]; m[j,2]:=buf;
              buf:=m[i,3]; m[i,3]:=m[j,3]; m[j,3]:=buf;
            end;
      for i:=1 to N do
        b[i]:=i;
      K:=0;
      i:=1;
      Sum:=0;
      Repeat
        if (b[m[i,1]] <> b[m[i,2]]) then
          Begin
            Inc(K);
            Inc(Sum,m[i,3]);
            Mark(b[m[i,1]],b[m[i,2]]);
          end;
        Inc(i);
      Until K = N-1;
      WriteLn(Sum);
      ReadLn(N);
    end;
end.
