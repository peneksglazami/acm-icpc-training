{Problem: 3639 - Prime Path
 ACM ICPC - Europe - Northwestern - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3639;
{$APPTYPE CONSOLE}
const
  MaxN = 1000;

var
  a: array [0..9999] of Boolean;
  b: array [0..9999] of Integer;
  s1,s2: array [0..MaxN] of Integer;
  i,j,Test,S,F: Integer;
  ok: Boolean;

procedure Fill(num, step: Integer);
var
  i,j,start,x,Er: Integer;
  St,S: String;
begin
  Str(num,St);
  for i:=1 to 4 do
    begin
      if i = 1 then
        start:=1
      else
        start:=0;
      for j:=start to 9 do
        begin
          S:=Copy(St,1,i-1)+Chr(Ord('0')+j)+Copy(St,i+1,4-i);
          Val(S,x,Er);
          if a[x] and (b[x] = 0) then
            begin
              inc(s1[0]);
              s1[s1[0]]:=x;
              b[x]:=step;
            end;
        end;
    end;
end;

begin
  a[2]:=True;
  for i:=3 to 9999 do
    begin
      ok:=i mod 2 = 1;
      j:=3;
      while ok and (j*j <= i) do
        begin
          ok:=i mod j <> 0;
          inc(j,2);
        end;
      a[i]:=ok;
    end;
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(S,F);
      FillChar(b,sizeOf(b),0);
      b[S]:=1;
      s1[0]:=1;
      s1[1]:=S;
      repeat
        s2:=s1;
        s1[0]:=0;
        for j:=1 to s2[0] do
          Fill(s2[j],b[s2[j]]+1);
      until (s1[0] = 0) or (b[F] <> 0);
      if b[F] = 0 then
        WriteLn('Impossible')
      else
        WriteLn(b[F]-1);
      dec(Test);
    end;
end.