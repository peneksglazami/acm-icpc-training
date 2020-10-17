{Problem: 315 - Network
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem315 (input, output);
Var
  A: Array [1..100,1..100] of Boolean;
  Num,Low: Array [1..100] of Integer;
  Critical: Set of 1..100;
  i,N,X,Y,nm,CriticalNumber: Integer;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Procedure Find(v,p: Integer);
Var
  j,k: Integer;
Begin
  Inc(nm);
  Num[v]:=nm;
  Low[v]:=Num[v];
  k:=0;
  for j:=1 to N do
    if A[v,j] then
      if Num[j] = 0 then
        Begin
          Inc(k);
          Find(j,v);
          Low[v]:=Min(Low[v],Low[j]);
          if p <> 0 then
            Begin
              if Low[j] >= Num[v] then
                Critical:=Critical+[v]
            end
          else
            if k > 1 then
              Critical:=Critical+[v];
        end
      else
        if (j <> p) and (Num[v] > Num[j]) then
          Low[v]:=Min(Low[v],Num[j]);
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(A,SizeOf(A),False);
      Read(X);
      While X <> 0 do
        Begin
          While not EOLn do
            Begin
              Read(Y);
              A[X,Y]:=True;
              A[Y,X]:=True;
            end;
          ReadLn;
          Read(X);
        end;
      ReadLn;
      FillChar(Num,SizeOf(Num),0);
      FillChar(Low,SizeOf(Low),0);
      nm:=0;
      Critical:=[];
      Find(1,0);
      CriticalNumber:=0;
      for i:=1 to N do
        if i in Critical then
          Inc(CriticalNumber);
      WriteLn(CriticalNumber);
      ReadLn(N);
    end;
end.