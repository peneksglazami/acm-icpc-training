{Problem: 10880 - Colin and Ryan
 Problemsetter: Igor Naverniouk
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10880 (input, output);
Var
  p: Array [0..5000] of LongInt;
  m: Array [0..30] of Integer;
  pp: Array [0..30] of LongInt;
  d: Array [0..500] of LongInt;
  i,j,N,C,R,NN,n_case: LongInt;

Procedure Sort(l,r: Integer);
Var
  i,j: Integer;
  buf,x: LongInt;
Begin
  i:=l;
  j:=r;
  x:=d[(l+r) div 2];
  Repeat
    While d[i] < x do Inc(i);
    While x < d[j] do Dec(j);
    if i <= j then
      Begin
        buf:=d[i]; d[i]:=d[j]; d[j]:=buf;
        Inc(i); Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Procedure Prime;
Var
  i,j: LongInt;
  Ok: Boolean;
Begin
  p[0]:=0;
  for i:=2 to Round(Sqrt(MaxLongInt)) do
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
          Inc(p[0]);
          p[p[0]]:=i;
        end;
    end;
end;

Procedure FindDivisor(i: Integer; p: LongInt);
Var
  j: Integer;
Begin
  if i = m[0]+1 then
    Begin
      Inc(d[0]);
      d[d[0]]:=p;
    end
  else
    Begin
      FindDivisor(i+1,p);
      for j:=1 to m[i] do
        Begin
          p:=p*pp[i];
          FindDivisor(i+1,p);
        end;
    end;
end;

Begin
  Prime;
  ReadLn(N);
  n_case:=0;
  While N > 0 do
    Begin
      ReadLn(C,R);
      NN:=C-R;
      Inc(n_case);
      Write('Case #',n_case,':');
      if NN = 0 then
        WriteLn(' 0')
      else
        Begin
          FillChar(m,SizeOf(m),0);
          FillChar(d,SizeOf(d),0);
          FillChar(pp,SizeOf(pp),0);
          i:=1;
          While (NN > 1) and (i <= p[0]) do
            Begin
              if NN mod p[i] = 0 then
                Begin
                  Inc(m[0]);
                  Inc(pp[0]);
                  pp[pp[0]]:=p[i];
                  While NN mod p[i] = 0 do
                    Begin
                      Inc(m[m[0]]);
                      NN:=NN div p[i];
                    end;
                end;
              Inc(i);
            end;
          if NN > 1 then
            Begin
              Inc(m[0]);
              m[m[0]]:=1;
              Inc(pp[0]);
              pp[pp[0]]:=NN;
            end;
          FindDivisor(1,1);
          Sort(1,d[0]);
          for i:=1 to d[0] do
            if d[i] > R then
              Write(' ',d[i]);
          WriteLn;
        end;
      Dec(N);
    end;
end.