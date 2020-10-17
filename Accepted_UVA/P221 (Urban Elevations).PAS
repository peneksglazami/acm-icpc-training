{Problem: 221 - Urban Elevations
 ACM ICPC World Finals - 1992 - Problem G
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem221 (input,output);
Const
  MaxN = 100;

Var
  x,y,w,d,h: Array [1..MaxN] of Double;
  v: Array [1..MaxN] of Integer;
  s: Array [1..MaxN] of Record l,r: Double; end;
  i,j,N,topS,topV,buf,map: Integer;

Procedure Cross(x1,x2: Double);
Var
  i,j,k,m: Integer;
  kk,mm: Boolean;

Procedure DeleteDot;
Var
  i,j: Integer;
Begin
  i:=1;
  While i <= topS do
    Begin
      if s[i].l = s[i].r then
        Begin
          for j:=i+1 to topS do
            s[j-1]:=s[j];
          Dec(topS);
        end
      else
        Inc(i);
    end;
end;

Begin
  if (x2 <= s[1].l) or (x1 >= s[topS].r) then
    Exit;
  k:=1;
  While s[k].r < x1 do
    Inc(k);
  kk:=(s[k].l <= x1);
  m:=topS;
  While s[m].l > x2 do
    Dec(m);
  mm:=(s[m].r >= x2);
  if kk and mm and (m = k) then
    Begin
      Inc(topS);
      for i:=topS downto m+1 do
        s[i]:=s[i-1];
      s[m+1].l:=x2;
      s[k].r:=x1;
      DeleteDot;
      Exit;
    end;
  if kk and (x1 <> s[k].l) then
    s[k].r:=x1
  else
    Dec(k);
  if mm and (x2 <> s[m].r) then
    s[m].l:=x2
  else
    Inc(m);
  if (x1 <= s[1].l) and (x2 >= s[topS].r) then
    Begin
      topS:=0;
      Exit;
    end;
  if (x1 <= s[1].l) then
    Begin
      for i:=m to topS do
        s[i-m+1]:=s[i];
      topS:=topS-m+1
    end
  else
    if (x2 >= s[topS].r) then
      topS:=k
    else
      Begin
        for i:=m to topS do
          s[k+i-m+1]:=s[i];
        topS:=topS-m+k+1;
      end;
  DeleteDot;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        ReadLn(x[i],y[i],w[i],d[i],h[i]);
      topV:=0;
      for i:=1 to N do
        Begin
          S[1].l:=x[i];
          S[1].r:=x[i]+w[i];
          topS:=1;
          for j:=1 to N do
            if (i <> j) and (h[i] <= h[j]) and (y[i] > y[j]) then
              Begin
                Cross(x[j],x[j]+w[j]);
                if topS = 0 then
                  Break;
              end;
          if topS > 0 then
            Begin
              Inc(topV);
              v[topV]:=i;
            end;
        end;
      for i:=1 to topV-1 do
        for j:=i+1 to topV do
          if (x[v[i]] > x[v[j]]) or
             ((x[v[i]] = x[v[j]]) and (y[v[i]] > y[v[j]])) then
               Begin
                 buf:=v[i];
                 v[i]:=v[j];
                 v[j]:=buf;
               end;
      ReadLn(N);
      Inc(map);
      WriteLn('For map #',map,', the visible buildings are numbered as follows:');
      for i:=1 to topV do
        Write(v[i],' ');
      WriteLn;
      if N <> 0 then
        WriteLn;
    end;
end.