{Problem: 2450 - Team them up!
 ACM ICPC - Europe - Northeastern - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2450;
{$APPTYPE CONSOLE}
const
  MaxN = 100;

var
  a: array [1..MaxN,1..MaxN] of Boolean;
  c,gg: array [1..MaxN] of Integer;
  g: array [1..MaxN,1..2] of Integer;
  p: array [0..Maxn,0..MaxN] of Integer;
  d: array [0..MaxN] of Boolean;
  i,j,k,g_cnt,N,Test,t1: Integer;
  F,S: Set of 1..MaxN;
  Ok: Boolean;

procedure DFS(i,col,g_num: Integer);
var
  j: Integer;
begin
  inc(g[g_num,col]);
  c[i]:=col;
  gg[i]:=g_num;
  for j:=1 to N do
    begin
      if a[i,j] then
        if c[j] = 0 then
          begin
            if col = 1 then
              DFS(j,2,g_num)
            else
              DFS(j,1,g_num);
          end
        else
          if c[i] = c[j] then
            begin
              Ok:=False;
              Exit;
            end;
      if not Ok then
        Exit;
    end;
end;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn;
      Read(N);
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=False;
      for i:=1 to N do
        begin
          Read(j);
          while j <> 0 do
            begin
              a[i,j]:=True;
              Read(j);
            end;
        end;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          begin
            a[i,j]:=not (a[i,j] and a[j,i]);
            a[j,i]:=a[i,j];
          end;
      OK:=True;
      for i:=1 to N do
        c[i]:=0;
      g_cnt:=0;
      for i:=1 to N do
        if c[i] = 0 then
          begin
            inc(g_cnt);
            g[g_cnt,1]:=0;
            g[g_cnt,2]:=0;
            DFS(i,1,g_cnt);
            if not Ok then
              Break;
          end;
      if Ok then
        begin
          for i:=1 to N do
            begin
              p[i,1]:=0;
              p[i,2]:=0;
            end;
          for i:=1 to N do
            d[i]:=False;
          d[0]:=True;
          for i:=0 to g_cnt do
            for j:=0 to MaxN do
              p[i,j]:=0;
          p[0,0]:=1;    
          for i:=1 to g_cnt do
            for j:=0 to MaxN do
              if p[i-1,j] <> 0 then
                begin
                  p[i,j+g[i,1]]:=1;
                  d[j+g[i,1]]:=True;
                  p[i,j+g[i,2]]:=2;
                  d[j+g[i,2]]:=True;
                end;
          t1:=N div 2;
          while not d[t1] do
            dec(t1);
          i:=g_cnt; j:=t1;
          F:=[];
          while i <> 0 do
            begin
              for k:=1 to N do
                if (gg[k] = i) and (c[k] = p[i,j]) then
                  F:=F+[k];
              dec(j,g[i,p[i,j]]);
              dec(i);
            end;
          S:=[1..N]-F;
          Write(t1);
          for i:=1 to N do
            if i in F then
              Write(' ',i);
          WriteLn;
          Write(N-t1);
          for i:=1 to N do
            if i in S then
              Write(' ',i);
          WriteLn;
        end
      else
        WriteLn('No solution');
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.