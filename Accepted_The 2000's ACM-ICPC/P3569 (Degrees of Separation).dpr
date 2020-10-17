{Problem 3569 - Degrees of Separation
 World Finals - San Antonio - Texas - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3569;
{$APPTYPE CONSOLE}
Const
  MaxP = 50;

Var
  a: Array [1..MaxP,1..MaxP] of Integer;
  Name: Array [1..MaxP] of String;
  i,j,m,Max,p_cnt,r_cnt,P,R,n_case: Integer;
  St,S1,S2: String;
  first: Boolean;

Procedure Trim(Var St: String);
Begin
  While (Length(St) > 0) and (St[1] = ' ') do
    Delete(St,1,1);
  While (Length(St) > 0) and (St[Length(St)] = ' ') do
    Delete(St,Length(St),1);
end;

Function NextWord(Var St: String): String;
Begin
  St:=St+' ';
  Result:=Copy(St,1,Pos(' ',St)-1);
  Delete(St,1,Pos(' ',St));
end;

Function Num(St: String): Integer;
Var
  i: Integer;
Begin
  for i:=1 to p_cnt do
    if St = Name[i] then
      Begin
        Result:=i;
        Exit;
      end;
  Inc(p_cnt);
  Name[p_cnt]:=St;
  Result:=p_cnt;
end;

Begin
  ReadLn(P,R);
  n_case:=0;
  While (P <> 0) or (R <> 0) do
    Begin
      p_cnt:=0;
      r_cnt:=0;
      for i:=1 to P do
        for j:=1 to P do
          a[i,j]:=MaxInt div 2;
      for i:=1 to P do
        a[i,i]:=0;
      St:='';
      first:=True;
      Repeat
        if St = '' then
          Repeat
            ReadLn(St);
            Trim(St);
          Until St <> '';
        if first then
          begin
            S1:=NextWord(St);
            Trim(St);
            if St <> '' then
              Begin
                S2:=NextWord(St);
                Trim(St);
                a[Num(S1),Num(S2)]:=1;
                a[Num(S2),Num(S1)]:=1;
                Inc(r_cnt);
              end
            else
              first:=False;
          end
        else
          begin
            S2:=NextWord(St);
            Trim(St);
            a[Num(S1),Num(S2)]:=1;
            a[Num(S2),Num(S1)]:=1;
            first:=True;
            Inc(r_cnt);
          end;
      Until r_cnt = R;
      for m:=1 to P do
        for i:=1 to P do
          for j:=1 to P do
            if a[i,j] > a[i,m]+a[m,j] then
              a[i,j]:=a[i,m]+a[m,j];
      Max:=0;
      for i:=1 to P do
        for j:=1 to P do
          if a[i,j] > Max then
            Max:=a[i,j];
      Inc(n_case);
      if Max = MaxInt div 2 then
        WriteLn('Network ',n_case,': DISCONNECTED')
      else
        WriteLn('Network ',n_case,': ',Max);
      WriteLn;
      ReadLn(P,R);
    end;
end.