{Problem: 674 - Coin Change
 Author: Miguel Revilla
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem674 (input, output);
Const
  Coins: Array [1..5] of Integer = (1,5,10,25,50);

Var
  NWays: Array [0..7489] of LongInt;
  i,j,c,N: Integer;

Begin
  FillChar(NWays,SizeOf(NWays),0);
  NWays[0]:=1;
  for i:=1 to 5 do
    Begin
      c:=Coins[i];
      for j:=c to 7489 do
        Inc(NWays[j],NWays[j-c]);
    end;
  While not EOF do
    Begin
      ReadLn(N);
      WriteLn(NWays[N]);
    end;
end.