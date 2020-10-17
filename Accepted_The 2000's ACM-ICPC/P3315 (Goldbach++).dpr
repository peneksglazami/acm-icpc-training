{Problem: 3315 - Goldbach++
 ACM ICPC - North America - Southeast - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3315 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 1000;
  MaxT = 14;
  MaxP = 335;

Type
  Mas = Array [1..MaxT] of Integer;

Var
  a: Array [0..MaxN,0..MaxT] of Mas;
  f: Array [1..MaxN,1..MaxT] of Boolean;
  b: Array [1..MaxN*MaxT] of Record n: Integer; t: Byte; end;
  p: Array [0..MaxP] of Integer;
  i,j,g,N,T,b_cnt,b_cnt_next: Integer;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  p[0]:=1;
  p[1]:=2;
  i:=3;
  While i <= MaxN do
    Begin
      j:=1;
      Ok:=True;
      While Ok and (j <= p[0]) and (Sqr(p[j]) <= i) do
        Begin
          Ok:=i mod p[j] <> 0;
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(p[0],2);
          p[p[0]-1]:=i;
          p[p[0]]:=i;
        end;
      Inc(i,2);
    end;
end;

Function Less(a,b: Mas; n: Integer): Boolean;
Var
  i: Integer;
Begin
  i:=1;
  While (i <= n) and (a[i] = b[i]) do
    Inc(i);
  Result:=(i > n) or (a[i] < b[i]);
end;

Begin
  CreatePrime;
  FillChar(f,SizeOf(f),False);
  b_cnt:=1;
  b[b_cnt].n:=0;
  b[b_cnt].t:=0;
  b_cnt_next:=1;
  for i:=1 to p[0] do
    Begin
      for j:=1 to b_cnt do
        if (b[j].n+p[i] <= MaxN) and (b[j].t < MaxT) then
          Begin
            if not f[b[j].n+p[i],b[j].t+1] then
              Begin
                Inc(b_cnt_next);
                b[b_cnt_next].n:=b[j].n+p[i];
                b[b_cnt_next].t:=b[j].t+1;
                for g:=1 to b[j].t do
                  a[b[j].n+p[i],b[j].t+1][g]:=a[b[j].n,b[j].t][g];
                a[b[j].n+p[i],b[j].t+1][b[j].t+1]:=p[i];
                f[b[j].n+p[i],b[j].t+1]:=True;
              end
            else
              if Less(a[b[j].n,b[j].t],a[b[j].n+p[i],b[j].t+1],b[j].n) then
                Begin
                  for g:=1 to b[j].t do
                    a[b[j].n+p[i],b[j].t+1][g]:=a[b[j].n,b[j].t][g];
                  a[b[j].n+p[i],b[j].t+1][b[j].t+1]:=p[i];
                end;
          end;
      b_cnt:=b_cnt_next;
    end;
  ReadLn(N,T);
  While (N <> 0) or (T <> 0) do
    Begin
      if not f[N,T] then
        WriteLn('No Solution')
      else
        Begin
          Write(N,' = ');
          for i:=1 to T-1 do
            Write(a[N,T][i],'+');
          WriteLn(a[N,T][T]);
        end;
      ReadLn(N,T);
    end;
end.