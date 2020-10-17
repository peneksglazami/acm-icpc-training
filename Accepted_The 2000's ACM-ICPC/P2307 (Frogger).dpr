{Problem: 2307 - Frogger
 ACM ICPC - North America - South Central - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2307;
{$APPTYPE CONSOLE}
Var
  v,vv: Array [1..80] of Record r,c,s: Integer; end;
  i,j,s,f_c,f_r,v_cnt: Integer;
  St: String;
  Ok: Boolean;

Function InCell(r,c: Integer): Boolean;
Var
  i: Integer;
Begin
  Result:=True;
  for i:=1 to v_cnt do
    if (vv[i].r = r) and (vv[i].c = c) then
      Exit;
  Result:=False;    
end;

Function right(i: Integer): Integer;
Begin
  if i < 10 then
    Result:=i+1
  else
    Result:=1;
end;

Function left(i: Integer): Integer;
Begin
  if i > 1 then
    Result:=i-1
  else
    Result:=10;
end;

Begin
  ReadLn(St);
  While (St = 'START') and not EOF do
    Begin
      v_cnt:=0;
      for i:=1 to 8 do
        Begin
          for j:=1 to 10 do
            Begin
              Read(s);
              if s <> 0 then
                Begin
                  Inc(v_cnt);
                  v[v_cnt].r:=i;
                  v[v_cnt].c:=j;
                  v[v_cnt].s:=s;
                end;
             end;
          ReadLn;
        end;
      ReadLn(St);
      Ok:=False;
      f_c:=1;
      While not Ok and (f_c <= 8) do
        Begin
          vv:=v;
          f_r:=0;
          Ok:=True;
          While Ok and (f_r < 8) do
            Begin
              Inc(f_r);
              if InCell(f_r,f_c) then
                Ok:=False
              else
                for i:=1 to v_cnt do
                  if vv[i].r < 5 then
                    for j:=1 to vv[i].s do
                      Begin
                        vv[i].c:=left(vv[i].c);
                        if (f_r = vv[i].r) and (f_c = vv[i].c) then
                          Ok:=False;
                      end
                  else
                    for j:=1 to vv[i].s do
                      Begin
                        vv[i].c:=right(vv[i].c);
                        if (f_r = vv[i].r) and (f_c = vv[i].c) then
                          Ok:=False;
                      end;
            end;
          Inc(f_c);
        end;
      if Ok then
        WriteLn('LEFTOVER POSSUM')
      else
        WriteLn('FROGGER');
      if not EOF then
        ReadLn(St);
    end;
end.