{Problem: 10003 - Cutting Sticks
 Author: Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10003 (input,output);
Const
  MaxN = 50;

Var
  d: Array [1..MaxN+2] of Integer;
  tt: Array [1..MaxN+2,1..MaxN+2] of LongInt;
  i,j,L,N: Integer;

Function t(n,m: Integer): LongInt;
Var
  i: Integer;
Begin
  if tt[n,m] = -1 then
    Begin
      tt[n,m]:=MaxLongInt;
      for i:=n+1 to m-1 do
        if tt[n,m] > t(n,i)+t(i,m)+d[m]-d[n] then
          tt[n,m]:=t(n,i)+t(i,m)+d[m]-d[n];
    end;
  t:=tt[n,m];
end;

Begin
  ReadLn(L);
  While L > 0 do
    Begin
      ReadLn(N);
      d[1]:=0;
      d[n+2]:=L;
      for i:=1 to N do
        Read(d[i+1]);
      ReadLn;
      for i:=1 to N+1 do
        for j:=i+1 to N+2 do
          tt[i,j]:=-1;
      for i:=1 to N+1 do
        tt[i,i+1]:=0;
      WriteLn('The minimum cutting is ',t(1,n+2),'.');
      ReadLn(L);
    end;
end.