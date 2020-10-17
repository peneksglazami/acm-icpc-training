{ACM ICPC 2004-2004, Northeastern European Regional Contest
 Problem E - Easy Trading
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem3217;
{$APPTYPE CONSOLE}
Var
  P: Array [1..10000] of Double;
  Pn,Pm,SPn,SPm,OldPn,OldPm: Double;
  i,m,n,k: Integer;

Begin
  Repeat
    ReadLn(m,n,k);
    for i:=1 to k do
      ReadLn(P[i]);
    SPn:=0;
    SPm:=0;
    for i:=1 to n do
      SPn:=SPn+P[i];
    for i:=n-m+1 to n do
      SPm:=SPm+P[i];
    Pn:=SPn/n;
    Pm:=SPm/m;
    if Pn > Pm then
      WriteLn('SELL ON DAY ',n)
    else
      WriteLn('BUY ON DAY ',n);
    OldPn:=Pn;
    OldPm:=Pm;
    for i:=n+1 to k do
      Begin
        SPn:=SPn-P[i-n]+P[i];
        SPm:=SPm-P[i-m]+P[i];
        Pn:=SPn/n;
        Pm:=SPm/m;
        if (Pn > Pm) and (OldPn < OldPm) then
          WriteLn('SELL ON DAY ',i);
        if (Pn < Pm) and (OldPn > OldPm) then
          WriteLn('BUY ON DAY ',i);
        OldPn:=Pn;
        OldPm:=Pm;
      end;
    if not EOF then
      Begin
        WriteLn;
        ReadLn;
      end;
  Until EOF;
end.