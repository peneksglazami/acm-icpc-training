{Problem: 821 - Page Hopping
 Problem F - ACM World Finals 2000
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem821 (input, output);
Var
  D: Array [1..100,1..100] of Integer;
  Nods: Set of 1..100;
  Sum: LongInt;
  i,j,m,n_case,a,b,N: Integer;

Begin
  n_case:=1;
  Read(a,b);
  While (a <> 0) or (b <> 0) do
    Begin
      for i:=1 to 100 do
        for j:=1 to 100 do
          D[i,j]:=MaxInt div 2;
      for i:=1 to 100 do
        D[i,i]:=0;
      Nods:=[];
      N:=0;
      While (a <> 0) or (b <> 0) do
        Begin
          if not (a in Nods) then
            Begin
              Inc(N);
              Nods:=Nods+[a];
            end;
          if not (b in Nods) then
            Begin
              Inc(N);
              Nods:=Nods+[b];
            end;
          D[a,b]:=1;
          Read(a,b);
        end;
      ReadLn;
      for m:=1 to 100 do
        if (m in Nods) then
          for i:=1 to 100 do
            if (i in Nods) then
              for j:=1 to 100 do
                if (j in Nods) then
                  if D[i,j] > D[i,m] + D[m,j] then
                    D[i,j]:=D[i,m]+D[m,j];
      Sum:=0;
      for i:=1 to 100 do
        for j:=1 to 100 do
          if D[i,j] < (MaxInt div 2) then
            Inc(Sum,D[i,j]);
      WriteLn('Case ',n_case,': average length between pages = ',Sum/(N*(N-1)):0:3,' clicks');
      Read(a,b);
      Inc(n_case);
    end;
end.