{Problem: 2583 - Increasing Sequences
 ACM ICPC - North America - East Central - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2583;
Var
  b,best: Array [1..80] of String;
  St: String;
  Find: Boolean;
  i,j,best_cnt,b_cnt: Integer;

Function Less(S1,S2: String): Boolean;
Begin
  While (Length(S1) > 1) and (S1[1] = '0') do
    Delete(S1,1,1);
  While (Length(S2) > 1) and (S2[1] = '0') do
    Delete(S2,1,1);
  Less:=(Length(S1) < Length(S2)) or ((Length(S1) = Length(S2)) and (S1 < S2));
end;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Function BestLessB: Boolean;
Var
  i: Integer;
Begin
  if Less(b[1],best[1]) then
    Begin
      Result:=True;
      Exit;
    end;
  Result:=True;
  for i:=1 to Max(best_cnt,b_cnt)-1 do
    if Less(best[best_cnt-i+1],b[b_cnt-i+1]) then
      Exit
    else
      if Less(b[b_cnt-i+1],best[best_cnt-i+1]) then
        Begin
          Result:=False;
          Exit;
        end;
  Result:=False;
end;

Function Zero(St: String): Boolean;
Var
  i: Integer;
Begin
  Result:=False;
  for i:=1 to Length(St) do
    if St[i] <> '0' then
      Exit;
  Result:=True;
end;

Procedure Rec(St,Last: String);
Var
  i: Integer;
  S: String;
Begin
  if St = '' then
    Begin
      if (best_cnt = 0) or BestLessB then
        Begin
          best_cnt:=b_cnt;
          for i:=1 to best_cnt do
            best[i]:=b[i];
        end;
    end
  else
    Begin
      S:='';
      for i:=Length(St) downto 1 do
        Begin
          S:=St[i]+S;
          if Less(S,Last) then
            Begin
              Inc(b_cnt);
              b[b_cnt]:=S;
              Rec(Copy(St,1,i-1),S);
              Dec(b_cnt);
            end
          else
            Exit;
        end;
    end;
end;

Begin
  ReadLn(St);
  While St <> '0' do
    Begin
      best_cnt:=0;
      b_cnt:=1;
      b[1]:='';
      for i:=Length(St) downto 1 do
        Begin
          if (best_cnt > 0) and (St[i] <> '0') then
            Break;
          b[1]:=St[i]+b[1];
          Rec(Copy(St,1,i-1),b[1]);
        end;
      if best_cnt > 0 then
        Begin
          if (best_cnt = 2) and Zero(best[2]) then
            Write(St)
          else
            Begin
              Write(best[best_cnt]);
              for j:=best_cnt-1 downto 1 do
                Write(',',best[j]);
            end;
        end;
      WriteLn;
      ReadLn(St);
    end;
end.