{Problem: 10047 - The Monocycle
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10047 (input,output);
Const
  MaxN = 25;
  MaxM = 25;

Var
  a: Array [0..MaxN+1,0..MaxM+1] of Char;
  t: Array [1..MaxN,1..MaxM,1..4,1..5] of Integer; {1 - north; 2 - east; 3 - south; 4 - west}
  s,ss: Array [1..7*MaxN*MaxM] of Record r,c,d,col: Byte; end;
  i,j,g,h,n_case,N,M,sr,sc,tr,tc,s_cnt,ss_cnt,min: Integer;

Function next(i: Integer): Integer;
Begin
  if i < 5 then
    next:=i+1
  else
    next:=1;
end;

Function left(i: Integer): Integer;
Begin
  if i > 1 then
    left:=i-1
  else
    left:=4;
end;

Function right(i: Integer): Integer;
Begin
  if i < 4 then
    right:=i+1
  else
    right:=1;
end;

Begin
  n_case:=0;
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      for i:=0 to N+1 do
        Begin
          a[i,0]:='#';
          a[i,M+1]:='#';
        end;
      for i:=0 to M+1 do
        Begin
          a[0,i]:='#';
          a[N+1,i]:='#';
        end;
      for i:=1 to N do
        Begin
          for j:=1 to M do
            Begin
              Read(a[i,j]);
              Case a[i,j] of
                'S': Begin
                       sr:=i; sc:=j;
                     end;
                'T': Begin
                       tr:=i; tc:=j;
                     end;
               end;
            end;
          ReadLn;
        end;
      for i:=1 to N do
        for j:=1 to M do
          for g:=1 to 4 do
            for h:=1 to 5 do
              t[i,j,g,h]:=-1;
      t[sr,sc,1,1]:=0;
      s_cnt:=1;
      s[1].r:=sr;
      s[1].c:=sc;
      s[1].d:=1;
      s[1].col:=1;
      Repeat
        ss_cnt:=s_cnt;
        ss:=s;
        s_cnt:=0;
        for i:=1 to ss_cnt do
          Begin
            Case ss[i].d of
              1: Begin
                   if a[ss[i].r-1,ss[i].c] <> '#' then
                     if t[ss[i].r-1,ss[i].c,ss[i].d,next(ss[i].col)] =-1 then
                       Begin
                         t[ss[i].r-1,ss[i].c,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                         Inc(s_cnt);
                         s[s_cnt].r:=ss[i].r-1;
                         s[s_cnt].c:=ss[i].c;
                         s[s_cnt].d:=ss[i].d;
                         s[s_cnt].col:=next(ss[i].col);
                       end
                     else
                       if t[ss[i].r-1,ss[i].c,ss[i].d,next(ss[i].col)] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                         Begin
                           t[ss[i].r-1,ss[i].c,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                           Inc(s_cnt);
                           s[s_cnt].r:=ss[i].r-1;
                           s[s_cnt].c:=ss[i].c;
                           s[s_cnt].d:=ss[i].d;
                           s[s_cnt].col:=next(ss[i].col);
                         end;

                 end;
              2: Begin
                   if a[ss[i].r,ss[i].c+1] <> '#' then
                     if t[ss[i].r,ss[i].c+1,ss[i].d,next(ss[i].col)] =-1 then
                       Begin
                         t[ss[i].r,ss[i].c+1,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                         Inc(s_cnt);
                         s[s_cnt].r:=ss[i].r;
                         s[s_cnt].c:=ss[i].c+1;
                         s[s_cnt].d:=ss[i].d;
                         s[s_cnt].col:=next(ss[i].col);
                       end
                     else
                       if t[ss[i].r,ss[i].c+1,ss[i].d,next(ss[i].col)] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                         Begin
                           t[ss[i].r,ss[i].c+1,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                           Inc(s_cnt);
                           s[s_cnt].r:=ss[i].r;
                           s[s_cnt].c:=ss[i].c+1;
                           s[s_cnt].d:=ss[i].d;
                           s[s_cnt].col:=next(ss[i].col);
                         end;
                 end;
              3: Begin
                   if a[ss[i].r+1,ss[i].c] <> '#' then
                     if t[ss[i].r+1,ss[i].c,ss[i].d,next(ss[i].col)] =-1 then
                       Begin
                         t[ss[i].r+1,ss[i].c,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                         Inc(s_cnt);
                         s[s_cnt].r:=ss[i].r+1;
                         s[s_cnt].c:=ss[i].c;
                         s[s_cnt].d:=ss[i].d;
                         s[s_cnt].col:=next(ss[i].col);
                       end
                     else
                       if t[ss[i].r+1,ss[i].c,ss[i].d,next(ss[i].col)] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                         Begin
                           t[ss[i].r+1,ss[i].c,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                           Inc(s_cnt);
                           s[s_cnt].r:=ss[i].r+1;
                           s[s_cnt].c:=ss[i].c;
                           s[s_cnt].d:=ss[i].d;
                           s[s_cnt].col:=next(ss[i].col);
                         end;
                 end;
              4: Begin
                   if a[ss[i].r,ss[i].c-1] <> '#' then
                     if t[ss[i].r,ss[i].c-1,ss[i].d,next(ss[i].col)] =-1 then
                       Begin
                         t[ss[i].r,ss[i].c-1,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                         Inc(s_cnt);
                         s[s_cnt].r:=ss[i].r;
                         s[s_cnt].c:=ss[i].c-1;
                         s[s_cnt].d:=ss[i].d;
                         s[s_cnt].col:=next(ss[i].col);
                       end
                     else
                       if t[ss[i].r,ss[i].c-1,ss[i].d,next(ss[i].col)] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                         Begin
                           t[ss[i].r,ss[i].c-1,ss[i].d,next(ss[i].col)]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                           Inc(s_cnt);
                           s[s_cnt].r:=ss[i].r;
                           s[s_cnt].c:=ss[i].c-1;
                           s[s_cnt].d:=ss[i].d;
                           s[s_cnt].col:=next(ss[i].col);
                         end;
                 end;
             end;
            if t[ss[i].r,ss[i].c,left(ss[i].d),ss[i].col] = -1 then
              Begin
                t[ss[i].r,ss[i].c,left(ss[i].d),ss[i].col]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                Inc(s_cnt);
                s[s_cnt].r:=ss[i].r;
                s[s_cnt].c:=ss[i].c;
                s[s_cnt].d:=left(ss[i].d);
                s[s_cnt].col:=ss[i].col;
              end
            else
              if t[ss[i].r,ss[i].c,left(ss[i].d),ss[i].col] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                Begin
                  t[ss[i].r,ss[i].c,left(ss[i].d),ss[i].col]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                  Inc(s_cnt);
                  s[s_cnt].r:=ss[i].r;
                  s[s_cnt].c:=ss[i].c;
                  s[s_cnt].d:=left(ss[i].d);
                  s[s_cnt].col:=ss[i].col;
                end;
            if t[ss[i].r,ss[i].c,right(ss[i].d),ss[i].col] = -1 then
              Begin
                t[ss[i].r,ss[i].c,right(ss[i].d),ss[i].col]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                Inc(s_cnt);
                s[s_cnt].r:=ss[i].r;
                s[s_cnt].c:=ss[i].c;
                s[s_cnt].d:=right(ss[i].d);
                s[s_cnt].col:=ss[i].col;
              end
            else
              if t[ss[i].r,ss[i].c,right(ss[i].d),ss[i].col] > t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1 then
                Begin
                  t[ss[i].r,ss[i].c,right(ss[i].d),ss[i].col]:=t[ss[i].r,ss[i].c,ss[i].d,ss[i].col]+1;
                  Inc(s_cnt);
                  s[s_cnt].r:=ss[i].r;
                  s[s_cnt].c:=ss[i].c;
                  s[s_cnt].d:=right(ss[i].d);
                  s[s_cnt].col:=ss[i].col;
                end;
          end;
      Until s_cnt = 0;
      min:=-1;
      for i:=1 to 4 do
        if t[tr,tc,i,1] <> -1 then
          if min = -1 then
            min:=t[tr,tc,i,1]
          else
            if t[tr,tc,i,1] < min then
              min:=t[tr,tc,i,1];
      Inc(n_case);
      WriteLn('Case #',n_case);
      if min = -1 then
        WriteLn('destination not reachable')
      else
        WriteLn('minimum time = ',min,' sec');
      ReadLn(N,M);
      if (N <> 0) or (M <> 0) then
        WriteLn;
    end;
end.