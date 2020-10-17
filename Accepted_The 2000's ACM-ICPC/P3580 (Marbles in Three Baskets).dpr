{Problem: 3580 - Marbles in Three Baskets
 ACM ICPC - North America - Rocky Mountain - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3580;
{$APPTYPE CONSOLE}
const
  MaxN = 60;

var
  t: array [0..MaxN,0..MaxN,0..MaxN] of Word;
  p: array [0..MaxN,0..MaxN,0..MaxN] of record a,b,c: Byte end;
  s1,s2: array [1..MaxN*MaxN] of record a,b,c: Byte; end;
  a,b,c,d,i,j,ss1,ss2: Integer;

procedure PrintPath(a,b,c: Integer);
begin
  if t[a,b,c] > 2 then
    PrintPath(p[a,b,c].a,p[a,b,c].b,p[a,b,c].c);
  WriteLn(a:4,b:4,c:4);
end;

begin
  while not EOF do
    begin
      FillChar(t,SizeOf(t),0);
      ReadLn(a,b,c);
      WriteLn(a:4,b:4,c:4);
      if ((a+b+c) mod 3 <> 0) or ((a = b) and (b = c)) then
        begin
          WriteLn('============');
          continue;
        end;
      d:=(a+b+c) div 3;
      t[a,b,c]:=1;
      ss1:=1;
      s1[1].a:=a;
      s1[1].b:=b;
      s1[1].c:=c;
      repeat
        ss2:=ss1;
        s2:=s1;
        ss1:=0;
        for i:=1 to ss2 do
          begin
            a:=s2[i].a;
            b:=s2[i].b;
            c:=s2[i].c;
            if a >= b then
              if t[a-b,2*b,c] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=a-b;
                  s1[ss1].b:=2*b;
                  s1[ss1].c:=c;
                  t[a-b,2*b,c]:=t[a,b,c]+1;
                  p[a-b,2*b,c].a:=a;
                  p[a-b,2*b,c].b:=b;
                  p[a-b,2*b,c].c:=c;
                end;
            if a >= c then
              if t[a-c,b,2*c] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=a-c;
                  s1[ss1].b:=b;
                  s1[ss1].c:=2*c;
                  t[a-c,b,2*c]:=t[a,b,c]+1;
                  p[a-c,b,2*c].a:=a;
                  p[a-c,b,2*c].b:=b;
                  p[a-c,b,2*c].c:=c;
                end;
            if b >= a then
              if t[2*a,b-a,c] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=2*a;
                  s1[ss1].b:=b-a;
                  s1[ss1].c:=c;
                  t[2*a,b-a,c]:=t[a,b,c]+1;
                  p[2*a,b-a,c].a:=a;
                  p[2*a,b-a,c].b:=b;
                  p[2*a,b-a,c].c:=c;
                end;
            if b >= c then
              if t[a,b-c,2*c] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=a;
                  s1[ss1].b:=b-c;
                  s1[ss1].c:=2*c;
                  t[a,b-c,2*c]:=t[a,b,c]+1;
                  p[a,b-c,2*c].a:=a;
                  p[a,b-c,2*c].b:=b;
                  p[a,b-c,2*c].c:=c;
                end;
            if c >= a then
              if t[2*a,b,c-a] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=2*a;
                  s1[ss1].b:=b;
                  s1[ss1].c:=c-a;
                  t[2*a,b,c-a]:=t[a,b,c]+1;
                  p[2*a,b,c-a].a:=a;
                  p[2*a,b,c-a].b:=b;
                  p[2*a,b,c-a].c:=c;
                end;
            if c >= b then
              if t[a,2*b,c-b] = 0 then
                begin
                  inc(ss1);
                  s1[ss1].a:=a;
                  s1[ss1].b:=2*b;
                  s1[ss1].c:=c-b;
                  t[a,2*b,c-b]:=t[a,b,c]+1;
                  p[a,2*b,c-b].a:=a;
                  p[a,2*b,c-b].b:=b;
                  p[a,2*b,c-b].c:=c;
                end;
          end;
      until (t[d,d,d] <> 0) or (ss1 = 0);
      if t[d,d,d] > 0 then
        PrintPath(d,d,d);
      WriteLn('============');
    end;
end.