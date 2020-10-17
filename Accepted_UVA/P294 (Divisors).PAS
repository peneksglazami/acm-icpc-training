{Problem: 294 - Divisors
 Northwestern European Regionals - 1994 - Problem C
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem294 (input,output);
Const
  MaxN = 1000000000;
  MaxNN = 25000;

Var
  Prime: Array [0..3441] of LongInt;
  P: Array [1..MaxNN] of Integer;
  i,j,N,L,U,Max,MaxDiv: LongInt;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(Prime,SizeOf(Prime),0);
  for i:=2 to Round(Sqrt(MaxN))+1 do
    Begin
      Ok:=True;
      j:=1;
      While Ok and (j <= Prime[0]) and (Sqr(Prime[j]) < i) do
        Begin
          Ok:=(i mod Prime[j]) <> 0;
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(Prime[0]);
          Prime[Prime[0]]:=i;
        end;
    end;
end;

Function NumDivisors(N: LongInt; Key: Boolean): Integer;
Var
  i,Res,Alpha: LongInt;
Begin
  Res:=1;
  i:=1;
  While (N > 1) and (i <= Prime[0]) do
    Begin
      Alpha:=1;
      While N mod Prime[i] = 0 do
        Begin
          N:=N div Prime[i];
          Inc(Alpha);
        end;
      Res:=Res*Alpha;
      if (Sqr(Prime[i]) > N) then
        Break;
      if Key and (N <= MaxNN) then
        Begin
          Res:=Res*p[N];
          N:=1;
          Break;
        end;
      Inc(i);
    end;
  if N > 1 then
    Res:=2*Res;
  NumDivisors:=Res;
end;

Begin
  CreatePrime;
  for i:=1 to MaxNN do
    P[i]:=NumDivisors(i,False);
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(L,U);
      Max:=L;
      MaxDiv:=NumDivisors(L,True);
      for j:=L+1 to U do
        if NumDivisors(j,True) > MaxDiv then
          Begin
            MaxDiv:=NumDivisors(j,True);
            Max:=j;
          end;
      WriteLn('Between ',L,' and ',U,', ',Max,' has a maximum of ',MaxDiv,' divisors.');
    end;
end.