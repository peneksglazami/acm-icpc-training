{Problem: 147 - Dollars
 Solution: Andrey Grigorov}
 
{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem147 (input, output);
{$APPTYPE CONSOLE}
Const
  Coins: Array [1..11] of Integer = (1,2,4,10,20,40,100,200,400,1000,2000);

Var
  NWays: Array [0..6000] of Int64;
  M: Real;
  i,j,c,N: Integer;
  St: String;

Begin
  NWays[0]:=1;
  for i:=1 to 11 do
    Begin
      c:=Coins[i];
      for j:=c to 6000 do
        Inc(NWays[j],NWays[j-c]);
    end;
  ReadLn(M);
  While M <> 0 do
    Begin
      N:=Round(M*100) div 5;
      if M < 100 then
        Write(' ');
      if M < 10 then
        Write(' ');
      Write(M:0:2);
      Str(NWays[N],St);
      While Length(St) < 17 do
        St:=' '+St;
      WriteLn(St);
      ReadLn(M);
    end;
end.
