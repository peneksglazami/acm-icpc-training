{Problem: 10139 - Factovisors
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10139 (input,output);
Var
  p: Array [0..4792] of Word;
  i,j,k,n,m: LongInt;
  Ok: Boolean;

Procedure CreatePrime;
Var
  i,j: Word;
  Ok: Boolean;
Begin
  p[0]:=1;
  p[1]:=2;
  i:=3;
  While i < Round(Sqrt(MaxLongInt)) do
    Begin
      Ok:=True;
      j:=1;
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
      Inc(i,2);
    end;
end;

Function InN(pp: LongInt): LongInt;
Var
  k,ppp: LongInt;

Begin
  ppp:=pp;
  k:=0;
  While N >= ppp do
    Begin
      Inc(k,N div ppp);
      if ppp < p[p[0]] then
        ppp:=ppp*pp
      else
        Break;
    end;
  InN:=k;
end;

Begin
  CreatePrime;
  While not EOF do
    Begin
      ReadLn(n,m);
      i:=1;
      Ok:=True;
      Write(m);
      While (m > 1) and (i <= p[0]) and Ok do
        Begin
          if m mod p[i] = 0 then
            Begin
              k:=0;
              While m mod p[i] = 0 do
                Begin
                  m:=m div p[i];
                  Inc(k);
                end;
              Ok:=Ok and (k <= InN(p[i]))
            end;
          Inc(i);
        end;
      if Ok then
        if m > 1 then
          if m > n then
            WriteLn(' does not divide ',n,'!')
          else
            WriteLn(' divides ',n,'!')
        else
          WriteLn(' divides ',n,'!')
      else
        WriteLn(' does not divide ',n,'!');
    end;
end.