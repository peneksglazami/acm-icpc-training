{Problem: 2216 - Flip Game
 ACM ICPC - Europe - Northeastern - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2216;
{$APPTYPE CONSOLE}
const
  dir: array [1..5,1..2] of Integer = ((0,0),(1,0),(0,1),(-1,0),(0,-1));

var
  a: array [0..65535] of Integer;
  cur,ss: array [0..65535] of Word;
  t,t_cur: array [0..5,0..5] of Byte;
  i,j,g,k,m,num,nn: Integer;
  St: String;

begin
  while not EOF do
    begin
      num:=0;
      for i:=1 to 4 do
        begin
          ReadLn(St);
          for j:=1 to 4 do
            begin
              num:=num shl 1;
              if St[j] = 'b' then
                inc(num);
            end;
        end;
      for i:=0 to 65535 do
        a[i]:=MaxInt;
      a[num]:=0;
      cur[0]:=1;
      cur[1]:=num;
      repeat
        ss:=cur;
        cur[0]:=0;
        for i:=1 to ss[0] do
          begin
            num:=ss[i];
            for j:=4 downto 1 do
              for g:=4 downto 1 do
                begin
                  t_cur[j,g]:=num and 1;
                  num:=num shr 1;
                end;
            for j:=1 to 4 do
              for g:=1 to 4 do
                begin
                  t:=t_cur;
                  for k:=1 to 5 do
                    t[j+dir[k,1],g+dir[k,2]]:=1-t[j+dir[k,1],g+dir[k,2]];
                  num:=0;
                  for k:=1 to 4 do
                    for m:=1 to 4 do
                      begin
                        num:=num shl 1;
                        inc(num,t[k,m]);
                      end;
                  if a[num] = MaxInt then
                    begin
                      inc(cur[0]);
                      cur[cur[0]]:=num;
                      a[num]:=a[ss[i]]+1;
                    end;
                end;
          end;
      until (a[0] <> MaxInt) or (a[65535] <> MaxInt) or (cur[0] = 0);
      if (a[0] = MaxInt) and (a[65535] = MaxInt) then
        WriteLn('Impossible')
      else
        if a[0] < a[65535] then
          WriteLn(a[0])
        else
          WriteLn(a[65535]);  
    end;
end.