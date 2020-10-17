{Problem: 211 - The Domino Effect
 ACM ICPC World Finals - 1991 - Problem D
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem211 (input,output);
Var
  t: Array [1..7,1..8] of Record ind: Integer; a: Array [1..4] of Integer; end;
  a,s: Array [1..7,1..8] of Integer;
  k: Array [1..28] of Integer;
  b: Array [1..28] of Boolean;
  i,j,nsol,n_case: Integer;

Function Num(a,b: Integer): Integer;
Const
  n: Array [0..6] of Integer = (1,8,14,19,23,26,28);
Var
  buf: Integer;
Begin
  if a > b then
    Begin
      buf:=a;
      a:=b;
      b:=buf;
    end;
  Num:=n[a]+b-a;
end;

Procedure FillT;
Var
  i,j,ind1,ind2: Integer;
Begin
  FillChar(t,SizeOf(t),0);
  FillChar(k,SizeOf(k),0);
  for i:=1 to 7 do
    for j:=1 to 8 do
      Begin
        if i < 7 then
          Begin
            Inc(t[i,j].ind);
            Inc(t[i+1,j].ind);
            ind1:=t[i,j].ind;
            ind2:=t[i+1,j].ind;
            t[i,j].a[ind1]:=num(a[i,j],a[i+1,j]);
            t[i+1,j].a[ind2]:=t[i,j].a[ind1];
            Inc(k[t[i,j].a[ind1]],2);
          end;
        if j < 8 then
          Begin
            Inc(t[i,j].ind);
            Inc(t[i,j+1].ind);
            ind1:=t[i,j].ind;
            ind2:=t[i,j+1].ind;
            t[i,j].a[ind1]:=num(a[i,j],a[i,j+1]);
            t[i,j+1].a[ind2]:=t[i,j].a[ind1];
            Inc(k[t[i,j].a[ind1]],2);
          end;
      end;
end;

Procedure Solve(ki,kj,kn: Integer);
Var
  mm1,mm2: Set of 1..28;
  i,j,g,h,m: Integer;
  Ok: Boolean;
Begin
  if kn = 0 then
    Begin
      Inc(nsol);
      for i:=1 to 7 do
        Begin
          for j:=1 to 8 do
            Write(s[i,j]:4);
          WriteLn;
        end;
      WriteLn;
    end
  else
    Begin
      i:=ki; j:=kj;
      While s[i,j] <> 0 do
        if j < 8 then
          Inc(j)
        else
          Begin
            Inc(i);
            j:=1;
          end;
      mm1:=[];
      mm2:=[];
      for g:=1 to t[i,j].ind do
        if not b[t[i,j].a[g]] then
          Begin
            if j < 8 then
              if s[i,j+1] = 0 then
                for h:=1 to t[i,j+1].ind do
                  if (t[i,j].a[g] = t[i,j+1].a[h])
                    and not (t[i,j].a[g] in mm1) then
                    Begin
                      mm1:=mm1+[t[i,j].a[g]];
                      Ok:=True;
                      for m:=1 to t[i,j].ind do
                        if not b[t[i,j].a[m]] then
                          Begin
                            Dec(k[t[i,j].a[m]]);
                            if (t[i,j].a[m] <> t[i,j].a[g]) and
                               (k[t[i,j].a[m]] <= 0) then
                                 Ok:=False;
                          end;
                      for m:=1 to t[i,j+1].ind do
                        if not b[t[i,j+1].a[m]] then
                          Begin
                            Dec(k[t[i,j+1].a[m]]);
                            if (t[i,j+1].a[m] <> t[i,j].a[g]) and
                               (k[t[i,j+1].a[m]] <= 0) then
                                 Ok:=False;
                          end;
                      if Ok then
                        Begin
                          b[t[i,j].a[g]]:=True;
                          s[i,j]:=t[i,j].a[g];
                          s[i,j+1]:=s[i,j];
                          Solve(i,j,kn-1);
                          s[i,j+1]:=0;
                          s[i,j]:=0;
                          b[t[i,j].a[g]]:=False;
                        end;
                      for m:=1 to t[i,j].ind do
                        if not b[t[i,j].a[m]] then
                          Inc(k[t[i,j].a[m]]);
                      for m:=1 to t[i,j+1].ind do
                        if not b[t[i,j+1].a[m]] then
                          Inc(k[t[i,j+1].a[m]]);
                    end;
            if i < 7 then
              if s[i+1,j] = 0 then
                for h:=1 to t[i+1,j].ind do
                  if (t[i,j].a[g] = t[i+1,j].a[h])
                    and not (t[i,j].a[g] in mm2) then
                    Begin
                      mm2:=mm2+[t[i,j].a[g]];
                      Ok:=True;
                      for m:=1 to t[i,j].ind do
                        if not b[t[i,j].a[m]] then
                          Begin
                            Dec(k[t[i,j].a[m]]);
                            if (t[i,j].a[m] <> t[i,j].a[g]) and
                               (k[t[i,j].a[m]] <= 0) then
                                 Ok:=False;
                          end;
                      for m:=1 to t[i+1,j].ind do
                        if not b[t[i+1,j].a[m]] then
                          Begin
                            Dec(k[t[i+1,j].a[m]]);
                            if (t[i+1,j].a[m] <> t[i,j].a[g]) and
                               (k[t[i+1,j].a[m]] <= 0) then
                                 Ok:=False;
                          end;
                      if Ok then
                        Begin
                          b[t[i,j].a[g]]:=True;
                          s[i,j]:=t[i,j].a[g];
                          s[i+1,j]:=s[i,j];
                          Solve(i,j,kn-1);
                          s[i+1,j]:=0;
                          s[i,j]:=0;
                          b[t[i,j].a[g]]:=False;
                        end;
                      for m:=1 to t[i,j].ind do
                        if not b[t[i,j].a[m]] then
                          Inc(k[t[i,j].a[m]]);
                      for m:=1 to t[i+1,j].ind do
                        if not b[t[i+1,j].a[m]] then
                          Inc(k[t[i+1,j].a[m]]);
                    end;
          end;
    end;
end;

Begin
  While not EOF do
    Begin
      for i:=1 to 7 do
        Begin
          for j:=1 to 8 do
            Read(a[i,j]);
          ReadLn;
        end;
      FillT;
      Inc(n_case);
      WriteLn('Layout #',n_case,':');
      WriteLn;
      for i:=1 to 7 do
        Begin
          for j:=1 to 8 do
            Write(a[i,j]:4);
          WriteLn;
        end;
      WriteLn;
      WriteLn('Maps resulting from layout #',n_case,' are:');
      WriteLn;
      nsol:=0;
      Solve(1,1,28);
      WriteLn('There are ',nsol,' solution(s) for layout #',n_case,'.');
      if not EOF then
        Begin
          WriteLn;
          WriteLn;
          WriteLn;
        end;
    end;
end.