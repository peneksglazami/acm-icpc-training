{Problem: 374 - Big Mod
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem374 (input,output);
Var
  B,P,M: LongInt;

Function BigMod(B,P,M: LongInt): LongInt;
Begin
  if M = 1 then
    BigMod:=0
  else
    if P = 0 then
      BigMod:=1
    else
      if not Odd(P) then
        BigMod:=Sqr(BigMod(B,P div 2,M)) mod M
      else
        BigMod:=((B mod M)*BigMod(B,P-1,M)) mod M;
end;

Begin
  While not EOF do
    Begin
      ReadLn(B);
      ReadLn(P);
      ReadLn(M);
      WriteLn(BigMod(B,P,M));
      if not EOF then
        ReadLn;
    end;
end.