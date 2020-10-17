{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10892 (input,output);
Var
  p: Array [0..5000] of LongInt;
  m,pp: Array [0..30] of LongInt;
  d: Array [0..1024] of LongInt;
  i,j,N,NN,amount: LongInt;

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

Function GCD(a,b: LongInt): LongInt;
Var
  nd: LongInt;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Function LCM(a,b: LongInt): LongInt;
Begin
  LCM:=(a div GCD(a,b))*b;
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
  While N > 0 do
    Begin
      FillChar(m,SizeOf(m),0);
      FillChar(d,SizeOf(d),0);
      FillChar(pp,SizeOf(pp),0);
      NN:=N;
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
      amount:=0;
      for i:=1 to d[0] do
        for j:=i to d[0] do
          if LCM(d[i],d[j]) = N then
            Inc(amount);
      WriteLn(N,' ',amount);
      ReadLn(N);
    end;
end.